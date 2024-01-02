### spi_master

#### 1.1.1.1   input变量声明

| clk          | 系统时钟                         |
| ------------ | -------------------------------- |
| rst_n        | 系统复位，低电平有效             |
| data_m [7:0] | 主机需要发送的数据               |
| spcon [7:0]  | spi 控制寄存器1输入              |
| spibr [7:0]  | spi 分频寄存器输入               |
| spssn [7:0]  | spi 片选信号输入                 |
| miso         | 主机输入，从机输出，接收从机数据 |

#### 1.1.1.2   output变量声明

| data_r_m [7:0]  (reg) | 主机接收到的数据                 |
| --------------------- | -------------------------------- |
| data_finish_m  (reg)  | 接收8bit数据完成信号             |
| mosi (reg)            | 主机输出，从机输入，发送主机数据 |
| sck (reg)             | spi 时钟，分频产生               |
| ssn [7:0] (wire)      | spi 片选信号输出                 |

#### 1.1.1.3   内部变量声明

wire型变量声明

| tr_en           | 传输使能，为1时开始传输数据      |
| --------------- | -------------------------------- |
| cpol            | spi 极性控制信号                 |
| cpha            | spi 相位控制信号                 |
| clk_div [7:0]   | spi 分频数，由分频寄存器计算得出 |
| sppr_add1 [3:0] | 计算分频数的中间信号             |

 

reg型变量声明

| clk_cnt [7:0]       | spi 分频计数器                |
| ------------------- | ----------------------------- |
| sck_edge_cnt  [4:0] | 记录sck边沿数                 |
| sck_edge_level      | sck边沿电平，sck发生跳变时为1 |
| tr_done             | 传输结束信号                  |
| tr_done_dly1        | 传输技术信号延时1拍           |
| bit_count [2:0]     | 用于发送数据时计数            |

 

#### 1.1.1.4 各模块介绍

- 变量声明及wire型变量赋值

```verilog
wire   tr_en 		   				 ; 	
	assign tr_en = ~(&spssn) && spcon[6] ; // tx or rx enable
	assign ssn = spssn 					 ;

	// cpol = 1, Active-low clocks selected. In idle state SCK is high.
	// cpol = 0, Active-high clocks selected. In idle state SCK is low.
	// cpha = 1, data being latched on even numbered edges and shifted on odd numbered edges
	// cpha = 0, data being latched on odd numbered edges and shifted on even numbered edges
	wire cpol, cpha ; 
	assign {cpol, cpha} = spcon[2:1] ;

	reg  [7:0] clk_cnt 	  ; 
	wire [7:0] clk_div    ; // div the clk to generate the spi clk
	wire [3:0] sppr_add1  ;

	assign sppr_add1 = spibr[6:4] + 3'b001 ;
	assign clk_div   = sppr_add1 << spibr[2:0] ; 

	reg  [4:0] sck_edge_cnt   ; // trace the sck edge
	reg 	   sck_edge_level ; // trace the sck level

	reg tr_done ; // when tx or rx done , set it
	reg tr_done_dly1 ;

	reg [2:0] bit_count ; // bit count to transfer data 
```



- 时钟计数模块，用于分频

```verilog
// clk count for div
	always @(posedge clk or negedge rst_n) begin 
		if(~rst_n) begin
			clk_cnt <= 8'd1;
		end 
		else begin
			if (tr_en) begin
				if (clk_cnt == clk_div) begin
					clk_cnt <= 8'd1 ;
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
```



- 分频产生sck，记录sck边沿电平及边沿数

```verilog
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
					if (sck_edge_cnt == 5'd16) begin
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

```



- 数据发送与接收模块

```verilog
always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			sck       <= cpol ;
			data_r_m    <= 8'd0 ;
			bit_count <= 3'b111 ;
			mosi      <= 1'b0 ;
		end else begin
			if (tr_en) begin
				if (sck_edge_level) begin
					case (sck_edge_cnt)
						1, 3, 5, 7, 9, 11, 13, 15:begin
							sck <= ~sck ;
							if (cpha) begin  
								mosi <= data_m [bit_count]     ;
								bit_count <= bit_count - 1'b1;
							end
							else begin
								data_r_m <= {data_r_m[6:0], miso} ; 
							end
						end
						2, 4, 6, 8, 10, 12, 14, 16:begin
							sck <= ~sck ;
							if (cpha) begin
								data_r_m <= {data_r_m[6:0], miso} ;
							end
							else begin
								mosi <= data_m [bit_count] 	  ;
								bit_count <= bit_count - 1'b1 ;
							end
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
					mosi <= data_m[7] ;
					bit_count <= 4'd6 ;
				end
			end
		end
	end
```



