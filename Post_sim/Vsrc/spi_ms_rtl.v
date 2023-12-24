module spi_ms_rtl (
    input wire          clk    ,
    input wire          rst_n  ,

    // sfr interface
    input wire [1:0]    sfraddr_w ,
    input wire          sfrwe     ,
    input wire [7:0]    spidata_i ,

    input wire [2:0]    sfraddr_r  ,
    output reg [7:0]    sfr_data_o ,

    input wire [7:0]    spssn_i    ,
    output wire [7:0]   spssn_o    ,

    // spi interface
    inout wire          mosi ,
    inout wire          miso ,
    inout wire          sck  ,
    input wire          ssn
);
    reg  [7:0] spicr1 ;   
    reg  [7:0] spicr2 ;  
    reg  [7:0] spibr  ;  
    reg  [7:0] spisr  ;
    reg  [7:0] spidr1 ; 
    wire  [7:0] spidr2 ;

    wire [7:0] spidr2_m;
    wire [7:0] spidr2_s;
    
    wire data_finish_m;
    wire data_finish_s;

    wire miso_m ;
    wire mosi_m ;
    wire sck_m  ;
    wire miso_s ;
    wire mosi_s ;
    wire sck_s  ;

    wire         intspi ;
    assign intspi = ~ssn;

    // 3-state buffers
/*-----------------------------------------------\
 --             3-state buffers               --
\-----------------------------------------------*/
    
    wire mstr = spicr1[4] ; // mstr = 0 means slave model, mstr = 1 means master model

    assign sck   = mstr ? sck_m : 1'bz ;
    assign sck_s = mstr ? 1'bz  : sck  ;

    assign mosi   = mstr ? mosi_m : 1'bz   ;
    assign mosi_s = mstr ? 1'bz   : mosi ;

    assign miso_m = mstr ? miso : 1'bz     ;
    assign miso   = mstr ? 1'bz : miso_s   ;


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
            .clk           (clk),
            .rst_n         (rst_n_sync),
            .data_m        (spidr1),
            .spcon         (spicr1),
            .spibr         (spibr),
            .spssn         (spssn_i),
            .data_r_m      (spidr2_m),
            .data_finish_m (data_finish_m)   ,
            .miso          (miso_m),
            .mosi          (mosi_m),
            .sck           (sck_m),
            .ssn           (spssn_o)
        );

    spi_slave inst_spi_slave
        (
            .clk           (clk),
            .rst_n         (rst_n_sync),
            .data_s        (spidr1),
            .spcon_s       (spicr1),
            .data_finish_s (data_finish_s),
            .data_r_s      (spidr2_s),
            .mosi          (mosi_s),
            .miso          (miso_s),
            .sck           (sck_s),
            .ssn           (ssn)
        );



    assign spidr2 = mstr ? spidr2_m : spidr2_s ;  // mstr = 1, master model

    always @(posedge clk or negedge rst_n_sync) begin
        if (rst_n_sync == 1'b0) begin
            spisr <= 8'b0 ;
        end
        else begin
            spisr[0] <= data_finish_m ;
            spisr[1] <= data_finish_s ;
            spisr[4] <= intspi        ;
        end
    end

    always @(posedge clk or negedge rst_n_sync) begin  
        if (rst_n_sync == 0) begin         
            spicr1  <= 8'b0;  
            spicr2  <= 8'b0;  
            spibr   <= 8'b0;  
            spidr1  <= 8'b0;  
        end else if (sfrwe) begin
            case (sfraddr_w)  
            2'b00: spicr1    <= spidata_i;  
            2'b01: spicr2    <= spidata_i;
            2'b10: spibr     <= spidata_i; 
            2'b11: spidr1    <= spidata_i;   
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
                3'b000 : sfr_data_o <= spicr1       ;
                3'b001 : sfr_data_o <= spicr2       ;
                3'b010 : sfr_data_o <= spibr        ;
                3'b011 : sfr_data_o <= spisr        ;
                3'b100 : sfr_data_o <= spidr1       ;
                3'b101 : sfr_data_o <= spidr2       ;
                default: sfr_data_o <= 8'b0000_0000 ;
            endcase
        end 
    end

endmodule
