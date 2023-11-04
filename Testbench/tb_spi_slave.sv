
`timescale 1ns/1ps
module tb_spi_slave (); /* this is automatically generated */

	// clock
	logic clk;
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end

	// asynchronous reset
	logic ssn;

	// (*NOTE*) replace reset, clock, others
	logic [7:0] data_m;
	logic [7:0] spcon;
	logic [7:0] spibr;
	logic [7:0] spssn;
	logic [7:0] data_r_m;
	logic       miso;
	logic       mosi;
	logic       sck;
	logic [7:0] spsssn;

	// asynchronous reset
	logic rst_n;
	initial begin
		rst_n <= '0    ;
		spssn <= 8'hff ;
		#10
		rst_n <= '1;
		#10
		spssn <=8'hfe ;
	end


	// (*NOTE*) replace reset, clock, others
	logic [7:0] data_s;
	logic [7:0] spcon_s;
	logic [7:0] data_r_s;


	spi_slave inst_spi_slave
		(
			.data_s   (data_s),
			.spcon_s  (spcon_s),
			.data_r_s (data_r_s),
			.mosi     (mosi),
			.miso     (miso),
			.sck      (sck),
			.ssn      (ssn)
		);

	spi_master inst_spi_master
		(
			.clk      (clk),
			.rst_n    (rst_n),
			.data_m   (data_m),
			.spcon    (spcon),
			.spibr    (spibr),
			.spssn    (spssn),
			.data_r_m (data_r_m),
			.miso     (miso),
			.mosi     (mosi),
			.sck      (sck),
			.ssn      (ssn)
		);

	task init();
		data_s  <= '0;
		spcon_s <= '0;
		data_m  <= '0;
		spcon   <= '0;
		spibr   <= '0;
	endtask

	task drive(int iter);
		for(int it = 0; it < iter; it++) begin
			data_m <= $urandom_range(0,255);
			spcon  <= 8'd1;	// Mode0 spen = 1;
			spibr  <= 8'd2;
			data_s  <= $urandom_range(0,255);
			spcon_s <= '0;
		repeat(100)@(posedge clk);
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
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_spi_slave.fsdb");
			$fsdbDumpvars(0, "tb_spi_slave" );
		end
	end
endmodule
