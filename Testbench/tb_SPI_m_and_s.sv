
`timescale 1ns/1ps
module tb_SPI ();

	// clock
	logic clk;
	logic clk_s;
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end
	initial begin
		clk_s = '0 ;
		# 0.2 
		clk_s = ~clk_s ;
		forever #(0.5) clk_s = ~clk_s;
	end

	// asynchronous reset
	logic rst_n;
	initial begin
		rst_n <= '0;
		#5
		rst_n <= '1;
	end

	// (*NOTE*) replace reset, clock, others
	// master
	logic [2:0] sfraddr_w;
	logic [2:0] sfraddr_r;
	logic       sfrwe;
	logic [7:0] spssn_i;
	logic [7:0] spidata_i;
	logic       mosii;
	logic       misoi;
	logic       scki;
	logic       ssn;
	logic [7:0] spssn_o;
	logic [7:0] sfrdatao;
	logic       intspi;
	logic       mosio;
	logic       misoo;
	logic       scko;
	logic       SPC0;

	logic [2:0] sfraddr_w_s	;
	logic [2:0] sfraddr_r_s	;
	logic       sfrwe_s		;
	logic [7:0] spssn_i_s	;
	logic [7:0] spidata_i_s	;
	logic       mosii_s		;
	logic       misoi_s		;
	logic       scki_s		;
	logic       ssn_s 		;
	logic [7:0] spssn_o_s	;
	logic [7:0] sfrdatao_s	;
	logic       intspi_s 	;
	logic       mosio_s		;
	logic       misoo_s		;
	logic       scko_s		;
	logic       SPC0_s		;

	assign mosii_s = mosio ;

	assign misoi = misoo_s ;

	SPI inst_SPI_master
		(
			.clk       (clk),
			.rst_n     (rst_n),
			.sfraddr_w (sfraddr_w),
			.sfraddr_r (sfraddr_r),
			.sfrwe     (sfrwe),
			.spssn_i   (spssn_i),
			.spidata_i (spidata_i),
			.mosii     (mosii),
			.misoi     (misoi),
			.scki      (scki),
			.ssn       (ssn),
			.spssn_o   (spssn_o),
			.sfrdatao  (sfrdatao),
			.intspi    (intspi),
			.mosio     (mosio),
			.misoo     (misoo),
			.scko      (scko),
			.SPC0      (SPC0)
		);

		assign scki_s = scko;

		SPI inst_SPI_slave
		(
			.clk       (clk_s),
			.rst_n     (rst_n),
			.sfraddr_w (sfraddr_w_s	),
			.sfraddr_r (sfraddr_r_s	),
			.sfrwe     (sfrwe_s		),
			.spssn_i   (spssn_i_s	),
			.spidata_i (spidata_i_s	),
			.mosii     (mosii_s		),
			.misoi     (misoi_s		),
			.scki      (scki_s		),
			.ssn       (spssn_o[0] 	),
			.spssn_o   (spssn_o_s	),
			.sfrdatao  (sfrdatao_s	),
			.intspi    (intspi_s 	),
			.mosio     (mosio_s		),
			.misoo     (misoo_s		),
			.scko      (scko_s		),
			.SPC0      (SPC0_s		)
		);

	task init();
		sfraddr_w <= '0;
		sfraddr_r <= '0;
		sfrwe     <= '0;
		spssn_i   <= 8'hff;
		spidata_i <= '0;
		// mosii     <= '0;
		// misoi     <= '0;
		scki      <= '0;
		ssn       <= '0;

		sfraddr_w_s	<= '0;
		sfraddr_r_s	<= '0;
		sfrwe_s		<= '0;
		spssn_i_s	<= 8'hff;
		spidata_i_s	<= '0;
		// mosii_s		<= '0;
		// misoi_s		<= '0;
		// scki_s		<= '0;
		ssn_s 		<= '0;
	endtask


	task set_mode_m(int mode_sel_m);
		sfrwe     <= '1;
		@(posedge clk);
		sfraddr_w <= 3'b000;
		sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		spidata_i <= mode_sel_m; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge clk);
		sfraddr_w <= 3'b001;
		sfraddr_r <= 3'b001;
		spidata_i <= 8'b0000_0001;
		repeat(2)@(posedge clk);
		sfraddr_w <= 3'b010;
		sfraddr_r <= 3'b010;
		spidata_i <= 8'b0000_0011;	// clk / 16
		repeat(2)@(posedge clk);
		sfraddr_w <= 3'b011;
		sfraddr_r <= 3'b011;
		spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge clk);
	endtask

	task set_mode_s(int mode_sel_s);
		sfrwe_s     <= '1;
		@(posedge clk);
		sfraddr_w_s <= 3'b000;
		sfraddr_r_s <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		spidata_i_s <= mode_sel_s; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge clk);
		sfraddr_w_s <= 3'b001;
		sfraddr_r_s <= 3'b001;
		spidata_i_s <= 8'b0000_0001;
		repeat(2)@(posedge clk);
		sfraddr_w_s <= 3'b010;
		sfraddr_r_s <= 3'b010;
		spidata_i_s <= 8'b0000_0011;	// clk / 16
		repeat(2)@(posedge clk);
		sfraddr_w_s <= 3'b011;
		sfraddr_r_s <= 3'b011;
		spidata_i_s <= 8'b0000_0000;  // ready to transfer data
		@(posedge clk);
	endtask

	task transfer_data_master(int iter_m);
		for(int it = 0; it < iter_m; it++) begin
			spidata_i <= $urandom_range(0,255);
			spssn_i  <= 8'hfe;
			// misoi_s   <= $urandom_range(0,1);
			repeat(18)@(posedge clk);
			spssn_i  <= 8'hff;
			repeat(8)@(posedge clk);
		end
	endtask

	task transfer_data_slave(int iter_s);
		for(int it = 0; it < iter_s; it++) begin
			spidata_i_s <= $urandom_range(0,255);
			// ssn  <= 1'b0;
			// mosii+   <= $urandom_range(0,1);
			repeat(18)@(posedge clk);
			// ssn  <= 1'b1;
			repeat(8)@(posedge clk);
		end
	endtask

	task transfer_data_master_slave(int iter_ms);
		for(int it = 0; it < iter_ms; it++) begin
			spidata_i <= $urandom_range(0,255);
			spidata_i_s <= $urandom_range(0,255);
			repeat(2)@(posedge clk);
			spssn_i  <= 8'hfe;
			repeat(130)@(posedge clk);
			spssn_i  <= 8'hff;
			repeat(8)@(posedge clk);
		end
	endtask

	task master_ctrl(int iter_m);

		set_mode_m(8'b0101_0000);
		transfer_data_master(iter_m);

		set_mode_m(8'b0101_0100);
		transfer_data_master(iter_m);

		set_mode_m(8'b0101_1000);
		transfer_data_master(iter_m);

		set_mode_m(8'b0101_1100);
		transfer_data_master(iter_m);
	endtask

	task slave_ctrl(int iter_s);
		set_mode_s(8'b0100_0000);
		transfer_data_slave(iter_s);

		set_mode_s(8'b0100_0100);
		transfer_data_slave(iter_s);

		set_mode_s(8'b0100_1000);
		transfer_data_slave(iter_s);

		set_mode_s(8'b0100_1100);
		transfer_data_slave(iter_s);
	endtask	

	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		set_mode_m(8'b0101_0000);

		set_mode_s(8'b0100_0000);

		transfer_data_master_slave(20);


		repeat(10)@(posedge clk);
		$finish;
	end
	// dump wave
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_SPI.fsdb");
			$fsdbDumpvars(0, "tb_SPI");
		end
	end
endmodule
