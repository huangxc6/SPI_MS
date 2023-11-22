
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
		#5
		rst_n <= '1;
	end

	// synchronous reset
	logic srstb;
	initial begin
		srstb <= '0;
		repeat(10)@(posedge clk);
		srstb <= '1;
	end

	// (*NOTE*) replace reset, clock, others
	logic [7:0] data_m;
	logic [7:0] spcon;
	logic [7:0] spibr;
	logic [7:0] spssn;
	logic [7:0] data_r_m;
	logic       miso;
	logic       mosi;
	logic       sck;
	logic [7:0] ssn;

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
		data_m <= '0;
		spcon  <= '0;
		spibr  <= '0;
		spssn  <= 8'hff;
		miso   <= '0;
	endtask

	task drive(int iter);	
		for(int it = 0; it < iter; it++) begin
			spssn  <= 8'hfe;
			data_m <= $urandom_range(0,255);
			spcon  <= 8'b0100_0000;	// Mode0 spen = 1;
			spssn  <= '0;
			miso   <= $urandom_range(0,1);
			repeat(18)@(posedge clk);
			spssn <= 8'hff ;
			repeat(10)@(posedge clk);
		end
	endtask

	task drive1(int iter);
		for (int i = 0; i < 5; i++) begin
			for(int it = 0; it < iter; it++) begin
				spssn  <= 8'hfe;
				data_m <= $urandom_range(0,255);
				spcon  <= 8'b0100_0000;	// Mode0 spen = 1;
				spibr  <= i ;
				spssn  <= '0;
				miso   <= $urandom_range(0,1);
				repeat(18)@(posedge clk);
				spssn <= 8'hff ;
				repeat(10)@(posedge clk);
			end
		end
	endtask


	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		drive(10);

		repeat(10)@(posedge clk);
		$finish;
	end
	// dump wave
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_spi_master.fsdb");
			$fsdbDumpvars(0, "tb_spi_master");
		end
	end
endmodule
