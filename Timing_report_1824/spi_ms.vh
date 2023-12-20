/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP3
// Date      : Wed Dec 20 07:42:04 2023
/////////////////////////////////////////////////////////////


module spi_ms ( clk, rst_n, sfraddr_w, sfrwe, spidata_i, sfraddr_r, sfr_data_o, 
        spssn_i, spssn_o, mosi, miso, sck, ssn );
  input [1:0] sfraddr_w;
  input [7:0] spidata_i;
  input [2:0] sfraddr_r;
  output [7:0] sfr_data_o;
  input [7:0] spssn_i;
  output [7:0] spssn_o;
  input clk, rst_n, sfrwe, ssn;
  inout mosi,  miso,  sck;
  wire   sck_m, mosi_m, miso_s, rst_n_sync, rst_n_sync_pre, data_finish_m,
         data_finish_s, N72, N73, N74, N75, N76, N77, N78, N79, n1, n5, n7, n9,
         n12, n13, n14, n15, n16, n17, n18, n19, n21, n22, n24, n25, n26, n27,
         n28, n30, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42, n43, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, \inst_spi_master/n106 , \inst_spi_master/n105 ,
         \inst_spi_master/n104 , \inst_spi_master/n103 ,
         \inst_spi_master/n102 , \inst_spi_master/n101 ,
         \inst_spi_master/n100 , \inst_spi_master/n99 , \inst_spi_master/n98 ,
         \inst_spi_master/n97 , \inst_spi_master/n96 , \inst_spi_master/n95 ,
         \inst_spi_master/n94 , \inst_spi_master/n93 , \inst_spi_master/n92 ,
         \inst_spi_master/n91 , \inst_spi_master/n90 , \inst_spi_master/n89 ,
         \inst_spi_master/n87 , \inst_spi_master/n86 , \inst_spi_master/n85 ,
         \inst_spi_master/n84 , \inst_spi_master/n83 , \inst_spi_master/n82 ,
         \inst_spi_master/n81 , \inst_spi_master/n80 , \inst_spi_master/n79 ,
         \inst_spi_master/n78 , \inst_spi_master/n77 , \inst_spi_master/n76 ,
         \inst_spi_master/n75 , \inst_spi_master/n74 , \inst_spi_master/n73 ,
         \inst_spi_master/n72 , \inst_spi_master/n71 , \inst_spi_master/n70 ,
         \inst_spi_master/n69 , \inst_spi_master/n68 , \inst_spi_master/n67 ,
         \inst_spi_master/n66 , \inst_spi_master/n65 , \inst_spi_master/n64 ,
         \inst_spi_master/n63 , \inst_spi_master/n62 , \inst_spi_master/n61 ,
         \inst_spi_master/n60 , \inst_spi_master/n59 , \inst_spi_master/n58 ,
         \inst_spi_master/n57 , \inst_spi_master/n56 , \inst_spi_master/n55 ,
         \inst_spi_master/n54 , \inst_spi_master/n52 , \inst_spi_master/n51 ,
         \inst_spi_master/n50 , \inst_spi_master/n49 , \inst_spi_master/n47 ,
         \inst_spi_master/n44 , \inst_spi_master/n43 , \inst_spi_master/n42 ,
         \inst_spi_master/n41 , \inst_spi_master/n40 , \inst_spi_master/n39 ,
         \inst_spi_master/n38 , \inst_spi_master/n37 , \inst_spi_master/n36 ,
         \inst_spi_master/n34 , \inst_spi_master/n32 , \inst_spi_master/n31 ,
         \inst_spi_master/n30 , \inst_spi_master/n29 , \inst_spi_master/n28 ,
         \inst_spi_master/n26 , \inst_spi_master/n25 , \inst_spi_master/n24 ,
         \inst_spi_master/n22 , \inst_spi_master/n20 , \inst_spi_master/n18 ,
         \inst_spi_master/n17 , \inst_spi_master/n16 , \inst_spi_master/n15 ,
         \inst_spi_master/n13 , \inst_spi_master/n10 , \inst_spi_master/n9 ,
         \inst_spi_master/dp_cluster_0/N165 ,
         \inst_spi_master/dp_cluster_0/N166 ,
         \inst_spi_master/dp_cluster_0/N167 ,
         \inst_spi_master/dp_cluster_0/N168 ,
         \inst_spi_master/dp_cluster_0/N169 ,
         \inst_spi_master/dp_cluster_0/N170 ,
         \inst_spi_master/dp_cluster_0/N171 , \inst_spi_master/N152 ,
         \inst_spi_master/tr_done , \inst_spi_master/tr_done_dly1 ,
         \inst_spi_master/N41 , \inst_spi_master/N34 , \inst_spi_master/N33 ,
         \inst_spi_master/N32 , \inst_spi_master/N31 ,
         \inst_spi_master/sck_edge_level , \inst_spi_master/N25 ,
         \inst_spi_master/N24 , \inst_spi_master/N23 , \inst_spi_master/N22 ,
         \inst_spi_master/N21 , \inst_spi_master/N20 , \inst_spi_master/N19 ,
         \inst_spi_master/N16 , \inst_spi_slave/n56 , \inst_spi_slave/n55 ,
         \inst_spi_slave/n54 , \inst_spi_slave/n53 , \inst_spi_slave/n52 ,
         \inst_spi_slave/n51 , \inst_spi_slave/n50 , \inst_spi_slave/n49 ,
         \inst_spi_slave/n48 , \inst_spi_slave/n47 , \inst_spi_slave/n46 ,
         \inst_spi_slave/n45 , \inst_spi_slave/n44 , \inst_spi_slave/n43 ,
         \inst_spi_slave/n42 , \inst_spi_slave/n41 , \inst_spi_slave/n40 ,
         \inst_spi_slave/n39 , \inst_spi_slave/n38 , \inst_spi_slave/n37 ,
         \inst_spi_slave/n36 , \inst_spi_slave/n35 , \inst_spi_slave/n34 ,
         \inst_spi_slave/n33 , \inst_spi_slave/n32 , \inst_spi_slave/n31 ,
         \inst_spi_slave/n30 , \inst_spi_slave/n29 , \inst_spi_slave/n28 ,
         \inst_spi_slave/n27 , \inst_spi_slave/n26 , \inst_spi_slave/n25 ,
         \inst_spi_slave/n24 , \inst_spi_slave/n23 , \inst_spi_slave/n22 ,
         \inst_spi_slave/n21 , \inst_spi_slave/n20 , \inst_spi_slave/n19 ,
         \inst_spi_slave/n18 , \inst_spi_slave/n17 , \inst_spi_slave/n16 ,
         \inst_spi_slave/n15 , \inst_spi_slave/n14 , \inst_spi_slave/n13 ,
         \inst_spi_slave/n9 , \inst_spi_slave/n8 , \inst_spi_slave/n5 ,
         \inst_spi_slave/n4 , \inst_spi_slave/N123 , \inst_spi_slave/N23 ,
         \inst_spi_slave/N22 , \inst_spi_slave/N21 , \inst_spi_slave/N20 ,
         \inst_spi_slave/sck_dly1 , n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160;
  wire   [7:0] spicr1;
  wire   [7:0] spidr1;
  wire   [7:0] spibr;
  wire   [7:0] spidr2_m;
  wire   [7:0] spidr2_s;
  wire   [7:0] spisr;
  wire   [7:0] spicr2;
  wire   [4:0] \inst_spi_master/sck_edge_cnt ;
  wire   [7:0] \inst_spi_master/clk_cnt ;
  wire   [7:0] \inst_spi_master/clk_div ;
  wire   [3:0] \inst_spi_master/sppr_add1 ;
  wire   [2:0] \inst_spi_slave/bit_count ;
  wire   [4:0] \inst_spi_slave/sck_edge_cnt ;
  wire   [4:2] \inst_spi_slave/add_80/carry ;
  wire   [4:2] \inst_spi_master/add_113/carry ;
  wire   [7:2] \inst_spi_master/dp_cluster_0/add_88_aco/carry ;
  tri   mosi;
  tri   miso;
  tri   sck;
  tri   sck_s;
  tri   mosi_s;
  tri   miso_m;
  assign spssn_o[7] = spssn_i[7];
  assign spssn_o[6] = spssn_i[6];
  assign spssn_o[5] = spssn_i[5];
  assign spssn_o[4] = spssn_i[4];
  assign spssn_o[3] = spssn_i[3];
  assign spssn_o[2] = spssn_i[2];
  assign spssn_o[1] = spssn_i[1];
  assign spssn_o[0] = spssn_i[0];

  V5_OR2D1A \inst_spi_slave/U47  ( .A1(\inst_spi_slave/sck_edge_cnt [3]), .A2(
        \inst_spi_slave/sck_edge_cnt [2]), .Z(\inst_spi_slave/n39 ) );
  V5_OR4D1A \inst_spi_slave/U46  ( .A1(\inst_spi_slave/n4 ), .A2(
        \inst_spi_slave/sck_edge_cnt [0]), .A3(\inst_spi_slave/n39 ), .A4(
        \inst_spi_slave/sck_edge_cnt [1]), .Z(\inst_spi_slave/n38 ) );
  V5_AO22D1A \inst_spi_slave/U41  ( .A1(\inst_spi_slave/n36 ), .A2(
        \inst_spi_slave/sck_edge_cnt [0]), .B1(n87), .B2(\inst_spi_slave/n37 ), 
        .Z(\inst_spi_slave/n56 ) );
  V5_AO22D1A \inst_spi_slave/U40  ( .A1(\inst_spi_slave/n36 ), .A2(
        \inst_spi_slave/sck_edge_cnt [4]), .B1(\inst_spi_slave/N23 ), .B2(
        \inst_spi_slave/n37 ), .Z(\inst_spi_slave/n55 ) );
  V5_AO22D1A \inst_spi_slave/U39  ( .A1(\inst_spi_slave/sck_edge_cnt [3]), 
        .A2(\inst_spi_slave/n36 ), .B1(\inst_spi_slave/N22 ), .B2(
        \inst_spi_slave/n37 ), .Z(\inst_spi_slave/n54 ) );
  V5_AO22D1A \inst_spi_slave/U38  ( .A1(\inst_spi_slave/sck_edge_cnt [2]), 
        .A2(\inst_spi_slave/n36 ), .B1(\inst_spi_slave/N21 ), .B2(
        \inst_spi_slave/n37 ), .Z(\inst_spi_slave/n53 ) );
  V5_AO22D1A \inst_spi_slave/U37  ( .A1(\inst_spi_slave/sck_edge_cnt [1]), 
        .A2(\inst_spi_slave/n36 ), .B1(\inst_spi_slave/N20 ), .B2(
        \inst_spi_slave/n37 ), .Z(\inst_spi_slave/n52 ) );
  V5_OR2D1A \inst_spi_slave/U36  ( .A1(n112), .A2(spicr1[1]), .Z(
        \inst_spi_slave/n17 ) );
  V5_OR4D1A \inst_spi_slave/U34  ( .A1(\inst_spi_slave/n14 ), .A2(
        \inst_spi_slave/n35 ), .A3(\inst_spi_slave/sck_edge_cnt [4]), .A4(ssn), 
        .Z(\inst_spi_slave/n34 ) );
  V5_AO22D1A \inst_spi_slave/U12  ( .A1(miso_s), .A2(n110), .B1(
        \inst_spi_slave/n15 ), .B2(\inst_spi_slave/n16 ), .Z(
        \inst_spi_slave/n48 ) );
  V5_AO22D1A \inst_spi_slave/U10  ( .A1(mosi_s), .A2(n109), .B1(spidr2_s[0]), 
        .B2(\inst_spi_slave/n13 ), .Z(\inst_spi_slave/n47 ) );
  V5_AO22D1A \inst_spi_slave/U9  ( .A1(n109), .A2(spidr2_s[0]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[1]), .Z(\inst_spi_slave/n46 ) );
  V5_AO22D1A \inst_spi_slave/U8  ( .A1(n109), .A2(spidr2_s[1]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[2]), .Z(\inst_spi_slave/n45 ) );
  V5_AO22D1A \inst_spi_slave/U7  ( .A1(n109), .A2(spidr2_s[2]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[3]), .Z(\inst_spi_slave/n44 ) );
  V5_AO22D1A \inst_spi_slave/U6  ( .A1(n109), .A2(spidr2_s[3]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[4]), .Z(\inst_spi_slave/n43 ) );
  V5_AO22D1A \inst_spi_slave/U5  ( .A1(n109), .A2(spidr2_s[4]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[5]), .Z(\inst_spi_slave/n42 ) );
  V5_AO22D1A \inst_spi_slave/U4  ( .A1(n109), .A2(spidr2_s[5]), .B1(
        \inst_spi_slave/n13 ), .B2(spidr2_s[6]), .Z(\inst_spi_slave/n41 ) );
  V5_AO22D1A \inst_spi_slave/U3  ( .A1(spidr2_s[6]), .A2(n109), .B1(
        spidr2_s[7]), .B2(\inst_spi_slave/n13 ), .Z(\inst_spi_slave/n40 ) );
  V5_HAD1A \inst_spi_slave/add_80/U1_1_1  ( .A(
        \inst_spi_slave/sck_edge_cnt [1]), .B(\inst_spi_slave/sck_edge_cnt [0]), .CO(\inst_spi_slave/add_80/carry [2]), .S(\inst_spi_slave/N20 ) );
  V5_HAD1A \inst_spi_slave/add_80/U1_1_2  ( .A(
        \inst_spi_slave/sck_edge_cnt [2]), .B(\inst_spi_slave/add_80/carry [2]), .CO(\inst_spi_slave/add_80/carry [3]), .S(\inst_spi_slave/N21 ) );
  V5_HAD1A \inst_spi_slave/add_80/U1_1_3  ( .A(
        \inst_spi_slave/sck_edge_cnt [3]), .B(\inst_spi_slave/add_80/carry [3]), .CO(\inst_spi_slave/add_80/carry [4]), .S(\inst_spi_slave/N22 ) );
  V5_HAD1A \inst_spi_master/add_113/U1_1_1  ( .A(
        \inst_spi_master/sck_edge_cnt [1]), .B(
        \inst_spi_master/sck_edge_cnt [0]), .CO(
        \inst_spi_master/add_113/carry [2]), .S(\inst_spi_master/N31 ) );
  V5_HAD1A \inst_spi_master/add_113/U1_1_2  ( .A(
        \inst_spi_master/sck_edge_cnt [2]), .B(
        \inst_spi_master/add_113/carry [2]), .CO(
        \inst_spi_master/add_113/carry [3]), .S(\inst_spi_master/N32 ) );
  V5_HAD1A \inst_spi_master/add_113/U1_1_3  ( .A(
        \inst_spi_master/sck_edge_cnt [3]), .B(
        \inst_spi_master/add_113/carry [3]), .CO(
        \inst_spi_master/add_113/carry [4]), .S(\inst_spi_master/N33 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_1  ( .A(
        \inst_spi_master/dp_cluster_0/N166 ), .B(
        \inst_spi_master/dp_cluster_0/N165 ), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [2]), .S(
        \inst_spi_master/N19 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_2  ( .A(
        \inst_spi_master/dp_cluster_0/N167 ), .B(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [2]), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [3]), .S(
        \inst_spi_master/N20 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_3  ( .A(
        \inst_spi_master/dp_cluster_0/N168 ), .B(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [3]), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [4]), .S(
        \inst_spi_master/N21 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_4  ( .A(
        \inst_spi_master/dp_cluster_0/N169 ), .B(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [4]), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [5]), .S(
        \inst_spi_master/N22 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_5  ( .A(
        \inst_spi_master/dp_cluster_0/N170 ), .B(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [5]), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [6]), .S(
        \inst_spi_master/N23 ) );
  V5_HAD1A \inst_spi_master/dp_cluster_0/add_88_aco/U1_1_6  ( .A(
        \inst_spi_master/dp_cluster_0/N171 ), .B(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [6]), .CO(
        \inst_spi_master/dp_cluster_0/add_88_aco/carry [7]), .S(
        \inst_spi_master/N24 ) );
  V5_AO22D1A U5 ( .A1(n1), .A2(spicr1[0]), .B1(n97), .B2(spidata_i[0]), .Z(n48) );
  V5_AO22D1A U6 ( .A1(n1), .A2(spicr1[1]), .B1(n97), .B2(spidata_i[1]), .Z(n49) );
  V5_AO22D1A U7 ( .A1(n1), .A2(spicr1[2]), .B1(n97), .B2(spidata_i[2]), .Z(n50) );
  V5_AO22D1A U8 ( .A1(n1), .A2(spicr1[3]), .B1(n97), .B2(spidata_i[3]), .Z(n51) );
  V5_AO22D1A U9 ( .A1(spicr1[4]), .A2(n1), .B1(n97), .B2(spidata_i[4]), .Z(n52) );
  V5_AO22D1A U10 ( .A1(n1), .A2(spicr1[5]), .B1(n97), .B2(spidata_i[5]), .Z(
        n53) );
  V5_AO22D1A U11 ( .A1(n1), .A2(spicr1[6]), .B1(n97), .B2(spidata_i[6]), .Z(
        n54) );
  V5_AO22D1A U12 ( .A1(n1), .A2(spicr1[7]), .B1(n97), .B2(spidata_i[7]), .Z(
        n55) );
  V5_AO22D1A U15 ( .A1(n5), .A2(spicr2[0]), .B1(spidata_i[0]), .B2(n98), .Z(
        n56) );
  V5_AO22D1A U16 ( .A1(n5), .A2(spicr2[1]), .B1(spidata_i[1]), .B2(n98), .Z(
        n57) );
  V5_AO22D1A U17 ( .A1(n5), .A2(spicr2[2]), .B1(spidata_i[2]), .B2(n98), .Z(
        n58) );
  V5_AO22D1A U18 ( .A1(n5), .A2(spicr2[3]), .B1(spidata_i[3]), .B2(n98), .Z(
        n59) );
  V5_AO22D1A U19 ( .A1(n5), .A2(spicr2[4]), .B1(spidata_i[4]), .B2(n98), .Z(
        n60) );
  V5_AO22D1A U20 ( .A1(n5), .A2(spicr2[5]), .B1(spidata_i[5]), .B2(n98), .Z(
        n61) );
  V5_AO22D1A U21 ( .A1(n5), .A2(spicr2[6]), .B1(spidata_i[6]), .B2(n98), .Z(
        n62) );
  V5_AO22D1A U22 ( .A1(n5), .A2(spicr2[7]), .B1(spidata_i[7]), .B2(n98), .Z(
        n63) );
  V5_AO22D1A U26 ( .A1(n7), .A2(spibr[0]), .B1(spidata_i[0]), .B2(n100), .Z(
        n64) );
  V5_AO22D1A U27 ( .A1(n7), .A2(spibr[1]), .B1(spidata_i[1]), .B2(n100), .Z(
        n65) );
  V5_AO22D1A U28 ( .A1(n7), .A2(spibr[2]), .B1(spidata_i[2]), .B2(n100), .Z(
        n66) );
  V5_AO22D1A U29 ( .A1(n7), .A2(spibr[3]), .B1(spidata_i[3]), .B2(n100), .Z(
        n67) );
  V5_AO22D1A U30 ( .A1(n7), .A2(spibr[4]), .B1(spidata_i[4]), .B2(n100), .Z(
        n68) );
  V5_AO22D1A U31 ( .A1(n7), .A2(spibr[5]), .B1(spidata_i[5]), .B2(n100), .Z(
        n69) );
  V5_AO22D1A U32 ( .A1(n7), .A2(spibr[6]), .B1(spidata_i[6]), .B2(n100), .Z(
        n70) );
  V5_AO22D1A U33 ( .A1(n7), .A2(spibr[7]), .B1(spidata_i[7]), .B2(n100), .Z(
        n71) );
  V5_AO22D1A U37 ( .A1(n9), .A2(spidr1[0]), .B1(spidata_i[0]), .B2(n101), .Z(
        n72) );
  V5_AO22D1A U38 ( .A1(n9), .A2(spidr1[1]), .B1(spidata_i[1]), .B2(n101), .Z(
        n73) );
  V5_AO22D1A U39 ( .A1(n9), .A2(spidr1[2]), .B1(spidata_i[2]), .B2(n101), .Z(
        n74) );
  V5_AO22D1A U40 ( .A1(n9), .A2(spidr1[3]), .B1(spidata_i[3]), .B2(n101), .Z(
        n75) );
  V5_AO22D1A U41 ( .A1(n9), .A2(spidr1[4]), .B1(spidata_i[4]), .B2(n101), .Z(
        n76) );
  V5_AO22D1A U42 ( .A1(n9), .A2(spidr1[5]), .B1(spidata_i[5]), .B2(n101), .Z(
        n77) );
  V5_AO22D1A U43 ( .A1(n9), .A2(spidr1[6]), .B1(spidata_i[6]), .B2(n101), .Z(
        n78) );
  V5_AO22D1A U44 ( .A1(n9), .A2(spidr1[7]), .B1(spidata_i[7]), .B2(n101), .Z(
        n79) );
  V5_OR3D1A \inst_spi_master/U92  ( .A1(\inst_spi_master/sck_edge_cnt [2]), 
        .A2(\inst_spi_master/sck_edge_cnt [3]), .A3(
        \inst_spi_master/sck_edge_cnt [1]), .Z(\inst_spi_master/n49 ) );
  V5_AO22D1A \inst_spi_master/U72  ( .A1(\inst_spi_master/clk_cnt [0]), .A2(
        \inst_spi_master/n15 ), .B1(n113), .B2(n108), .Z(\inst_spi_master/n83 ) );
  V5_AO22D1A \inst_spi_master/U71  ( .A1(\inst_spi_master/clk_cnt [1]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N19 ), .B2(n108), .Z(
        \inst_spi_master/n82 ) );
  V5_AO22D1A \inst_spi_master/U70  ( .A1(\inst_spi_master/clk_cnt [2]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N20 ), .B2(n108), .Z(
        \inst_spi_master/n81 ) );
  V5_AO22D1A \inst_spi_master/U69  ( .A1(\inst_spi_master/clk_cnt [3]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N21 ), .B2(n108), .Z(
        \inst_spi_master/n80 ) );
  V5_AO22D1A \inst_spi_master/U68  ( .A1(\inst_spi_master/clk_cnt [4]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N22 ), .B2(n108), .Z(
        \inst_spi_master/n79 ) );
  V5_AO22D1A \inst_spi_master/U67  ( .A1(\inst_spi_master/clk_cnt [5]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N23 ), .B2(n108), .Z(
        \inst_spi_master/n78 ) );
  V5_AO22D1A \inst_spi_master/U66  ( .A1(\inst_spi_master/clk_cnt [6]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N24 ), .B2(n108), .Z(
        \inst_spi_master/n77 ) );
  V5_AO22D1A \inst_spi_master/U65  ( .A1(\inst_spi_master/clk_cnt [7]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/N25 ), .B2(n108), .Z(
        \inst_spi_master/n76 ) );
  V5_OR2D1A \inst_spi_master/U64  ( .A1(spicr1[2]), .A2(rst_n_sync), .Z(
        \inst_spi_master/n74 ) );
  V5_AO22D1A \inst_spi_master/U59  ( .A1(\inst_spi_master/n50 ), .A2(
        \inst_spi_master/sck_edge_cnt [0]), .B1(n83), .B2(
        \inst_spi_master/n51 ), .Z(\inst_spi_master/n106 ) );
  V5_AO22D1A \inst_spi_master/U58  ( .A1(\inst_spi_master/sck_edge_cnt [1]), 
        .A2(\inst_spi_master/n50 ), .B1(\inst_spi_master/N31 ), .B2(
        \inst_spi_master/n51 ), .Z(\inst_spi_master/n105 ) );
  V5_AO22D1A \inst_spi_master/U57  ( .A1(\inst_spi_master/sck_edge_cnt [2]), 
        .A2(\inst_spi_master/n50 ), .B1(\inst_spi_master/N32 ), .B2(
        \inst_spi_master/n51 ), .Z(\inst_spi_master/n104 ) );
  V5_AO22D1A \inst_spi_master/U56  ( .A1(\inst_spi_master/sck_edge_cnt [3]), 
        .A2(\inst_spi_master/n50 ), .B1(\inst_spi_master/N33 ), .B2(
        \inst_spi_master/n51 ), .Z(\inst_spi_master/n103 ) );
  V5_AO22D1A \inst_spi_master/U55  ( .A1(\inst_spi_master/n50 ), .A2(
        \inst_spi_master/sck_edge_cnt [4]), .B1(\inst_spi_master/N34 ), .B2(
        \inst_spi_master/n51 ), .Z(\inst_spi_master/n102 ) );
  V5_OR2D1A \inst_spi_master/U49  ( .A1(n84), .A2(\inst_spi_master/n17 ), .Z(
        \inst_spi_master/n44 ) );
  V5_AO22D1A \inst_spi_master/U25  ( .A1(\inst_spi_master/n24 ), .A2(mosi_m), 
        .B1(\inst_spi_master/n25 ), .B2(\inst_spi_master/n26 ), .Z(
        \inst_spi_master/n98 ) );
  V5_OA22D1A \inst_spi_master/U24  ( .A1(\inst_spi_master/n17 ), .A2(spicr1[1]), .B1(n84), .B2(\inst_spi_master/n18 ), .Z(\inst_spi_master/n22 ) );
  V5_FD2D1A \inst_spi_master/tr_done_dly1_reg  ( .D(\inst_spi_master/tr_done ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_master/tr_done_dly1 ), .QN()
         );
  V5_FD2D1A \inst_spi_master/tr_done_reg  ( .D(\inst_spi_master/N152 ), .CK(
        clk), .RN(rst_n_sync), .Q(\inst_spi_master/tr_done ), .QN(
        \inst_spi_master/n87 ) );
  V5_FD2D1A \spisr_reg[4]  ( .D(n112), .CK(clk), .RN(n94), .Q(spisr[4]), .QN()
         );
  V5_FD2D1A \spisr_reg[1]  ( .D(data_finish_s), .CK(clk), .RN(rst_n_sync), .Q(
        spisr[1]), .QN() );
  V5_FD2D1A \spisr_reg[0]  ( .D(data_finish_m), .CK(clk), .RN(rst_n_sync), .Q(
        spisr[0]), .QN() );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[7]  ( .D(\inst_spi_master/n90 ), 
        .CK(clk), .RN(n94), .Q(spidr2_m[7]), .QN(\inst_spi_master/n72 ) );
  V5_FD2D1A \spicr1_reg[7]  ( .D(n55), .CK(clk), .RN(n96), .Q(spicr1[7]), 
        .QN() );
  V5_FD2D1A \spicr1_reg[5]  ( .D(n53), .CK(clk), .RN(n96), .Q(spicr1[5]), 
        .QN() );
  V5_FD2D1A \spicr1_reg[3]  ( .D(n51), .CK(clk), .RN(rst_n_sync), .Q(spicr1[3]), .QN() );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[0]  ( .D(\inst_spi_master/n97 ), 
        .CK(clk), .RN(n96), .Q(spidr2_m[0]), .QN(\inst_spi_master/n66 ) );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[6]  ( .D(\inst_spi_master/n91 ), 
        .CK(clk), .RN(rst_n_sync), .Q(spidr2_m[6]), .QN(\inst_spi_master/n73 )
         );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[5]  ( .D(\inst_spi_master/n92 ), 
        .CK(clk), .RN(rst_n_sync), .Q(spidr2_m[5]), .QN(\inst_spi_master/n71 )
         );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[4]  ( .D(\inst_spi_master/n93 ), 
        .CK(clk), .RN(n94), .Q(spidr2_m[4]), .QN(\inst_spi_master/n70 ) );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[3]  ( .D(\inst_spi_master/n94 ), 
        .CK(clk), .RN(n96), .Q(spidr2_m[3]), .QN(\inst_spi_master/n69 ) );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[2]  ( .D(\inst_spi_master/n95 ), 
        .CK(clk), .RN(rst_n_sync), .Q(spidr2_m[2]), .QN(\inst_spi_master/n68 )
         );
  V5_FD2D1A \inst_spi_master/data_r_m_reg[1]  ( .D(\inst_spi_master/n96 ), 
        .CK(clk), .RN(rst_n_sync), .Q(spidr2_m[1]), .QN(\inst_spi_master/n67 )
         );
  V5_FD2D1A \spicr2_reg[4]  ( .D(n60), .CK(clk), .RN(n96), .Q(spicr2[4]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[1]  ( .D(n57), .CK(clk), .RN(n96), .Q(spicr2[1]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[0]  ( .D(n56), .CK(clk), .RN(n96), .Q(spicr2[0]), 
        .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[7]  ( .D(\inst_spi_slave/n40 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[7]), .QN() );
  V5_FD2D1A \spicr1_reg[0]  ( .D(n48), .CK(clk), .RN(rst_n_sync), .Q(spicr1[0]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[5]  ( .D(\inst_spi_slave/n42 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[5]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[3]  ( .D(\inst_spi_slave/n44 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[3]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[2]  ( .D(\inst_spi_slave/n45 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[2]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[6]  ( .D(\inst_spi_slave/n41 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[6]), .QN() );
  V5_FD2D1A \spicr2_reg[7]  ( .D(n63), .CK(clk), .RN(n96), .Q(spicr2[7]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[6]  ( .D(n62), .CK(clk), .RN(n96), .Q(spicr2[6]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[5]  ( .D(n61), .CK(clk), .RN(n96), .Q(spicr2[5]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[3]  ( .D(n59), .CK(clk), .RN(n96), .Q(spicr2[3]), 
        .QN() );
  V5_FD2D1A \spicr2_reg[2]  ( .D(n58), .CK(clk), .RN(n96), .Q(spicr2[2]), 
        .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[4]  ( .D(\inst_spi_slave/n43 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[4]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[1]  ( .D(\inst_spi_slave/n46 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[1]), .QN() );
  V5_FD2D1A \inst_spi_slave/data_r_s_reg[0]  ( .D(\inst_spi_slave/n47 ), .CK(
        clk), .RN(n94), .Q(spidr2_s[0]), .QN() );
  V5_FD2D1A \spibr_reg[7]  ( .D(n71), .CK(clk), .RN(rst_n_sync), .Q(spibr[7]), 
        .QN() );
  V5_FD2D1A \spibr_reg[3]  ( .D(n67), .CK(clk), .RN(n96), .Q(spibr[3]), .QN()
         );
  V5_FD2D1A \spicr1_reg[2]  ( .D(n50), .CK(clk), .RN(rst_n_sync), .Q(spicr1[2]), .QN() );
  V5_FD3D1A \inst_spi_slave/bit_count_reg[2]  ( .D(\inst_spi_slave/n49 ), .CK(
        clk), .SN(rst_n_sync), .Q(\inst_spi_slave/bit_count [2]), .QN(
        \inst_spi_slave/n5 ) );
  V5_FD2D1A \spidr1_reg[4]  ( .D(n76), .CK(clk), .RN(rst_n_sync), .Q(spidr1[4]), .QN() );
  V5_FD2D1A \spidr1_reg[3]  ( .D(n75), .CK(clk), .RN(rst_n_sync), .Q(spidr1[3]), .QN(n88) );
  V5_FD2D1A \spidr1_reg[7]  ( .D(n79), .CK(clk), .RN(rst_n_sync), .Q(spidr1[7]), .QN(n85) );
  V5_FD2D1A \spidr1_reg[2]  ( .D(n74), .CK(clk), .RN(rst_n_sync), .Q(spidr1[2]), .QN(n90) );
  V5_FD2D1A \spidr1_reg[0]  ( .D(n72), .CK(clk), .RN(rst_n_sync), .Q(spidr1[0]), .QN() );
  V5_FD2D1A \spidr1_reg[1]  ( .D(n73), .CK(clk), .RN(rst_n_sync), .Q(spidr1[1]), .QN() );
  V5_FD2D1A \spidr1_reg[6]  ( .D(n78), .CK(clk), .RN(rst_n_sync), .Q(spidr1[6]), .QN(n91) );
  V5_FD2D1A \inst_spi_slave/sck_edge_cnt_reg[3]  ( .D(\inst_spi_slave/n54 ), 
        .CK(clk), .RN(n96), .Q(\inst_spi_slave/sck_edge_cnt [3]), .QN() );
  V5_FD2D1A \inst_spi_slave/sck_edge_cnt_reg[4]  ( .D(\inst_spi_slave/n55 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_slave/sck_edge_cnt [4]), .QN(
        \inst_spi_slave/n4 ) );
  V5_FD2D1A \spidr1_reg[5]  ( .D(n77), .CK(clk), .RN(rst_n_sync), .Q(spidr1[5]), .QN(n89) );
  V5_FD2D1A \inst_spi_slave/sck_edge_cnt_reg[2]  ( .D(\inst_spi_slave/n53 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_slave/sck_edge_cnt [2]), .QN()
         );
  V5_FD2D1A \inst_spi_master/sck_edge_level_reg  ( .D(\inst_spi_master/N41 ), 
        .CK(clk), .RN(n94), .Q(\inst_spi_master/sck_edge_level ), .QN() );
  V5_FD2D1A \inst_spi_slave/sck_dly1_reg  ( .D(sck_s), .CK(clk), .RN(n96), .Q(
        \inst_spi_slave/sck_dly1 ), .QN() );
  V5_FD3D1A \inst_spi_slave/bit_count_reg[0]  ( .D(\inst_spi_slave/n51 ), .CK(
        clk), .SN(rst_n_sync), .Q(\inst_spi_slave/bit_count [0]), .QN(
        \inst_spi_slave/n9 ) );
  V5_FD3D1A \inst_spi_slave/bit_count_reg[1]  ( .D(\inst_spi_slave/n50 ), .CK(
        clk), .SN(rst_n_sync), .Q(\inst_spi_slave/bit_count [1]), .QN(
        \inst_spi_slave/n8 ) );
  V5_FD2D1A \inst_spi_slave/sck_edge_cnt_reg[1]  ( .D(\inst_spi_slave/n52 ), 
        .CK(clk), .RN(n94), .Q(\inst_spi_slave/sck_edge_cnt [1]), .QN() );
  V5_FD2D1A \spicr1_reg[6]  ( .D(n54), .CK(clk), .RN(n96), .Q(spicr1[6]), 
        .QN() );
  V5_FD2D1A \inst_spi_slave/sck_edge_cnt_reg[0]  ( .D(\inst_spi_slave/n56 ), 
        .CK(clk), .RN(n96), .Q(\inst_spi_slave/sck_edge_cnt [0]), .QN(n87) );
  V5_FD2D1A \spicr1_reg[1]  ( .D(n49), .CK(clk), .RN(rst_n_sync), .Q(spicr1[1]), .QN(n84) );
  V5_FD2D1A \inst_spi_master/sck_edge_cnt_reg[0]  ( .D(\inst_spi_master/n106 ), 
        .CK(clk), .RN(n94), .Q(\inst_spi_master/sck_edge_cnt [0]), .QN(n83) );
  V5_FD2D1A \inst_spi_master/sck_edge_cnt_reg[4]  ( .D(\inst_spi_master/n102 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_master/sck_edge_cnt [4]), .QN(
        n80) );
  V5_FD2D1A \inst_spi_master/sck_edge_cnt_reg[1]  ( .D(\inst_spi_master/n105 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_master/sck_edge_cnt [1]), 
        .QN() );
  V5_FD2D1A \inst_spi_master/sck_edge_cnt_reg[3]  ( .D(\inst_spi_master/n103 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_master/sck_edge_cnt [3]), 
        .QN() );
  V5_FD2D1A \inst_spi_master/sck_edge_cnt_reg[2]  ( .D(\inst_spi_master/n104 ), 
        .CK(clk), .RN(rst_n_sync), .Q(\inst_spi_master/sck_edge_cnt [2]), 
        .QN() );
  V5_FD3D1A \inst_spi_master/clk_cnt_reg[0]  ( .D(\inst_spi_master/n83 ), .CK(
        clk), .SN(rst_n_sync), .Q(\inst_spi_master/clk_cnt [0]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[1]  ( .D(\inst_spi_master/n82 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [1]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[2]  ( .D(\inst_spi_master/n81 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [2]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[3]  ( .D(\inst_spi_master/n80 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [3]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[4]  ( .D(\inst_spi_master/n79 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [4]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[5]  ( .D(\inst_spi_master/n78 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [5]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[6]  ( .D(\inst_spi_master/n77 ), .CK(
        clk), .RN(n94), .Q(\inst_spi_master/clk_cnt [6]), .QN() );
  V5_FD2D1A \inst_spi_master/clk_cnt_reg[7]  ( .D(\inst_spi_master/n76 ), .CK(
        clk), .RN(rst_n_sync), .Q(\inst_spi_master/clk_cnt [7]), .QN() );
  V5_NITD1A mosi_s_tri ( .A(mosi), .OE(n82), .Z(mosi_s) );
  V5_NITD1A miso_m_tri ( .A(miso), .OE(spicr1[4]), .Z(miso_m) );
  V5_FD2D1A \inst_spi_master/mosi_reg  ( .D(\inst_spi_master/n98 ), .CK(clk), 
        .RN(rst_n_sync), .Q(mosi_m), .QN() );
  V5_FD2D1A \inst_spi_slave/miso_reg  ( .D(\inst_spi_slave/n48 ), .CK(clk), 
        .RN(rst_n_sync), .Q(miso_s), .QN() );
  V5_FD4D1A \inst_spi_master/sck_reg  ( .D(\inst_spi_master/n89 ), .CK(clk), 
        .RN(\inst_spi_master/n74 ), .SN(\inst_spi_master/n75 ), .Q(sck_m), 
        .QN(n86) );
  V5_FD2D1A \spibr_reg[2]  ( .D(n66), .CK(clk), .RN(n96), .Q(spibr[2]), .QN()
         );
  V5_FD2D1A \spibr_reg[0]  ( .D(n64), .CK(clk), .RN(n96), .Q(spibr[0]), .QN()
         );
  V5_FD2D1A \spibr_reg[1]  ( .D(n65), .CK(clk), .RN(n96), .Q(spibr[1]), .QN()
         );
  V5_FD2D1A \spicr1_reg[4]  ( .D(n52), .CK(clk), .RN(n96), .Q(spicr1[4]), .QN(
        n82) );
  V5_FD2D1A \spibr_reg[6]  ( .D(n70), .CK(clk), .RN(rst_n_sync), .Q(spibr[6]), 
        .QN() );
  V5_NITD1A sck_s_tri ( .A(sck), .OE(n82), .Z(sck_s) );
  V5_FD2D1A \spibr_reg[5]  ( .D(n69), .CK(clk), .RN(rst_n_sync), .Q(spibr[5]), 
        .QN() );
  V5_FD2D1A \spibr_reg[4]  ( .D(n68), .CK(clk), .RN(rst_n_sync), .Q(spibr[4]), 
        .QN(n81) );
  V5_FD2D1A \inst_spi_slave/data_finish_s_reg  ( .D(\inst_spi_slave/N123 ), 
        .CK(clk), .RN(n94), .Q(data_finish_s), .QN() );
  V5_FD2D1A \sfr_data_o_reg[7]  ( .D(N79), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[7]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[6]  ( .D(N78), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[6]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[5]  ( .D(N77), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[5]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[4]  ( .D(N76), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[4]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[3]  ( .D(N75), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[3]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[2]  ( .D(N74), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[2]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[1]  ( .D(N73), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[1]), .QN() );
  V5_FD2D1A \sfr_data_o_reg[0]  ( .D(N72), .CK(clk), .RN(rst_n_sync), .Q(
        sfr_data_o[0]), .QN() );
  V5_NITD1A miso_tri ( .A(miso_s), .OE(n82), .Z(miso) );
  V5_FD2D1A rst_n_sync_pre_reg ( .D(1'b1), .CK(clk), .RN(rst_n), .Q(
        rst_n_sync_pre), .QN() );
  V5_NITD1A mosi_tri ( .A(mosi_m), .OE(spicr1[4]), .Z(mosi) );
  V5_NITD1A sck_tri ( .A(sck_m), .OE(spicr1[4]), .Z(sck) );
  V5_FD3D1A \inst_spi_master/bit_count_reg[0]  ( .D(\inst_spi_master/n101 ), 
        .CK(clk), .SN(rst_n_sync), .Q(n130), .QN(\inst_spi_master/n86 ) );
  V5_FD3D1A \inst_spi_master/bit_count_reg[1]  ( .D(\inst_spi_master/n100 ), 
        .CK(clk), .SN(rst_n_sync), .Q(n129), .QN(\inst_spi_master/n85 ) );
  V5_FD3D1A \inst_spi_master/bit_count_reg[2]  ( .D(\inst_spi_master/n99 ), 
        .CK(clk), .SN(rst_n_sync), .Q(), .QN(\inst_spi_master/n84 ) );
  V5_ND2D1A U91 ( .A1(n125), .A2(n124), .Z(n160) );
  V5_IVD1A U92 ( .A(n12), .Z(n103) );
  V5_IVD1A U94 ( .A(n92), .Z(n96) );
  V5_IVD1A U95 ( .A(n92), .Z(n94) );
  V5_NR3D1A U96 ( .A1(\inst_spi_master/n50 ), .A2(\inst_spi_master/n52 ), .A3(
        \inst_spi_master/n15 ), .Z(\inst_spi_master/n51 ) );
  V5_IVD1A U97 ( .A(\inst_spi_master/n15 ), .Z(n108) );
  V5_AD2D1A U98 ( .A1(n108), .A2(\inst_spi_master/N16 ), .Z(
        \inst_spi_master/n50 ) );
  V5_ND2D1A U99 ( .A1(n108), .A2(\inst_spi_master/n38 ), .Z(
        \inst_spi_master/n39 ) );
  V5_IVD1A U100 ( .A(n153), .Z(n120) );
  V5_IVD1A U101 ( .A(n144), .Z(n121) );
  V5_OAI211D1A U102 ( .A1(n160), .A2(n159), .B(n158), .C(n114), .Z(
        \inst_spi_master/clk_div [7]) );
  V5_ND3D1A U103 ( .A1(n122), .A2(n153), .A3(n121), .Z(n158) );
  V5_IVD1A U104 ( .A(n157), .Z(n114) );
  V5_OAI33D1A U105 ( .A1(n156), .A2(n115), .A3(n155), .B1(n119), .B2(n118), 
        .B3(n154), .Z(n157) );
  V5_IVD1A U106 ( .A(n148), .Z(n115) );
  V5_ND2D1A U107 ( .A1(n147), .A2(n146), .Z(\inst_spi_master/clk_div [5]) );
  V5_AOI33D1A U108 ( .A1(n116), .A2(n155), .A3(n115), .B1(n143), .B2(n154), 
        .B3(n119), .Z(n147) );
  V5_AOI33D1A U109 ( .A1(n125), .A2(n145), .A3(n126), .B1(n149), .B2(n153), 
        .B3(n121), .Z(n146) );
  V5_IVD1A U110 ( .A(\inst_spi_master/n20 ), .Z(n107) );
  V5_ND2D1A U111 ( .A1(n141), .A2(n140), .Z(\inst_spi_master/clk_div [4]) );
  V5_AOI33D1A U112 ( .A1(n142), .A2(n154), .A3(n118), .B1(n156), .B2(n155), 
        .B3(n115), .Z(n141) );
  V5_AOI33D1A U113 ( .A1(n145), .A2(n150), .A3(n126), .B1(n122), .B2(n144), 
        .B3(n120), .Z(n140) );
  V5_IVD1A U114 ( .A(n149), .Z(n122) );
  V5_IVD1A U115 ( .A(n155), .Z(n117) );
  V5_IVD1A U116 ( .A(\inst_spi_slave/n16 ), .Z(n110) );
  V5_IVD1A U117 ( .A(n156), .Z(n116) );
  V5_OAI33D1A U118 ( .A1(n150), .A2(n126), .A3(n124), .B1(n134), .B2(n122), 
        .B3(n123), .Z(\inst_spi_master/clk_div [1]) );
  V5_IVD1A U119 ( .A(\inst_spi_master/sppr_add1 [1]), .Z(n123) );
  V5_ND2D1A U120 ( .A1(n153), .A2(n144), .Z(n134) );
  V5_IVD1A U121 ( .A(n143), .Z(n118) );
  V5_ND2D1A U122 ( .A1(\inst_spi_slave/n16 ), .A2(n112), .Z(
        \inst_spi_slave/n26 ) );
  V5_IVD1A U123 ( .A(n142), .Z(n119) );
  V5_IVD1A U124 ( .A(\inst_spi_slave/n13 ), .Z(n109) );
  V5_IVD1A U125 ( .A(\inst_spi_slave/n35 ), .Z(n127) );
  V5_AD3D1A U126 ( .A1(\inst_spi_slave/n38 ), .A2(n112), .A3(n127), .Z(
        \inst_spi_slave/n37 ) );
  V5_AD2D1A U127 ( .A1(n142), .A2(\inst_spi_master/sppr_add1 [3]), .Z(n137) );
  V5_IVD1A U128 ( .A(n150), .Z(n125) );
  V5_IVD1A U129 ( .A(n145), .Z(n124) );
  V5_IVD1A U130 ( .A(n159), .Z(n126) );
  V5_AD3D1A U131 ( .A1(\inst_spi_slave/n38 ), .A2(n112), .A3(
        \inst_spi_slave/n35 ), .Z(\inst_spi_slave/n36 ) );
  V5_NR3D1A U132 ( .A1(\inst_spi_master/n15 ), .A2(\inst_spi_master/N16 ), 
        .A3(\inst_spi_master/n52 ), .Z(\inst_spi_master/N41 ) );
  V5_ND2D1A U133 ( .A1(n43), .A2(n105), .Z(n12) );
  V5_ND2D1A U134 ( .A1(\inst_spi_slave/n17 ), .A2(\inst_spi_slave/n32 ), .Z(
        \inst_spi_slave/n29 ) );
  V5_IVD1A U135 ( .A(n5), .Z(n98) );
  V5_IVD1A U136 ( .A(n7), .Z(n100) );
  V5_NR2D1A U137 ( .A1(\inst_spi_master/n15 ), .A2(n131), .Z(
        \inst_spi_master/N152 ) );
  V5_IVD1A U138 ( .A(n1), .Z(n97) );
  V5_AD4D1A U139 ( .A1(n159), .A2(n150), .A3(n145), .A4(n81), .Z(
        \inst_spi_master/clk_div [0]) );
  V5_IVD1A U140 ( .A(n9), .Z(n101) );
  V5_ND2D1A U141 ( .A1(n131), .A2(\inst_spi_master/n47 ), .Z(
        \inst_spi_master/n18 ) );
  V5_ND3D1A U142 ( .A1(n83), .A2(n80), .A3(\inst_spi_master/n49 ), .Z(
        \inst_spi_master/n47 ) );
  V5_IVD1A U143 ( .A(\inst_spi_master/n52 ), .Z(n131) );
  V5_IVD1A U144 ( .A(\inst_spi_slave/n30 ), .Z(n132) );
  V5_OAI21D1A U145 ( .A1(\inst_spi_master/n64 ), .A2(\inst_spi_master/n65 ), 
        .B(spicr1[6]), .Z(\inst_spi_master/n15 ) );
  V5_ND4D1A U146 ( .A1(spssn_o[3]), .A2(spssn_o[2]), .A3(spssn_o[1]), .A4(
        spssn_o[0]), .Z(\inst_spi_master/n64 ) );
  V5_ND4D1A U147 ( .A1(spssn_o[7]), .A2(spssn_o[6]), .A3(spssn_o[5]), .A4(
        spssn_o[4]), .Z(\inst_spi_master/n65 ) );
  V5_CKXO2D0A U148 ( .A(\inst_spi_master/add_113/carry [4]), .B(
        \inst_spi_master/sck_edge_cnt [4]), .Z(\inst_spi_master/N34 ) );
  V5_ND2D1A U149 ( .A1(\inst_spi_master/n86 ), .A2(\inst_spi_master/n39 ), .Z(
        \inst_spi_master/n42 ) );
  V5_ND2D1A U150 ( .A1(n108), .A2(\inst_spi_master/n40 ), .Z(
        \inst_spi_master/n99 ) );
  V5_CKXO2D0A U151 ( .A(\inst_spi_master/n41 ), .B(\inst_spi_master/n84 ), .Z(
        \inst_spi_master/n40 ) );
  V5_NR2D1A U152 ( .A1(n129), .A2(\inst_spi_master/n42 ), .Z(
        \inst_spi_master/n41 ) );
  V5_ND2D1A U153 ( .A1(n108), .A2(\inst_spi_master/n43 ), .Z(
        \inst_spi_master/n100 ) );
  V5_XN2D0A U154 ( .A(\inst_spi_master/n85 ), .B(\inst_spi_master/n42 ), .Z(
        \inst_spi_master/n43 ) );
  V5_ND4D1A U155 ( .A1(\inst_spi_master/n54 ), .A2(\inst_spi_master/n55 ), 
        .A3(\inst_spi_master/n56 ), .A4(\inst_spi_master/n57 ), .Z(
        \inst_spi_master/N16 ) );
  V5_XN2D0A U156 ( .A(\inst_spi_master/clk_div [0]), .B(
        \inst_spi_master/clk_cnt [0]), .Z(\inst_spi_master/n54 ) );
  V5_XN2D0A U157 ( .A(\inst_spi_master/clk_div [1]), .B(
        \inst_spi_master/clk_cnt [1]), .Z(\inst_spi_master/n55 ) );
  V5_NR2D1A U158 ( .A1(\inst_spi_master/n62 ), .A2(\inst_spi_master/n63 ), .Z(
        \inst_spi_master/n56 ) );
  V5_XN2D0A U159 ( .A(n81), .B(spibr[5]), .Z(\inst_spi_master/sppr_add1 [1])
         );
  V5_ND2D1A U160 ( .A1(\inst_spi_master/sppr_add1 [1]), .A2(spibr[0]), .Z(n153) );
  V5_NR4D1A U161 ( .A1(\inst_spi_master/n58 ), .A2(\inst_spi_master/n59 ), 
        .A3(\inst_spi_master/n60 ), .A4(\inst_spi_master/n61 ), .Z(
        \inst_spi_master/n57 ) );
  V5_CKXO2D0A U162 ( .A(\inst_spi_master/clk_div [4]), .B(
        \inst_spi_master/clk_cnt [4]), .Z(\inst_spi_master/n61 ) );
  V5_CKXO2D0A U163 ( .A(\inst_spi_master/clk_div [5]), .B(
        \inst_spi_master/clk_cnt [5]), .Z(\inst_spi_master/n60 ) );
  V5_CKXO2D0A U164 ( .A(\inst_spi_master/clk_div [7]), .B(
        \inst_spi_master/clk_cnt [7]), .Z(\inst_spi_master/n58 ) );
  V5_CKXO2D0A U165 ( .A(\inst_spi_master/clk_div [6]), .B(
        \inst_spi_master/clk_cnt [6]), .Z(\inst_spi_master/n59 ) );
  V5_ND2D1A U166 ( .A1(n152), .A2(n151), .Z(\inst_spi_master/clk_div [6]) );
  V5_AOI33D1A U167 ( .A1(n119), .A2(n154), .A3(n118), .B1(n148), .B2(n156), 
        .B3(n117), .Z(n152) );
  V5_AOI33D1A U168 ( .A1(n124), .A2(n150), .A3(n126), .B1(n121), .B2(n149), 
        .B3(n120), .Z(n151) );
  V5_AD2D1A U169 ( .A1(\inst_spi_master/clk_cnt [6]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N171 ) );
  V5_AD2D1A U170 ( .A1(\inst_spi_master/clk_cnt [1]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N166 ) );
  V5_AD2D1A U171 ( .A1(\inst_spi_master/clk_cnt [2]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N167 ) );
  V5_AD2D1A U172 ( .A1(\inst_spi_master/clk_cnt [3]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N168 ) );
  V5_AD2D1A U173 ( .A1(\inst_spi_master/clk_cnt [4]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N169 ) );
  V5_AD2D1A U174 ( .A1(\inst_spi_master/clk_cnt [5]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N170 ) );
  V5_AD2D1A U175 ( .A1(\inst_spi_master/clk_cnt [0]), .A2(
        \inst_spi_master/N16 ), .Z(\inst_spi_master/dp_cluster_0/N165 ) );
  V5_XN2D0A U176 ( .A(\inst_spi_master/dp_cluster_0/add_88_aco/carry [7]), .B(
        n93), .Z(\inst_spi_master/N25 ) );
  V5_ND2D1A U177 ( .A1(\inst_spi_master/N16 ), .A2(
        \inst_spi_master/clk_cnt [7]), .Z(n93) );
  V5_ND2D1A U178 ( .A1(\inst_spi_master/sppr_add1 [1]), .A2(spibr[2]), .Z(n144) );
  V5_ND2D1A U179 ( .A1(\inst_spi_master/sppr_add1 [2]), .A2(spibr[1]), .Z(n148) );
  V5_XN2D0A U180 ( .A(spibr[6]), .B(\inst_spi_master/n9 ), .Z(
        \inst_spi_master/sppr_add1 [2]) );
  V5_ND2D1A U181 ( .A1(spibr[5]), .A2(spibr[4]), .Z(\inst_spi_master/n9 ) );
  V5_ND3D1A U182 ( .A1(n108), .A2(\inst_spi_master/sck_edge_level ), .A3(
        \inst_spi_master/n22 ), .Z(\inst_spi_master/n20 ) );
  V5_OAI22D1A U183 ( .A1(\inst_spi_master/n67 ), .A2(n107), .B1(
        \inst_spi_master/n66 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n96 ) );
  V5_OAI22D1A U184 ( .A1(\inst_spi_master/n68 ), .A2(n107), .B1(
        \inst_spi_master/n67 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n95 ) );
  V5_OAI22D1A U185 ( .A1(\inst_spi_master/n69 ), .A2(n107), .B1(
        \inst_spi_master/n68 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n94 ) );
  V5_OAI22D1A U186 ( .A1(\inst_spi_master/n70 ), .A2(n107), .B1(
        \inst_spi_master/n69 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n93 ) );
  V5_OAI22D1A U187 ( .A1(\inst_spi_master/n71 ), .A2(n107), .B1(
        \inst_spi_master/n70 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n92 ) );
  V5_OAI22D1A U188 ( .A1(\inst_spi_master/n73 ), .A2(n107), .B1(
        \inst_spi_master/n71 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n91 ) );
  V5_OAI22D1A U189 ( .A1(\inst_spi_master/n72 ), .A2(n107), .B1(
        \inst_spi_master/n73 ), .B2(\inst_spi_master/n20 ), .Z(
        \inst_spi_master/n90 ) );
  V5_ND2D1A U190 ( .A1(\inst_spi_master/sppr_add1 [2]), .A2(spibr[2]), .Z(n155) );
  V5_OAI22D1A U191 ( .A1(n107), .A2(\inst_spi_master/n66 ), .B1(n128), .B2(
        \inst_spi_master/n20 ), .Z(\inst_spi_master/n97 ) );
  V5_IVD1A U192 ( .A(miso_m), .Z(n128) );
  V5_ND2D1A U193 ( .A1(\inst_spi_master/sppr_add1 [1]), .A2(spibr[1]), .Z(n149) );
  V5_ND2D1A U194 ( .A1(\inst_spi_master/sppr_add1 [2]), .A2(spibr[0]), .Z(n156) );
  V5_CKXO2D0A U195 ( .A(\inst_spi_master/clk_div [2]), .B(
        \inst_spi_master/clk_cnt [2]), .Z(\inst_spi_master/n63 ) );
  V5_ND2D1A U196 ( .A1(n136), .A2(n135), .Z(\inst_spi_master/clk_div [2]) );
  V5_ND4D1A U197 ( .A1(\inst_spi_master/sppr_add1 [2]), .A2(n148), .A3(n156), 
        .A4(n155), .Z(n135) );
  V5_AOI33D1A U198 ( .A1(n150), .A2(n159), .A3(n124), .B1(n149), .B2(n144), 
        .B3(n120), .Z(n136) );
  V5_OAI222D1A U199 ( .A1(\inst_spi_master/n15 ), .A2(\inst_spi_master/n42 ), 
        .B1(\inst_spi_master/n86 ), .B2(\inst_spi_master/n39 ), .C1(n108), 
        .C2(n84), .Z(\inst_spi_master/n101 ) );
  V5_ND2D1A U200 ( .A1(\inst_spi_slave/n17 ), .A2(\inst_spi_slave/n34 ), .Z(
        \inst_spi_slave/n16 ) );
  V5_XN2D0A U201 ( .A(\inst_spi_slave/sck_dly1 ), .B(sck_s), .Z(
        \inst_spi_slave/n35 ) );
  V5_OAI211D1A U202 ( .A1(\inst_spi_slave/n30 ), .A2(\inst_spi_slave/n26 ), 
        .B(\inst_spi_slave/n21 ), .C(\inst_spi_slave/n31 ), .Z(
        \inst_spi_slave/n50 ) );
  V5_AOI21D1A U203 ( .A1(n110), .A2(\inst_spi_slave/bit_count [1]), .B(
        \inst_spi_slave/n29 ), .Z(\inst_spi_slave/n31 ) );
  V5_OAI211D1A U204 ( .A1(\inst_spi_slave/n26 ), .A2(\inst_spi_slave/n27 ), 
        .B(\inst_spi_slave/n28 ), .C(n111), .Z(\inst_spi_slave/n49 ) );
  V5_ND2D1A U205 ( .A1(n132), .A2(\inst_spi_slave/n5 ), .Z(
        \inst_spi_slave/n27 ) );
  V5_IVD1A U206 ( .A(\inst_spi_slave/n29 ), .Z(n111) );
  V5_OAI21D1A U207 ( .A1(n110), .A2(\inst_spi_slave/n30 ), .B(
        \inst_spi_slave/bit_count [2]), .Z(\inst_spi_slave/n28 ) );
  V5_CKXO2D0A U208 ( .A(\inst_spi_master/clk_div [3]), .B(
        \inst_spi_master/clk_cnt [3]), .Z(\inst_spi_master/n62 ) );
  V5_OAI211D1A U209 ( .A1(n126), .A2(n160), .B(n139), .C(n138), .Z(
        \inst_spi_master/clk_div [3]) );
  V5_AOI33D1A U210 ( .A1(n148), .A2(n155), .A3(n116), .B1(n143), .B2(n154), 
        .B3(n137), .Z(n138) );
  V5_ND3D1A U211 ( .A1(n153), .A2(n144), .A3(n122), .Z(n139) );
  V5_OAI22D1A U212 ( .A1(spicr1[1]), .A2(n108), .B1(\inst_spi_master/n15 ), 
        .B2(\inst_spi_master/n38 ), .Z(\inst_spi_master/n25 ) );
  V5_OAI22D1A U213 ( .A1(n108), .A2(n85), .B1(\inst_spi_master/n28 ), .B2(
        \inst_spi_master/n15 ), .Z(\inst_spi_master/n26 ) );
  V5_OAI21D1A U214 ( .A1(n108), .A2(n84), .B(\inst_spi_master/n39 ), .Z(
        \inst_spi_master/n24 ) );
  V5_OAI211D1A U215 ( .A1(\inst_spi_slave/bit_count [0]), .A2(
        \inst_spi_slave/n26 ), .B(\inst_spi_slave/n32 ), .C(
        \inst_spi_slave/n33 ), .Z(\inst_spi_slave/n51 ) );
  V5_ND2D1A U216 ( .A1(n110), .A2(\inst_spi_slave/bit_count [0]), .Z(
        \inst_spi_slave/n33 ) );
  V5_ND2D1A U217 ( .A1(\inst_spi_master/sppr_add1 [3]), .A2(spibr[0]), .Z(n143) );
  V5_AD3D1A U218 ( .A1(spibr[6]), .A2(spibr[4]), .A3(spibr[5]), .Z(
        \inst_spi_master/sppr_add1 [3]) );
  V5_OAI22D1A U219 ( .A1(\inst_spi_master/n10 ), .A2(n86), .B1(n106), .B2(
        \inst_spi_master/n13 ), .Z(\inst_spi_master/n89 ) );
  V5_AOI22D1A U220 ( .A1(n108), .A2(n86), .B1(spicr1[2]), .B2(
        \inst_spi_master/n15 ), .Z(\inst_spi_master/n13 ) );
  V5_IVD1A U221 ( .A(\inst_spi_master/n10 ), .Z(n106) );
  V5_ND2D1A U222 ( .A1(n108), .A2(\inst_spi_master/n16 ), .Z(
        \inst_spi_master/n10 ) );
  V5_ND2D1A U223 ( .A1(\inst_spi_master/sppr_add1 [3]), .A2(spibr[2]), .Z(n154) );
  V5_ND2D1A U224 ( .A1(\inst_spi_master/sppr_add1 [3]), .A2(spibr[1]), .Z(n142) );
  V5_ND4D1A U225 ( .A1(\inst_spi_slave/n14 ), .A2(n127), .A3(
        \inst_spi_slave/n4 ), .A4(n112), .Z(\inst_spi_slave/n13 ) );
  V5_OAI22D1A U226 ( .A1(n85), .A2(\inst_spi_slave/n17 ), .B1(ssn), .B2(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n15 ) );
  V5_AOI22D1A U227 ( .A1(\inst_spi_slave/n19 ), .A2(\inst_spi_slave/n5 ), .B1(
        \inst_spi_slave/bit_count [2]), .B2(\inst_spi_slave/n20 ), .Z(
        \inst_spi_slave/n18 ) );
  V5_ND2D1A U228 ( .A1(\inst_spi_slave/n24 ), .A2(\inst_spi_slave/n25 ), .Z(
        \inst_spi_slave/n19 ) );
  V5_IVD1A U229 ( .A(\inst_spi_master/dp_cluster_0/N165 ), .Z(n113) );
  V5_CKXO2D0A U230 ( .A(\inst_spi_slave/add_80/carry [4]), .B(
        \inst_spi_slave/sck_edge_cnt [4]), .Z(\inst_spi_slave/N23 ) );
  V5_ND2D1A U231 ( .A1(spibr[0]), .A2(n81), .Z(n150) );
  V5_IVD1A U232 ( .A(ssn), .Z(n112) );
  V5_ND2D1A U233 ( .A1(spibr[1]), .A2(n81), .Z(n145) );
  V5_NR3D1A U234 ( .A1(sfraddr_r[1]), .A2(sfraddr_r[2]), .A3(n105), .Z(n16) );
  V5_AD3D1A U235 ( .A1(sfraddr_r[0]), .A2(n82), .A3(n43), .Z(n19) );
  V5_OAI211D1A U236 ( .A1(n90), .A2(n12), .B(n35), .C(n36), .Z(N74) );
  V5_AOI22D1A U237 ( .A1(spidr2_m[2]), .A2(n18), .B1(spidr2_s[2]), .B2(n19), 
        .Z(n35) );
  V5_AOI222D1A U238 ( .A1(n15), .A2(spicr1[2]), .B1(n16), .B2(spicr2[2]), .C1(
        n17), .C2(spibr[2]), .Z(n36) );
  V5_OAI211D1A U239 ( .A1(n88), .A2(n12), .B(n32), .C(n33), .Z(N75) );
  V5_AOI22D1A U240 ( .A1(spidr2_m[3]), .A2(n18), .B1(spidr2_s[3]), .B2(n19), 
        .Z(n32) );
  V5_AOI222D1A U241 ( .A1(n15), .A2(spicr1[3]), .B1(n16), .B2(spicr2[3]), .C1(
        n17), .C2(spibr[3]), .Z(n33) );
  V5_OAI211D1A U242 ( .A1(n89), .A2(n12), .B(n24), .C(n25), .Z(N77) );
  V5_AOI22D1A U243 ( .A1(spidr2_m[5]), .A2(n18), .B1(spidr2_s[5]), .B2(n19), 
        .Z(n24) );
  V5_AOI222D1A U244 ( .A1(n15), .A2(spicr1[5]), .B1(n16), .B2(spicr2[5]), .C1(
        n17), .C2(spibr[5]), .Z(n25) );
  V5_OAI211D1A U245 ( .A1(n91), .A2(n12), .B(n21), .C(n22), .Z(N78) );
  V5_AOI22D1A U246 ( .A1(spidr2_m[6]), .A2(n18), .B1(spidr2_s[6]), .B2(n19), 
        .Z(n21) );
  V5_AOI222D1A U247 ( .A1(n15), .A2(spicr1[6]), .B1(n16), .B2(spicr2[6]), .C1(
        n17), .C2(spibr[6]), .Z(n22) );
  V5_OAI211D1A U248 ( .A1(n85), .A2(n12), .B(n13), .C(n14), .Z(N79) );
  V5_AOI22D1A U249 ( .A1(spidr2_m[7]), .A2(n18), .B1(spidr2_s[7]), .B2(n19), 
        .Z(n13) );
  V5_AOI222D1A U250 ( .A1(n15), .A2(spicr1[7]), .B1(n16), .B2(spicr2[7]), .C1(
        n17), .C2(spibr[7]), .Z(n14) );
  V5_NR2D1A U251 ( .A1(n104), .A2(sfraddr_r[1]), .Z(n43) );
  V5_ND3D1A U252 ( .A1(n40), .A2(n41), .A3(n42), .Z(N72) );
  V5_AOI22D1A U253 ( .A1(n17), .A2(spibr[0]), .B1(n15), .B2(spicr1[0]), .Z(n40) );
  V5_AOI22D1A U254 ( .A1(spisr[0]), .A2(n30), .B1(n16), .B2(spicr2[0]), .Z(n41) );
  V5_AOI222D1A U255 ( .A1(n103), .A2(spidr1[0]), .B1(spidr2_m[0]), .B2(n18), 
        .C1(spidr2_s[0]), .C2(n19), .Z(n42) );
  V5_ND3D1A U256 ( .A1(n37), .A2(n38), .A3(n39), .Z(N73) );
  V5_AOI22D1A U257 ( .A1(n17), .A2(spibr[1]), .B1(n15), .B2(spicr1[1]), .Z(n37) );
  V5_AOI22D1A U258 ( .A1(spisr[1]), .A2(n30), .B1(n16), .B2(spicr2[1]), .Z(n38) );
  V5_AOI222D1A U259 ( .A1(n103), .A2(spidr1[1]), .B1(spidr2_m[1]), .B2(n18), 
        .C1(spidr2_s[1]), .C2(n19), .Z(n39) );
  V5_ND3D1A U260 ( .A1(n26), .A2(n27), .A3(n28), .Z(N76) );
  V5_AOI22D1A U261 ( .A1(n17), .A2(spibr[4]), .B1(n15), .B2(spicr1[4]), .Z(n26) );
  V5_AOI22D1A U262 ( .A1(spisr[4]), .A2(n30), .B1(n16), .B2(spicr2[4]), .Z(n27) );
  V5_AOI222D1A U263 ( .A1(n103), .A2(spidr1[4]), .B1(spidr2_m[4]), .B2(n18), 
        .C1(spidr2_s[4]), .C2(n19), .Z(n28) );
  V5_IVD1A U264 ( .A(sfraddr_r[0]), .Z(n105) );
  V5_IVD1A U265 ( .A(sfraddr_r[2]), .Z(n104) );
  V5_ND2D1A U266 ( .A1(spibr[2]), .A2(n81), .Z(n159) );
  V5_AD3D1A U267 ( .A1(sfraddr_r[0]), .A2(spicr1[4]), .A3(n43), .Z(n18) );
  V5_NR3D1A U268 ( .A1(sfraddr_r[1]), .A2(sfraddr_r[2]), .A3(sfraddr_r[0]), 
        .Z(n15) );
  V5_AD3D1A U269 ( .A1(n105), .A2(n104), .A3(sfraddr_r[1]), .Z(n17) );
  V5_IVD1A U270 ( .A(sfraddr_w[1]), .Z(n99) );
  V5_IVD1A U271 ( .A(sfraddr_w[0]), .Z(n102) );
  V5_ND3D1A U272 ( .A1(sfrwe), .A2(n99), .A3(sfraddr_w[0]), .Z(n5) );
  V5_ND3D1A U273 ( .A1(sfrwe), .A2(n102), .A3(sfraddr_w[1]), .Z(n7) );
  V5_ND3D1A U274 ( .A1(n102), .A2(n99), .A3(sfrwe), .Z(n1) );
  V5_AD3D1A U275 ( .A1(sfraddr_r[0]), .A2(n104), .A3(sfraddr_r[1]), .Z(n30) );
  V5_ND3D1A U276 ( .A1(sfraddr_w[0]), .A2(sfrwe), .A3(sfraddr_w[1]), .Z(n9) );
  V5_ND2D1A U277 ( .A1(ssn), .A2(spicr1[1]), .Z(\inst_spi_slave/n32 ) );
  V5_NR2D1A U278 ( .A1(ssn), .A2(\inst_spi_slave/n38 ), .Z(
        \inst_spi_slave/N123 ) );
  V5_NR3D1A U279 ( .A1(\inst_spi_master/n49 ), .A2(
        \inst_spi_master/sck_edge_cnt [0]), .A3(n80), .Z(\inst_spi_master/n52 ) );
  V5_OAI211D1A U280 ( .A1(spicr1[1]), .A2(\inst_spi_master/n18 ), .B(
        \inst_spi_master/n44 ), .C(\inst_spi_master/sck_edge_level ), .Z(
        \inst_spi_master/n38 ) );
  V5_NR2D1A U281 ( .A1(n83), .A2(\inst_spi_master/sck_edge_cnt [4]), .Z(
        \inst_spi_master/n17 ) );
  V5_XN2D0A U282 ( .A(spicr1[1]), .B(\inst_spi_slave/sck_edge_cnt [0]), .Z(
        \inst_spi_slave/n14 ) );
  V5_OAI21D1A U283 ( .A1(\inst_spi_master/n17 ), .A2(\inst_spi_master/n18 ), 
        .B(\inst_spi_master/sck_edge_level ), .Z(\inst_spi_master/n16 ) );
  V5_ND2D1A U284 ( .A1(\inst_spi_slave/n9 ), .A2(\inst_spi_slave/n8 ), .Z(
        \inst_spi_slave/n30 ) );
  V5_OAI211D1A U285 ( .A1(\inst_spi_slave/n21 ), .A2(n85), .B(
        \inst_spi_slave/n22 ), .C(\inst_spi_slave/n23 ), .Z(
        \inst_spi_slave/n20 ) );
  V5_AOI33D1A U286 ( .A1(\inst_spi_slave/bit_count [1]), .A2(
        \inst_spi_slave/n9 ), .A3(spidr1[6]), .B1(
        \inst_spi_slave/bit_count [0]), .B2(\inst_spi_slave/n8 ), .B3(
        spidr1[5]), .Z(\inst_spi_slave/n23 ) );
  V5_ND2D1A U287 ( .A1(spidr1[4]), .A2(n132), .Z(\inst_spi_slave/n22 ) );
  V5_OAI22D1A U288 ( .A1(\inst_spi_master/n86 ), .A2(spidr1[1]), .B1(spidr1[0]), .B2(n130), .Z(\inst_spi_master/n34 ) );
  V5_AOI22D1A U289 ( .A1(\inst_spi_master/n29 ), .A2(\inst_spi_master/n30 ), 
        .B1(\inst_spi_master/n31 ), .B2(\inst_spi_master/n84 ), .Z(
        \inst_spi_master/n28 ) );
  V5_ND2D1A U290 ( .A1(\inst_spi_master/n85 ), .A2(\inst_spi_master/n36 ), .Z(
        \inst_spi_master/n30 ) );
  V5_AOI21D1A U291 ( .A1(\inst_spi_master/n37 ), .A2(n129), .B(
        \inst_spi_master/n84 ), .Z(\inst_spi_master/n29 ) );
  V5_AOI22D1A U292 ( .A1(\inst_spi_master/n32 ), .A2(n129), .B1(
        \inst_spi_master/n85 ), .B2(\inst_spi_master/n34 ), .Z(
        \inst_spi_master/n31 ) );
  V5_AOI22D1A U293 ( .A1(spidr1[3]), .A2(n133), .B1(spidr1[0]), .B2(n132), .Z(
        \inst_spi_slave/n24 ) );
  V5_IVD1A U294 ( .A(\inst_spi_slave/n21 ), .Z(n133) );
  V5_OAI22D1A U295 ( .A1(\inst_spi_master/n86 ), .A2(spidr1[3]), .B1(spidr1[2]), .B2(n130), .Z(\inst_spi_master/n32 ) );
  V5_OAI22D1A U296 ( .A1(\inst_spi_master/n86 ), .A2(spidr1[7]), .B1(spidr1[6]), .B2(n130), .Z(\inst_spi_master/n37 ) );
  V5_OAI22D1A U297 ( .A1(\inst_spi_master/n86 ), .A2(spidr1[5]), .B1(spidr1[4]), .B2(n130), .Z(\inst_spi_master/n36 ) );
  V5_AOI33D1A U298 ( .A1(\inst_spi_slave/bit_count [1]), .A2(
        \inst_spi_slave/n9 ), .A3(spidr1[2]), .B1(
        \inst_spi_slave/bit_count [0]), .B2(\inst_spi_slave/n8 ), .B3(
        spidr1[1]), .Z(\inst_spi_slave/n25 ) );
  V5_ND2D1A U299 ( .A1(\inst_spi_slave/bit_count [0]), .A2(
        \inst_spi_slave/bit_count [1]), .Z(\inst_spi_slave/n21 ) );
  V5_NR2D1A U300 ( .A1(\inst_spi_master/tr_done_dly1 ), .A2(
        \inst_spi_master/n87 ), .Z(data_finish_m) );
  V5_ND2D1A U301 ( .A1(spicr1[2]), .A2(n92), .Z(\inst_spi_master/n75 ) );
  V5_FD2D1A rst_n_sync_reg ( .D(rst_n_sync_pre), .CK(clk), .RN(rst_n), .Q(
        rst_n_sync), .QN(n92) );
endmodule
