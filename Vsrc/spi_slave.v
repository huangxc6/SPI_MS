`timescale 1ns/1ps
module spi_slave (

	input   wire  [7:0]	 data_s 		,
	input   wire  [7:0]	 spcon_s 		,
	output 	reg   [7:0]  data_r_s	    , // the 8 bits data_s register
    output  reg          data_finish_s  ,
    input   wire         rst,
	// spi data_s transfer wire
	input  wire			mosi 		,
	output reg			miso 		,

	// spi clk and slave select
	input wire			sck 		,
	input wire			ssn		

	
);

	wire cpol, cpha ; 
	assign {cpol, cpha} = spcon_s[2:1] ;
	wire   ssn_n 					   ;
    assign ssn_n = ~ssn ^ rst;

	wire   clk 					   ;
	assign clk = sck ^ cpol ^ cpha ;

	// reg tr_done ; // when tx or rx done , set it

	reg [2:0] bit_count ; // bit count to transfer data_s
    reg count 			; // bit count to transfer data_s
    
	
	
	always @(*) begin
	    data_finish_s = !bit_count;
    end

	always @(posedge clk) begin
		if (~ssn) begin
			data_r_s <= {data_r_s[6:0], mosi} ;
		end else begin
			data_r_s <= data_r_s ;
		end
	end

	always @(negedge clk or posedge ssn_n ) begin
		if (!rst)begin
			miso     <= 1'b0    ;
			count    <= 0 		;
		end
		if(ssn_n && ~count) begin 
	    	bit_count <= 3'b110;
            count     <= 1;
            miso      <= data_s[7] ;   
		end else begin
            if(count) begin
	    		bit_count <= bit_count - 3'h1;
               miso <= data_s[bit_count] ;
			end
			end
                if (!bit_count)
                count     <= 0;
	        end

/*
	initial begin
		data_r_s <= 8'd7 	;
		miso     <= 1'b0    ;
        count    <= 0 		;
	end
*/

endmodule