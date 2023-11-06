module SFR (
    input wire clk,
    input wire rst,
    input wire [2:0]sfraddr_w,
    input wire [2:0]sfraddr_r,
    input wire sfrwe,
    input wire spssn,
    input wire [7:0]sfrdatai,
    input wire [2:0]spiaddr_i,
    input wire [7:0]spidata_i,

    output wire spssn,
    output wire [7:0]sfrdatao,
    
//下面要加输出全部寄存器的值的语句。


 /*
    output wire spiaddr_i,
    output wire spidata_i,
    output wire spen,
    output wire mstr,
    output wire cpha,
    output wire cpol,
    output wire misotri,
    output wire mositri,
    output wire scktri,
    output wire op
*/
);
reg [7:0] SPICR1;  
reg [7:0] SPICR2;  
reg [7:0] SPIBR;  
reg [7:0] SPISR;
reg [7:0] SPIDR1; 
reg [7:0] SPIDR2;

always @(posedge clk or negedge rst) begin  
    if (rst == 0) begin        // 当复位信号为低时，所有寄存器清零，地址和使能信号复位  
        SPICR1 <= 8'b0;  
        SPICR2 <= 8'b0;  
        SPIBR  <= 8'b0;  
        SPISR  <= 8'b0;  
        SPIDR1 <= 8'b0;  
        SPIDR2 <= 8'b0;  
    end else if (sfrwe) begin
        case (sfraddr_w)  
        3'b000: SPICR1  <= spidata_i;  
        3'b001: SPICR2  <= spidata_i;  
        3'b010: SPIBR   <= spidata_i;  
        3'b011: SPISR   <= spidata_i; 
        3'b100: SPIDR1  <= spidata_i;
        3'b101: SPIDR2  <= spidata_i; 
        endcase
    end 
end  

assign sfrdatao = (sfraddr_r == 3'b000) ? SPICR1 : (sfraddr_r == 3'b001) ? SPICR2 : (sfraddr_r == 3'b010) ? SPIBR : (sfraddr_r == 3'b011) ? SPISR : (sfraddr_r == 3'b100) ? SPIDR1 : SPIDR2 ;  

endmodule