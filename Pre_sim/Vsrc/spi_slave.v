// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Huang Xiaochong huangxc@stu.pku.edu.cn
// File   : spi_slave_v0.1.v
// Create : 2023-11-01 22:33:25
// Revise : 2023-11-21 19:37:55
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------
/* Description:

*/
// Version: 0.1
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
module spi_slave (
	input wire			clk  	  		,    // Clock
	input wire			rst_n	  		,  	 // Asynchronous reset active low

	input wire	[7:0]	data_s 			,
	input wire	[7:0]	spcon_s 		,

    output reg          data_finish_s   ,
    output reg  [7:0]   data_r_s	 	,


	// spi data transfer wire
	input  wire			mosi 			,
	output reg			miso 			,

	// spi clk and slave select
	input wire			sck 			,
	input wire			ssn		
	
);

	// cpol = 1, Active-low clocks selected. In idle state SCK is high.
	// cpol = 0, Active-high clocks selected. In idle state SCK is low.
	// cpha = 1, data being latched on even numbered edges and shifted on odd numbered edges
	// cpha = 0, data being latched on odd numbered edges and shifted on even numbered edges
	wire cpol, cpha ; 
	assign {cpol, cpha} = spcon_s[2:1] ;

	reg	[4:0]	sck_edge_cnt   ; // trace the sck edge
	wire	   	sck_edge_level ; // trace the sck level
	reg			sck_dly1 ;
	reg			sck_dly2 ;

	wire   tr_en 		   				 ; 	
	assign tr_en = ~ssn ; // tx or rx enable

	reg [2:0] bit_count ; // bit count to transfer data

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			sck_dly1 <= 1'b0 ;
			sck_dly2 <= 1'b0 ;
		end else begin
			sck_dly1 <= sck 	 ;
			sck_dly2 <= sck_dly1 ;
		end
	end

	// detect the edge signal of sck and count it

	assign sck_edge_level = sck_dly1 ^ sck ;

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			 sck_edge_cnt <= 0;
		end else begin
			if (tr_en) begin
				if (sck_edge_cnt == 5'd16) begin
					sck_edge_cnt <= 0      ;
				end else begin
					sck_edge_cnt <= sck_edge_level ? sck_edge_cnt + 1 : sck_edge_cnt ;
				end
			end else begin
				sck_edge_cnt <= 0 ;
			end	
		end
	end

	// data transfer between master and slave
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			data_r_s    <= 8'd0   ;
			bit_count <= 3'b111 ; 
			miso      <= 1'b0 	;
		end else begin
			if (tr_en) begin
				if (sck_edge_level) begin
					case (sck_edge_cnt)
						1, 3, 5, 7, 9, 11, 13, 15:begin
							if (cpha) begin
								data_r_s <= {data_r_s[6:0], mosi} ;
							end else begin
								miso <= data_s[bit_count] ;
								bit_count <= bit_count - 1'b1 ;
							end
						end

						0, 2, 4, 6, 8, 10, 12, 14:begin
							if (cpha) begin
								miso <= data_s[bit_count] ;
								bit_count <= bit_count - 1'b1 ;
							end else begin
								data_r_s <= {data_r_s[6:0], mosi} ;
							end
						end
						// default : data_r_s <= data_r_s ;
					endcase
				end 
			end
				else begin
				if (cpha) begin
					bit_count <= 3'b111 ;
				end else begin
					miso <= data_s[7] ;
					bit_count <= 3'b110 ;
				end

			end
		end
	end

	// grnerate tr_finish signal 
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			data_finish_s <= 1'b0;
		end else begin
			if (tr_en) begin
				if (sck_edge_cnt == 5'd16) begin
					data_finish_s <= 1'b1 ;
				end else begin
					data_finish_s <= 1'b0 ;
				end
			end else begin
				data_finish_s <= 1'b0 ;
			end
			
		end
	end
 
endmodule