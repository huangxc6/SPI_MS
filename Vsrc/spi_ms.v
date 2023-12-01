module spi_ms (
    input wire          clk,
    input wire          rst_n,
    input wire [2:0]    sfraddr_w,
    input wire [2:0]    sfraddr_r,
    input wire          sfrwe,
    input wire [7:0]    spssn_i,
//    input wire [7:0]sfrdatai,
//    input wire [2:0]spiaddr_i,
    input wire [7:0]    spidata_i,
    input wire          mosii,
    input wire          misoi,
    input wire          scki,
    input wire          ssn,


    output wire [7:0]   spssn_o,
    output reg  [7:0]   sfr_data_o,

    output wire         intspi,
    output wire         mosio,
    output wire         misoo,
    output wire         scko,
    output wire         SPC0

    

);
    reg  [7:0] SPICR1;  
    //reg [7:0] SPICR2_m;
    //reg [7:0] SPICR1_s;  
    //reg [7:0] SPICR2_s;  
    reg  [7:0] SPICR2;  
    reg  [7:0] SPIBR;  
    reg  [7:0] SPISR;
    reg  [7:0] SPIDR1; 
    reg  [7:0] SPIDR2;
    //wire [7:0] SPIDR1_m; 
    wire [7:0] SPIDR2_m;
    //wire [7:0] SPIDR1_s; 
    wire [7:0] SPIDR2_s;
    // reg  [7:0] sfr_datao;
    wire data_finish_m;
    wire data_finish_s;

    wire miso_m,mosi_m,sck_m;
    wire miso_s,mosi_s,sck_s;
    assign SPC0   = SPICR2[0];
    assign intspi = ~ssn;
    assign mosio  = (SPICR2[0])?(mosi_m):1'bZ;
    assign misoo  = (SPICR2[0])?(miso_s):1'bZ;
    assign scko   = (SPICR2[0])?(sck_m) :1'bZ;
    assign miso_m = misoi;
    assign mosi_s = mosii;
    assign sck_s  = scki ;

/*-----------------------------------------------\
 --         sync the rst_n signal          --
\-----------------------------------------------*/
    reg rst_n_sync_pre  ;
    reg rst_n_sync      ;

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            rst_n_sync_pre <= 1'b0 ;
            rst_n_sync     <= 1'b0 ;
        end else begin
            rst_n_sync_pre  <= 1'b1 ;
            rst_n_sync      <= rst_n_sync_pre ;
        end
    end

/*-----------------------------------------------\
 --     instance spi_master and spi_slave       --
\-----------------------------------------------*/

    spi_master inst_spi_master
        (
            .clk      (clk),
            .rst_n    (rst_n_sync),
            .data_m   (SPIDR1),
            .spcon    (SPICR1),
            .spibr    (SPIBR),
            .spssn    (spssn_i),
            .data_r_m (SPIDR2_m),
            .data_finish_m(data_finish_m)   ,
            .miso     (miso_m),
            .mosi     (mosi_m),
            .sck      (sck_m),
            .ssn      (spssn_o)
        );

    spi_slave inst_spi_slave
        (
            .clk       (clk),
            .rst_n     (rst_n_sync),
            .data_s    (SPIDR1),
            .spcon_s   (SPICR1),
            .tr_done_s (data_finish_s),
            .data_r_s  (SPIDR2_s),
            .mosi      (mosi_s),
            .miso      (miso_s),
            .sck       (sck_s),
            .ssn       (ssn)
        );



    always @(*) begin
        if (SPICR1[4]) begin
            SPIDR2  =   SPIDR2_m;
        end else begin
            SPIDR2  =   SPIDR2_s;   
        end
    end

    always @(*) begin
        if (data_finish_m) begin
            SPISR[0]  =   1;
        end else begin
            SPISR[0]  =   0;   
        end
        if (data_finish_s) begin
            SPISR[1]  =   1;
        end else begin
            SPISR[1]  =   0;   
        end
    end


    always @(posedge clk or negedge rst_n_sync) begin  
        if (rst_n_sync == 0) begin         
            SPICR1 <= 8'b0;  
            SPICR2 <= 8'b0;  
            SPIBR <= 8'b0;  
            SPIDR1  <= 8'b0;  
    //        SPISR  <= 8'b0;  
    //        SPIDR1_m <= 8'b0;  
    //        SPIDR2_m <= 8'b0; 
    //        SPIDR1_s <= 8'b0;  
    //        SPIDR2 <= 8'b0;  

        end else if (sfrwe) begin
            case (sfraddr_w)  
            3'b000: SPICR1    <= spidata_i;  
            3'b001: SPICR2    <= spidata_i;
            3'b010: SPIBR     <= spidata_i; 
            3'b011: SPIDR1    <= spidata_i;   
            default:;
            endcase
        end 
    end  


/*-----------------------------------------------\
 --         sfr_data_o : sfr output data        --
\-----------------------------------------------*/
    
    always @(posedge clk or negedge rst_n_sync)begin   
        if (rst_n_sync == 1'b0) begin
            sfr_data_o <= 8'b0000_0000 ;
        end else begin
            case(sfraddr_r)
                3'b000 : sfr_data_o <= SPICR1       ;
                3'b001 : sfr_data_o <= SPICR2       ;
                3'b010 : sfr_data_o <= SPIBR        ;
                3'b011 : sfr_data_o <= SPISR        ;
                3'b100 : sfr_data_o <= SPIDR1       ;
                3'b101 : sfr_data_o <= SPIDR2       ;
                default: sfr_data_o <= 8'b0000_0000 ;
            endcase
        end 
    end

endmodule
