module spi_m_and_s (
	input wire          clk,
    input wire          rst_n,
    // sfr interface
    input wire [1:0]    m_sfraddr_w ,
    input wire          m_sfrwe     ,
    input wire [7:0]    m_spidata_i ,

    input wire [2:0]    m_sfraddr_r  ,
    output reg [7:0]    m_sfr_data_o ,

    input wire [7:0]    m_spssn_i    ,
    output wire [7:0]   m_spssn_o    ,
    input               m_ssn        ,

    // sfr interface
    input wire [1:0]    s_sfraddr_w ,
    input wire          s_sfrwe     ,
    input wire [7:0]    s_spidata_i ,

    input wire [2:0]    s_sfraddr_r  ,
    output reg [7:0]    s_sfr_data_o ,

    input wire [7:0]    s_spssn_i    ,
    output wire [7:0]   s_spssn_o    ,
    input               s_ssn        
      
	
);
	wire mosi ;
	wire miso ;
	wire sck  ;

	spi_ms inst_spi_mastermode
		(
			.clk        (clk),
			.rst_n      (rst_n),
			.sfraddr_w  (m_sfraddr_w),
			.sfrwe      (m_sfrwe),
			.spidata_i  (m_spidata_i),
			.sfraddr_r  (m_sfraddr_r),
			.sfr_data_o (m_sfr_data_o),
			.spssn_i    (m_spssn_i),
			.spssn_o    (m_spssn_o),
			.mosi       (mosi),
			.miso       (miso),
			.sck        (sck),
			.ssn        (m_ssn)
		);

	spi_ms inst_spi_slavemode
		(
			.clk        (clk),
			.rst_n      (rst_n),
			.sfraddr_w  (s_sfraddr_w),
			.sfrwe      (s_sfrwe),
			.spidata_i  (s_spidata_i),
			.sfraddr_r  (s_sfraddr_r),
			.sfr_data_o (s_sfr_data_o),
			.spssn_i    (s_spssn_i),
			.spssn_o    (s_spssn_o),
			.mosi       (mosi),
			.miso       (miso),
			.sck        (sck),
			.ssn        (s_ssn)
		);
	

endmodule