- 数据传输接收信号产生模块

```verilog
always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			tr_done_dly1 <= 1'b0 ;
		end
		else begin
			tr_done_dly1 <= tr_done ;
		end
	end


	// if tr_done = 1, 8 bits data_m is being transfer
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			tr_done <= 1'b0;
		end else begin
			if (tr_en && sck_edge_cnt == 5'd16) begin
				tr_done <= 1'b1 ;
			end else begin
				tr_done <= 1'b0 ;
			end
		end
	end

	always @(*) begin
		data_finish_m = tr_done && ~tr_done_dly1;
	end
```

### spi_slave

#### input变量声明

| clk           | 系统时钟                         |
| ------------- | -------------------------------- |
| rst_n         | 系统复位，低电平有效             |
| data_s [7:0]  | 从机需要发送的数据               |
| spcon_s [7:0] | spi 控制寄存器1输入              |
| mosi          | 主机输出，从机输入，接收主机数据 |
| sck           | spi 时钟，主机产生，从机接收     |
| ssn           | spi 片选信号                     |

 

#### output变量声明

| data_r_s [7:0]  (reg) | 从机接收到的数据                 |
| --------------------- | -------------------------------- |
| data_finish_s  (reg)  | 从机接收8bit数据完成信号         |
| miso (reg)            | 主机输入，从机输出，发送从机数据 |

 

#### 内部变量声明

wire型变量声明

| tr_en          | 传输使能，为1时开始传输数据   |
| -------------- | ----------------------------- |
| cpol           | spi 极性控制信号              |
| cpha           | spi 相位控制信号              |
| sck_edge_level | sck边沿检测，sck发生跳变时为1 |

 

reg型变量声明

| sck_edge_cnt  [4:0] | 记录sck边沿数             |
| ------------------- | ------------------------- |
| sck_dly1            | sck延时一拍，用于边沿检测 |
| sck_dly2            | sck延时两拍               |
| bit_count [2:0]     | 用于发送数据时计数        |

 

#### 各模块简介

- 变量声明及wire型变量赋值

```verilog
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
```



- sck边沿检测并计数

```verilog
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
```



- 数据发送与接收模块

```verilog
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
```



- 数据传输完成信号产生模块

```verilog
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
```

### spi_ms

#### input变量声明

| clk             | 系统时钟             |
| --------------- | -------------------- |
| rst_n           | 系统复位，低电平有效 |
| sfraddr_w [1:0] | sfr写地址            |
| sfrwe           | sfr 写使能           |
| spidata_i [7:0] | 写数据输入           |
| sfraddr_r [2:0] | sfr 读地址           |
| spssn_i [7:0]   | 作为主机时ssn输入    |
| ssn             | 作为从机时ssn输入    |

#### output变量声明

| sfr_data_o [7:0]  (reg) | sfr读数据输出     |
| ----------------------- | ----------------- |
| spssn_o [7:0]  (wire)   | 作为主机时ssn输出 |

#### inout变量声明

| mosi | 作为主机时为输出，从机时为输入 |
| ---- | ------------------------------ |
| miso | 作为主机时为输入，从机时为输出 |
| sck  | 作为主机时为输出，从机时为输入 |

#### 内部变量声明

l wire型变量声明

| spidr2 [7:0]   | spi 数据寄存器2               |
| -------------- | ----------------------------- |
| spidr2_m [7:0] | 主机数据寄存器2               |
| spidr2_s [7:0] | 从机数据寄存器2               |
| data_finish_m  | 主机传输完成信号              |
| data_finish_s  | 从机传输完成信号              |
| miso_m         | 主机miso                      |
| miso_s         | 从机miso                      |
| mosi_m         | 主机mosi                      |
| mosi_s         | 从机mosi                      |
| sck_m          | 主机sck                       |
| sck_s          | 从机sck                       |
| intspi         | 中断信号                      |
| mstr           | 主机从机选择信号，为1选择主机 |

 

