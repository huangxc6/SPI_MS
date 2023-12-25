
`timescale 1ns/1ps
module tb_SPI ();

	// clock
	logic clk;
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end

	// asynchronous reset
	logic rst_n;
	initial begin
		rst_n <= '0;
		#5
		rst_n <= '1;
	end

	// (*NOTE*) replace reset, clock, others
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

	SPI inst_SPI
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

	task init();
		sfraddr_w <= '0;
		sfraddr_r <= '0;
		sfrwe     <= '0;
		spssn_i   <= 8'hff;
		spidata_i <= '0;
		mosii     <= '0;
		misoi     <= '0;
		scki      <= '0;
		ssn       <= '0;
	endtask


	task set_mode(int mode_sel);
		sfrwe     <= '1;
		@(posedge clk);
		sfraddr_w <= 3'b000;
		sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		spidata_i <= mode_sel; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		@(posedge clk);
		sfraddr_w <= 3'b001;
		sfraddr_r <= 3'b001;
		spidata_i <= 8'b0000_0000;
		@(posedge clk);
		sfraddr_w <= 3'b011;
		sfraddr_r <= 3'b011;
		spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge clk);
	endtask

	task set_fsck(int spibr);
		@(posedge clk);
		sfraddr_w <= 3'b010;
		sfraddr_r <= 3'b010;
		spidata_i <= 8'b0000_0000;	// clk / 2
		@(posedge clk);
	endtask

	task transfer_data_master(int iter);
		for(int it = 0; it < iter; it++) begin
			spidata_i <= $urandom_range(0,255);
			spssn_i  <= 8'hfe;
			misoi   <= $urandom_range(0,1);
			repeat(18)@(posedge clk);
			spssn_i  <= 8'hff;
			repeat(2)@(posedge clk);
		end
	endtask

	task transfer_data_slave(int iter);
		for(int it = 0; it < iter; it++) begin
			spidata_i <= $urandom_range(0,255);
			ssn  <= 1'b0;
			mosii   <= $urandom_range(0,1);
			repeat(18)@(posedge clk);
			ssn  <= 1'b1;
			repeat(2)@(posedge clk);
		end
	endtask

	task master_ctrl(int spibr, int iter);
		set_fsck(spibr);

		set_mode(8'b0101_0000);
		transfer_data_master(iter);

		set_mode(8'b0101_0100);
		transfer_data_master(iter);

		set_mode(8'b0101_1000);
		transfer_data_master(iter);

		set_mode(8'b0101_1100);
		transfer_data_master(iter);
	endtask

	task slave_ctrl(int spibr, int iter);
		set_fsck(spibr);

		set_mode(8'b0100_0000);
		transfer_data_slave(iter);

		set_mode(8'b0100_0100);
		transfer_data_slave(iter);

		set_mode(8'b0100_1000);
		transfer_data_slave(iter);

		set_mode(8'b0100_1100);
		transfer_data_slave(iter);
	endtask	

	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		master_ctrl(0, 20); // firt argument is spibr, second argument is the num of data

		slave_ctrl(0, 20);

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
