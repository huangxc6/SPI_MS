
`timescale 1ns/1ps
module tb_spi_ms (); 

	// clock
	logic m_clk;
	initial begin
		m_clk = '0;
		forever #(20) m_clk = ~m_clk;
	end

	logic s_clk;
	initial begin
		s_clk = '0;
		#2
		s_clk = '1;
		forever #(20) s_clk = ~s_clk;
	end

	// asynchronous reset
	logic rst_n;
	initial begin
		rst_n <= '0;
		#80
		rst_n <= '1;
	end

	logic [1:0] m_sfraddr_w;
	logic       m_sfrwe;
	logic [7:0] m_spidata_i;
	logic [2:0] m_sfraddr_r;
	logic [7:0] m_sfr_data_o;
	logic [7:0] m_spssn_i;
	logic [7:0] m_spssn_o;
	logic       m_ssn;

	wire       mosi;
	wire       miso;
	wire       sck;

	logic [1:0] s_sfraddr_w;
	logic       s_sfrwe;
	logic [7:0] s_spidata_i;
	logic [2:0] s_sfraddr_r;
	logic [7:0] s_sfr_data_o;
	logic [7:0] s_spssn_i;
	logic [7:0] s_spssn_o;

	logic       s_ssn;

	spi_ms inst_spi_ms_master
		(
			.clk        (m_clk),
			.rst_n      (rst_n),
			.sfraddr_w  (m_sfraddr_w),
			.sfrwe      (m_sfrwe),
			.spidata_i  (m_spidata_i),
			.sfraddr_r  (m_sfraddr_r),
			.sfr_data_o (m_sfr_data_o),
			.spssn_i    (m_spssn_i),
			.spssn_o    (m_spssn_o),
			.mosi       (mosi),
			.miso       (miso),
			.sck        (sck),
			.ssn        (m_ssn)
		);

	assign s_ssn = m_spssn_o[0] ;

	spi_ms inst_spi_ms_slave
		(
			.clk        (s_clk),
			.rst_n      (rst_n),
			.sfraddr_w  (s_sfraddr_w),
			.sfrwe      (s_sfrwe),
			.spidata_i  (s_spidata_i),
			.sfraddr_r  (s_sfraddr_r),
			.sfr_data_o (s_sfr_data_o),
			.spssn_i    (s_spssn_i),
			.spssn_o    (s_spssn_o),
			.mosi       (mosi),
			.miso       (miso),
			.sck        (sck),
			.ssn        (s_ssn)
		);

	task init();
		m_sfraddr_w <= '0;
		m_sfrwe     <= '0;
		m_spidata_i <= '0;
		m_sfraddr_r <= '0;
		m_spssn_i   <= 8'hff;
		m_ssn       <= '1;
		s_sfraddr_w <= '0;
		s_sfrwe     <= '0;
		s_spidata_i <= '0;
		s_sfraddr_r <= '0;
		s_spssn_i   <= 8'hff;
	endtask

	task spssn_test();
		for (int i = 0; i < 256; i++) begin
			m_spssn_i <= i ;
			s_spssn_i <= i ;
			@(posedge m_clk) ;
		end
	endtask

	task sfr_data_o_test();
		for (int i = 0; i < 8; i++) begin
			m_sfraddr_r <= i ;
			s_sfraddr_r <= i ;
		end
	endtask

	task set_mode_m(int mode_sel_m, int m_spibr);
		m_sfrwe     <= '1;
		@(posedge m_clk);
		m_sfraddr_w <= 2'b00;
		m_sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		m_spidata_i <= mode_sel_m; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b01;
		m_sfraddr_r <= 3'b001;
		m_spidata_i <= 8'b0000_0001;
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b10;
		m_sfraddr_r <= 3'b010;
		m_spidata_i <= {1'b0, m_spibr[5:3], 1'b0, m_spibr[2:0]};	// m_clk / 16
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b11;
		m_sfraddr_r <= 3'b011;
		m_spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge m_clk);
		read_sfr();
	endtask

	task set_mode_s(int mode_sel_s);
		s_sfrwe     <= '1;
		@(posedge s_clk);
		s_sfraddr_w <= 2'b00;
		s_sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		s_spidata_i <= mode_sel_s; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b01;
		s_sfraddr_r <= 3'b001;
		s_spidata_i <= 8'b0000_0001;
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b10;
		s_sfraddr_r <= 3'b010;
		s_spidata_i <= 8'b0000_0011;	// clk / 16
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b11;
		s_sfraddr_r <= 3'b011;
		s_spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge s_clk);
		read_sfr();
	endtask

	int m_spibr_post2 ;
	task transfer_data_master_slave(int iter_ms, int m_spibr);
		for(int it = 0; it < iter_ms; it++) begin
			m_spidata_i <= $urandom_range(0,255);
			s_spidata_i <= $urandom_range(0,255);
			repeat(2)@(posedge m_clk);
			m_spssn_i  <= 8'hfe;
			m_spibr_post2 = m_spibr[2:0] ;
			repeat((m_spibr[5:3]+1) * $pow(2,m_spibr_post2+1) * 8 + 3)@(posedge m_clk);
			m_spssn_i  <= 8'hff;
			repeat(10)@(posedge m_clk);
		end
	endtask

	task read_sfr();
		m_sfraddr_r <= 3'b101 ;
		s_sfraddr_r <= 3'b101 ;
		repeat(2)@(posedge m_clk);	
	endtask

	initial begin
		// do something

		init();
		repeat(10)@(posedge m_clk);
		for (int m_spibr = 0; m_spibr < 64; m_spibr++) begin

			set_mode_m(8'b0101_0000, m_spibr);
			set_mode_s(8'b0100_0000);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0010, m_spibr);
			set_mode_s(8'b0100_0010);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0100, m_spibr);
			set_mode_s(8'b0100_0100);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0110, m_spibr);
			set_mode_s(8'b0100_0110);
			transfer_data_master_slave(2, m_spibr);		
		end

		repeat(10)@(posedge m_clk);
		spssn_test();
		sfr_data_o_test();
		repeat(10)@(posedge m_clk);
		$finish;
	end
	// dump wave
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_spi_ms.fsdb");
			$fsdbDumpvars(0, "tb_spi_ms");
		end
	end

endmodule