l reg型变量声明

| spicr1         | spi 控制寄存器1          |
| -------------- | ------------------------ |
| spicr2         | spi 控制寄存器2          |
| spibr          | spi 分频寄存器           |
| spisr          | spi 状态寄存器           |
| spidr1         | spi 数据寄存器1          |
| rst_n_sync_pre | 异步复位，同步释放前信号 |
| rst_n_sync     | 异步复位，同步释放信号   |

#### 各模块简介

- 三态门缓冲模块

```verilog
	wire mstr = spicr1[4] ; // mstr = 0 means slave model, mstr = 1 means master model

    assign sck    = mstr ? sck_m : 1'bz  ;
    assign sck_s  = mstr ? 1'bz  : sck   ;

    assign mosi   = mstr ? mosi_m: 1'bz  ;
    assign mosi_s = mstr ? 1'bz  : mosi  ;

    assign miso_m = mstr ? miso  : 1'bz  ;
    assign miso   = mstr ? 1'bz  : miso_s;
```



- 同步复位，异步释放模块

```verilog
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
```



- 例化主机和从机

```verilog
spi_master inst_spi_master
        (
            .clk           (clk          ),
            .rst_n         (rst_n_sync   ),
            .data_m        (spidr1       ),
            .spcon         (spicr1       ),
            .spibr         (spibr        ),
            .spssn         (spssn_i      ),
            .data_r_m      (spidr2_m     ),
            .data_finish_m (data_finish_m),
            .miso          (miso_m       ),
            .mosi          (mosi_m       ),
            .sck           (sck_m        ),
            .ssn           (spssn_o      )
        );

    spi_slave inst_spi_slave
        (
            .clk           (clk          ),
            .rst_n         (rst_n_sync   ),
            .data_s        (spidr1       ),
            .spcon_s       (spicr1       ),
            .data_finish_s (data_finish_s),
            .data_r_s      (spidr2_s     ),
            .mosi          (mosi_s       ),
            .miso          (miso_s       ),
            .sck           (sck_s        ),
            .ssn           (ssn          )
        );
```



- 寄存器读写模块

```verilog
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
```

### Testbench

- 时钟及复位

```verilog
// clock
	logic m_clk;
	initial begin
		m_clk = '0;
		forever #(20) m_clk = ~m_clk;
	end

	logic s_clk;
	initial begin
		s_clk = '0;
		#2
		s_clk = '1;
		forever #(20) s_clk = ~s_clk;
	end

	// asynchronous reset
	logic rst_n;
	initial begin
		rst_n <= '0;
		#80
		rst_n <= '1;
	end
```



- 例化模块并连接主机和从机

```verilog
logic [1:0] m_sfraddr_w;
	logic       m_sfrwe;
	logic [7:0] m_spidata_i;
	logic [2:0] m_sfraddr_r;
	logic [7:0] m_sfr_data_o;
	logic [7:0] m_spssn_i;
	logic [7:0] m_spssn_o;
	logic       m_ssn;

	wire       mosi;
	wire       miso;
	wire       sck;

	logic [1:0] s_sfraddr_w;
	logic       s_sfrwe;
	logic [7:0] s_spidata_i;
	logic [2:0] s_sfraddr_r;
	logic [7:0] s_sfr_data_o;
	logic [7:0] s_spssn_i;
	logic [7:0] s_spssn_o;

	logic       s_ssn;

	spi_ms inst_spi_ms_master
		(
			.clk        (m_clk),
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

	assign s_ssn = m_spssn_o[0] ;

	spi_ms inst_spi_ms_slave
		(
			.clk        (s_clk),
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
```



- 初始化及寄存器测试

