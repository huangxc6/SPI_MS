
`timescale 1ns/1ps
module tb_spi_slave (); /* this is automatically generated */

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
	logic [7:0] data_m;
	logic [7:0] spcon_m;
	logic [7:0] spibr_m;
	// logic       mosi_m;
	// logic       miso_m;
	// logic       sck;
	// logic       ssn;

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
			.data  (data_m),
			.spcon (spcon_m),
			.spibr (spibr_m),
			.miso  (miso),
			.mosi  (mosi),
			.sck   (sck),
			.ssn   (ssn)
		);

	task init();
		data_m  <= '0;
		data 	<= '0;
		spcon_m <= '0;
		spcon   <= '0;
		spibr_m <= '0;
		miso    <= '0;
		mosi 	<= '0;
		ssn 	<= '0;
	endtask

	task drive(int iter);
		for(int it = 0; it < iter; it++) begin
			data_m  <= $urandom_range(0,255);
			data    <= $urandom_range(0,255);
			spcon_m <= 8'd1;	// Mode0 spen = 1
			spibr_m <= 8'd1; 	// clk / 2	 
			@(posedge clk);
		end
	endtask

	spi_slave inst_spi_slave
		(
			.clk   (clk),
			.rst_n (rst_n),
			.data  (data),
			.spcon (spcon),
			.spibr (spibr),
			.mosi  (mosi),
			.miso  (miso),
			.sck   (sck),
			.ssn   (ssn)
		);


	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		drive(1);

		repeat(10)@(posedge clk);
		$finish;
	end
	// dump wave
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_spi_slave.fsdb");
			$fsdbDumpvars(0, "tb_spi_slave");
		end
	end
endmodule
