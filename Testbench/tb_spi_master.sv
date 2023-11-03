
`timescale 1ns/1ps
module tb_spi_master (); /* this is automatically generated */

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
		#10
		rst_n <= '1;
	end

	// (*NOTE*) replace reset, clock, others
	logic [7:0] data;
	logic [7:0] spcon;
	logic [7:0] spibr;
	logic       miso;
	logic       mosi;
	logic       sck;
	logic       ssn;

	spi_master inst_spi_master
		(
			.clk   (clk),
			.rst_n (rst_n),
			.data  (data),
			.spcon (spcon),
			.spibr (spibr),
			.miso  (miso),
			.mosi  (mosi),
			.sck   (sck),
			.ssn   (ssn)
		);

	task init();
		data  <= '0;
		spcon <= '0;
		spibr <= '0;
		miso  <= '0;
	endtask

	task drive(int iter);
		for(int it = 0; it < iter; it++) begin
			data  <= $urandom_range(0,255);
			spcon <= 8'd1;	// Mode0 spen = 1
			spibr <= 8'd1; 	// clk / 2
			miso  <= '0;	 
			@(posedge clk);
		end
	endtask

	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		drive(1);

		repeat(10)@(posedge clk);
		$finish;
	end
	// dump wave
	// initial begin
	// 	$display("random seed : %0d", $unsigned($get_initial_random_seed()));
	// 	if ( $test$plusargs("fsdb") ) begin
	// 		$fsdbDumpfile("tb_spi_master.fsdb");
	// 		$fsdbDumpvars(0, "tb_spi_master");
	// 	end
	// end
endmodule