```verilog
task init();
		m_sfraddr_w <= '0;
		m_sfrwe     <= '0;
		m_spidata_i <= '0;
		m_sfraddr_r <= '0;
		m_spssn_i   <= 8'hff;
		m_ssn       <= '1;
		s_sfraddr_w <= '0;
		s_sfrwe     <= '0;
		s_spidata_i <= '0;
		s_sfraddr_r <= '0;
		s_spssn_i   <= 8'hff;
	endtask

	task spssn_test();
		for (int i = 0; i < 256; i++) begin
			m_spssn_i <= i ;
			s_spssn_i <= i ;
			@(posedge m_clk) ;
		end
	endtask

	task sfr_data_o_test();
		for (int i = 0; i < 8; i++) begin
			m_sfraddr_r <= i ;
			s_sfraddr_r <= i ;
		end
	endtask
```



- 配置主机和从机

```verilog
task set_mode_m(int mode_sel_m, int m_spibr);
		m_sfrwe     <= '1;
		@(posedge m_clk);
		m_sfraddr_w <= 2'b00;
		m_sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		m_spidata_i <= mode_sel_m; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b01;
		m_sfraddr_r <= 3'b001;
		m_spidata_i <= 8'b0000_0001;
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b10;
		m_sfraddr_r <= 3'b010;
		m_spidata_i <= {1'b0, m_spibr[5:3], 1'b0, m_spibr[2:0]};	// m_clk / 16
		repeat(2)@(posedge m_clk);
		m_sfraddr_w <= 2'b11;
		m_sfraddr_r <= 3'b011;
		m_spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge m_clk);
		read_sfr();
	endtask

	task set_mode_s(int mode_sel_s);
		s_sfrwe     <= '1;
		@(posedge s_clk);
		s_sfraddr_w <= 2'b00;
		s_sfraddr_r <= 3'b000;
		// spidata_i <= 8'b0101_0000; // spi enable, master mode, mode 00
		s_spidata_i <= mode_sel_s; // [6]:SPE, [4]:MSTR, mode 00 [3]:cpol, [2]: cpha
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b01;
		s_sfraddr_r <= 3'b001;
		s_spidata_i <= 8'b0000_0001;
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b10;
		s_sfraddr_r <= 3'b010;
		s_spidata_i <= 8'b0000_0011;	// clk / 16
		repeat(2)@(posedge s_clk);
		s_sfraddr_w <= 2'b11;
		s_sfraddr_r <= 3'b011;
		s_spidata_i <= 8'b0000_0000;  // ready to transfer data
		@(posedge s_clk);
		read_sfr();
	endtask

	task read_sfr();
		m_sfraddr_r <= 3'b101 ;
		s_sfraddr_r <= 3'b101 ;
		repeat(2)@(posedge m_clk);	
	endtask
```



- 主从间传输数据

```verilog
int m_spibr_post2 ;
	task transfer_data_master_slave(int iter_ms, int m_spibr);
		for(int it = 0; it < iter_ms; it++) begin
			m_spidata_i <= $urandom_range(0,255);
			s_spidata_i <= $urandom_range(0,255);
			repeat(2)@(posedge m_clk);
			m_spssn_i  <= 8'hfe;
			m_spibr_post2 = m_spibr[2:0] ;
			repeat((m_spibr[5:3]+1) * $pow(2,m_spibr_post2+1) * 8 + 3)@(posedge m_clk);
			m_spssn_i  <= 8'hff;
			repeat(10)@(posedge m_clk);
		end
	endtask
```

 

- 任务调用

```verilog
init();
		repeat(10)@(posedge m_clk);
		for (int m_spibr = 0; m_spibr < 64; m_spibr++) begin

			set_mode_m(8'b0101_0000, m_spibr);
			set_mode_s(8'b0100_0000);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0010, m_spibr);
			set_mode_s(8'b0100_0010);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0100, m_spibr);
			set_mode_s(8'b0100_0100);
			transfer_data_master_slave(2, m_spibr);
	
			set_mode_m(8'b0101_0110, m_spibr);
			set_mode_s(8'b0100_0110);
			transfer_data_master_slave(2, m_spibr);		
		end

		repeat(10)@(posedge m_clk);
		spssn_test();
		sfr_data_o_test();
		repeat(10)@(posedge m_clk);
		$finish;
```



- dump 波形

```verilog
initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_spi_ms.fsdb");
			$fsdbDumpvars(0, "tb_spi_ms");
		end
	end
```

