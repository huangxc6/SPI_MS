`timescale 1ns/1ps
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Huang Xiaochong huangxc@stu.pku.edu.cn
// File   : spi_master_V0.1.v
// Create : 2023-11-03 22:09:33
// Revise : 2023-11-03 22:09:33
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------
/* Description:

*/
// Version: 0.1
// -----------------------------------------------------------------------------

module spi_master (
	input wire			clk  	  	,    // Clock
	input wire			rst_n	  	,  	 // Asynchronous reset active low

	input wire	[7:0]	data 		,
	input wire	[7:0]	spcon 		,
	input wire	[7:0]	spibr 		,

	// spi data wire
	input wire			miso 		,
	output reg			mosi 		,

	// spi clk and slave select
	output reg			sck 		,
	output wire			ssn 
);
	wire   spen 		   ; 	// spi enable signal
	assign spen = spcon[0] ;

	// cpol = 1, Active-low clocks selected. In idle state SCK is high.
	// cpol = 0, Active-high clocks selected. In idle state SCK is low.
	// cpha = 1, data being latched on even numbered edges and shifted on odd numbered edges
	// cpha = 0, data being latched on odd numbered edges and shifted on even numbered edges
	wire cpol, cpha ; 
	assign {cpol, cpha} = spcon[2:1] ;

	reg  [7:0] clk_cnt 	  ; 
	wire [7:0] clk_div    ; // div the clk to generate the spi clk

	assign clk_div = spibr ;

	reg  [4:0] sck_edge_cnt   ; // trace the sck edge
	reg 	   sck_edge_level ; // trace the sck level

	reg tr_en   ; // tx or rx enable
	reg tr_done ; // when tx or rx done , set it

	reg [2:0] bit_count ; // bit count to transfer data
	reg [7:0] data_r	; // the 8 bits data register

	// generate the enable signal
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			tr_en <= 1'b0;
		end 
		else begin
			if (spen) begin
				tr_en <= 1'b1 ;
			end
			else begin
				if (tr_done) begin
					tr_en <= 1'b0 ;
				end
				else begin
					tr_en <= tr_en ;
				end
			end
		end
	end

	// clk count for div
	always @(posedge clk or negedge rst_n) begin 
		if(~rst_n) begin
			clk_cnt <= 8'd0;
		end 
		else begin
			if (spen) begin
				if (clk_cnt == clk_div) begin
					clk_cnt <= 1'b0 ;
				end
				else begin
					clk_cnt <= clk_cnt + 1'b1 ;
				end
			end
			else begin
				clk_cnt <= clk_cnt ;
			end
		end
	end

	// sck_edge_level = 1 to generate sck edge and data transfer
	// sck_edge_cnt counts the number of sck edge
	always @(posedge clk or negedge rst_n) begin 
		if(~rst_n) begin
			sck_edge_level <= 1'b0;
			sck_edge_cnt <= 5'd0 ;
		end 
		else begin
			if (tr_en) begin
				if (clk_cnt == clk_div) begin
					if (sck_edge_cnt == 5'd17) begin
						sck_edge_level <= 1'b0 ;
						sck_edge_cnt <= 5'd0 ;
					end
					else begin
						sck_edge_level <= 1'b1 ;
						sck_edge_cnt <= sck_edge_cnt + 1'b1;
					end
				end
				else begin
					sck_edge_level <= 1'b0 ;
				end
			end
				else begin
					sck_edge_level <= 1'b0 ;
					sck_edge_cnt <= 5'd0 ;
					end
		end
    end

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			sck       <= cpol ;
			data_r    <= 8'd0 ;
			bit_count <= 3'b111 ;
			mosi      <= 1'b0 ;
		end else begin
			if (tr_en) begin
				if (sck_edge_level) begin
					case (sck_edge_cnt)
						1, 3, 5, 7, 9, 11, 13, 15:begin
							sck <= ~sck ;
							if (cpha) begin  
								mosi <= data [bit_count]     ;
								bit_count <= bit_count - 1'b1;
							end
							else begin
								data_r <= {data_r[6:0], miso} ; 
							end
						end
						2, 4, 6, 8, 10, 12, 14, 16:begin
							sck <= ~sck ;
							if (cpha) begin
								data_r <= {data_r[6:0], miso} ;
							end
							else begin
								mosi <= data [bit_count] 	  ;
								bit_count <= bit_count - 1'b1 ;
							end
						end
						17:begin
							sck <= cpol ;
						end
					endcase
				end
			end

			// idle state
			else begin
				sck <= cpol ;
				if (cpha) begin
					bit_count <= 4'd7 ;
				end
				else begin
					mosi <= data[7] ;
					bit_count <= 4'd7 ;
				end
			end
		end
	end

	// if tr_done = 1, 8 bits data is being transfer
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			tr_done <= 1'b0;
		end else begin
			if (tr_en && sck_edge_cnt == 5'd17) begin
				tr_done <= 1'b1;
			end else begin
				tr_done <= 1'b0 ;
			end
		end
	end

endmodule
