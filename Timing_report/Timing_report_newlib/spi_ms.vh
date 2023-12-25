/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Dec 21 17:06:14 2023
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
  wire   \*Logic1* , sck_m, mosi_m, miso_s, rst_n_sync, rst_n_sync_pre,
         data_finish_m, data_finish_s, N72, N73, N74, N75, N76, N77, N78, N79,
         n1, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n48, n49, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, \inst_spi_master/n65 , \inst_spi_master/n64 ,
         \inst_spi_master/n63 , \inst_spi_master/n62 , \inst_spi_master/n61 ,
         \inst_spi_master/n60 , \inst_spi_master/n59 , \inst_spi_master/n58 ,
         \inst_spi_master/n57 , \inst_spi_master/n56 , \inst_spi_master/n55 ,
         \inst_spi_master/n54 , \inst_spi_master/n53 , \inst_spi_master/n52 ,
         \inst_spi_master/n51 , \inst_spi_master/n50 , \inst_spi_master/n49 ,
         \inst_spi_master/n48 , \inst_spi_master/n47 , \inst_spi_master/n46 ,
         \inst_spi_master/n45 , \inst_spi_master/n44 , \inst_spi_master/n43 ,
         \inst_spi_master/n42 , \inst_spi_master/n40 , \inst_spi_master/n38 ,
         \inst_spi_master/n37 , \inst_spi_master/n36 , \inst_spi_master/n35 ,
         \inst_spi_master/n34 , \inst_spi_master/n33 , \inst_spi_master/n32 ,
         \inst_spi_master/n31 , \inst_spi_master/n30 , \inst_spi_master/n26 ,
         \inst_spi_master/n25 , \inst_spi_master/n24 , \inst_spi_master/n23 ,
         \inst_spi_master/n22 , \inst_spi_master/n21 , \inst_spi_master/n19 ,
         \inst_spi_master/n18 , \inst_spi_master/n17 , \inst_spi_master/n16 ,
         \inst_spi_master/n15 , \inst_spi_master/n14 , \inst_spi_master/n12 ,
         \inst_spi_master/n10 , \inst_spi_master/n9 , \inst_spi_master/n8 ,
         \inst_spi_master/n5 , \inst_spi_master/n4 , \inst_spi_master/n3 ,
         \inst_spi_master/n2 , \inst_spi_master/n1 , \inst_spi_master/N152 ,
         \inst_spi_master/tr_done , \inst_spi_master/tr_done_dly1 ,
         \inst_spi_master/N49 , \inst_spi_master/N41 , \inst_spi_master/N34 ,
         \inst_spi_master/N33 , \inst_spi_master/N32 , \inst_spi_master/N31 ,
         \inst_spi_master/sck_edge_level , \inst_spi_master/N25 ,
         \inst_spi_master/N24 , \inst_spi_master/N23 , \inst_spi_master/N22 ,
         \inst_spi_master/N21 , \inst_spi_master/N20 , \inst_spi_master/N19 ,
         \inst_spi_master/N18 , \inst_spi_master/N15 , \inst_spi_slave/n48 ,
         \inst_spi_slave/n47 , \inst_spi_slave/n46 , \inst_spi_slave/n45 ,
         \inst_spi_slave/n44 , \inst_spi_slave/n43 , \inst_spi_slave/n42 ,
         \inst_spi_slave/n41 , \inst_spi_slave/n40 , \inst_spi_slave/n39 ,
         \inst_spi_slave/n38 , \inst_spi_slave/n37 , \inst_spi_slave/n36 ,
         \inst_spi_slave/n35 , \inst_spi_slave/n34 , \inst_spi_slave/n33 ,
         \inst_spi_slave/n32 , \inst_spi_slave/n31 , \inst_spi_slave/n30 ,
         \inst_spi_slave/n29 , \inst_spi_slave/n28 , \inst_spi_slave/n27 ,
         \inst_spi_slave/n26 , \inst_spi_slave/n25 , \inst_spi_slave/n24 ,
         \inst_spi_slave/n23 , \inst_spi_slave/n22 , \inst_spi_slave/n21 ,
         \inst_spi_slave/n20 , \inst_spi_slave/n19 , \inst_spi_slave/n18 ,
         \inst_spi_slave/n17 , \inst_spi_slave/n16 , \inst_spi_slave/n15 ,
         \inst_spi_slave/n14 , \inst_spi_slave/n13 , \inst_spi_slave/n12 ,
         \inst_spi_slave/n11 , \inst_spi_slave/n10 , \inst_spi_slave/n9 ,
         \inst_spi_slave/n8 , \inst_spi_slave/n7 , \inst_spi_slave/N123 ,
         \inst_spi_slave/N35 , \inst_spi_slave/N23 , \inst_spi_slave/N22 ,
         \inst_spi_slave/N21 , \inst_spi_slave/N20 , \inst_spi_slave/sck_dly1 ,
         \inst_spi_master/add_65_DP_OP_289_508_1/n175 ,
         \inst_spi_master/add_65_DP_OP_289_508_1/n174 ,
         \inst_spi_master/add_65_DP_OP_289_508_1/n173 ,
         \inst_spi_master/add_65_DP_OP_289_508_1/n158 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n14 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n13 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n12 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n11 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n10 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n9 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n6 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n5 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n4 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n3 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n2 ,
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 , n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165;
  wire   [7:0] spicr1;
  wire   [7:0] spidr1;
  wire   [7:0] spibr;
  wire   [7:0] spidr2_m;
  wire   [7:0] spidr2_s;
  wire   [7:0] spisr;
  wire   [7:0] spicr2;
  wire   [2:0] \inst_spi_master/bit_count ;
  wire   [4:0] \inst_spi_master/sck_edge_cnt ;
  wire   [7:0] \inst_spi_master/clk_cnt ;
  wire   [2:0] \inst_spi_slave/bit_count ;
  wire   [4:0] \inst_spi_slave/sck_edge_cnt ;
  wire   [4:2] \inst_spi_slave/add_80/carry ;
  wire   [4:2] \inst_spi_master/add_113/carry ;
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

  DRNQV1_7TV50 rst_n_sync_pre_reg ( .D(\*Logic1* ), .CK(clk), .RDN(rst_n), .Q(
        rst_n_sync_pre) );
  DRNQV1_7TV50 rst_n_sync_reg ( .D(rst_n_sync_pre), .CK(clk), .RDN(rst_n), .Q(
        rst_n_sync) );
  DRNQV1_7TV50 \spisr_reg[4]  ( .D(n97), .CK(clk), .RDN(n84), .Q(spisr[4]) );
  DRNQV1_7TV50 \spidr1_reg[7]  ( .D(n83), .CK(clk), .RDN(n84), .Q(spidr1[7])
         );
  DRNQV1_7TV50 \spidr1_reg[6]  ( .D(n82), .CK(clk), .RDN(n84), .Q(spidr1[6])
         );
  DRNQV1_7TV50 \spidr1_reg[5]  ( .D(n81), .CK(clk), .RDN(n84), .Q(spidr1[5])
         );
  DRNQV1_7TV50 \spidr1_reg[4]  ( .D(n80), .CK(clk), .RDN(n84), .Q(spidr1[4])
         );
  DRNQV1_7TV50 \spidr1_reg[3]  ( .D(n79), .CK(clk), .RDN(n84), .Q(spidr1[3])
         );
  DRNQV1_7TV50 \spidr1_reg[2]  ( .D(n78), .CK(clk), .RDN(n84), .Q(spidr1[2])
         );
  DRNQV1_7TV50 \spidr1_reg[1]  ( .D(n77), .CK(clk), .RDN(n84), .Q(spidr1[1])
         );
  DRNQV1_7TV50 \spidr1_reg[0]  ( .D(n76), .CK(clk), .RDN(n84), .Q(spidr1[0])
         );
  DRNQV1_7TV50 \spibr_reg[7]  ( .D(n75), .CK(clk), .RDN(n84), .Q(spibr[7]) );
  DRNQV1_7TV50 \spibr_reg[6]  ( .D(n74), .CK(clk), .RDN(n84), .Q(spibr[6]) );
  DRNQV1_7TV50 \spibr_reg[5]  ( .D(n73), .CK(clk), .RDN(n84), .Q(spibr[5]) );
  DRNQV1_7TV50 \spibr_reg[4]  ( .D(n72), .CK(clk), .RDN(n84), .Q(spibr[4]) );
  DRNQV1_7TV50 \spibr_reg[3]  ( .D(n71), .CK(clk), .RDN(n84), .Q(spibr[3]) );
  DRNQV1_7TV50 \spibr_reg[2]  ( .D(n70), .CK(clk), .RDN(n84), .Q(spibr[2]) );
  DRNQV1_7TV50 \spicr2_reg[7]  ( .D(n67), .CK(clk), .RDN(n84), .Q(spicr2[7])
         );
  DRNQV1_7TV50 \spicr2_reg[6]  ( .D(n66), .CK(clk), .RDN(n84), .Q(spicr2[6])
         );
  DRNQV1_7TV50 \spicr2_reg[5]  ( .D(n65), .CK(clk), .RDN(n84), .Q(spicr2[5])
         );
  DRNQV1_7TV50 \spicr2_reg[4]  ( .D(n64), .CK(clk), .RDN(n84), .Q(spicr2[4])
         );
  DRNQV1_7TV50 \spicr2_reg[3]  ( .D(n63), .CK(clk), .RDN(n84), .Q(spicr2[3])
         );
  DRNQV1_7TV50 \spicr2_reg[2]  ( .D(n62), .CK(clk), .RDN(n84), .Q(spicr2[2])
         );
  DRNQV1_7TV50 \spicr2_reg[1]  ( .D(n61), .CK(clk), .RDN(n84), .Q(spicr2[1])
         );
  DRNQV1_7TV50 \spicr2_reg[0]  ( .D(n60), .CK(clk), .RDN(n84), .Q(spicr2[0])
         );
  DRNQV1_7TV50 \spicr1_reg[7]  ( .D(n59), .CK(clk), .RDN(n84), .Q(spicr1[7])
         );
  DRNQV1_7TV50 \spicr1_reg[6]  ( .D(n58), .CK(clk), .RDN(n84), .Q(spicr1[6])
         );
  DRNQV1_7TV50 \spicr1_reg[5]  ( .D(n57), .CK(clk), .RDN(n84), .Q(spicr1[5])
         );
  DRNQV1_7TV50 \spicr1_reg[4]  ( .D(n56), .CK(clk), .RDN(n84), .Q(spicr1[4])
         );
  DRNQV1_7TV50 \spicr1_reg[3]  ( .D(n55), .CK(clk), .RDN(n84), .Q(spicr1[3])
         );
  DRNQV1_7TV50 \spicr1_reg[2]  ( .D(n54), .CK(clk), .RDN(n84), .Q(spicr1[2])
         );
  DRNQV1_7TV50 \spicr1_reg[1]  ( .D(n53), .CK(clk), .RDN(n84), .Q(spicr1[1])
         );
  DRNQV1_7TV50 \spicr1_reg[0]  ( .D(n52), .CK(clk), .RDN(n84), .Q(spicr1[0])
         );
  DRNQV1_7TV50 \spisr_reg[1]  ( .D(data_finish_s), .CK(clk), .RDN(n84), .Q(
        spisr[1]) );
  DRNQV1_7TV50 \spisr_reg[0]  ( .D(data_finish_m), .CK(clk), .RDN(n84), .Q(
        spisr[0]) );
  DRNQV1_7TV50 \sfr_data_o_reg[7]  ( .D(N79), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[7]) );
  DRNQV1_7TV50 \sfr_data_o_reg[6]  ( .D(N78), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[6]) );
  DRNQV1_7TV50 \sfr_data_o_reg[5]  ( .D(N77), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[5]) );
  DRNQV1_7TV50 \sfr_data_o_reg[4]  ( .D(N76), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[4]) );
  DRNQV1_7TV50 \sfr_data_o_reg[3]  ( .D(N75), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[3]) );
  DRNQV1_7TV50 \sfr_data_o_reg[2]  ( .D(N74), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[2]) );
  DRNQV1_7TV50 \sfr_data_o_reg[1]  ( .D(N73), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[1]) );
  DRNQV1_7TV50 \sfr_data_o_reg[0]  ( .D(N72), .CK(clk), .RDN(n84), .Q(
        sfr_data_o[0]) );
  AOI22BBV1_7TV50 U5 ( .B1(n1), .B2(n92), .A1(spicr1[0]), .A2(n1), .ZN(n52) );
  AOI22BBV1_7TV50 U6 ( .B1(n1), .B2(n91), .A1(spicr1[1]), .A2(n1), .ZN(n53) );
  AOI22BBV1_7TV50 U7 ( .B1(n1), .B2(n90), .A1(spicr1[2]), .A2(n1), .ZN(n54) );
  AOI22BBV1_7TV50 U8 ( .B1(n1), .B2(n89), .A1(spicr1[3]), .A2(n1), .ZN(n55) );
  AOI22BBV1_7TV50 U9 ( .B1(n1), .B2(n88), .A1(spicr1[4]), .A2(n1), .ZN(n56) );
  AOI22BBV1_7TV50 U10 ( .B1(n1), .B2(n87), .A1(n1), .A2(spicr1[5]), .ZN(n57)
         );
  AOI22BBV1_7TV50 U11 ( .B1(n1), .B2(n86), .A1(n1), .A2(spicr1[6]), .ZN(n58)
         );
  AOI22BBV1_7TV50 U12 ( .B1(n1), .B2(n85), .A1(n1), .A2(spicr1[7]), .ZN(n59)
         );
  AOI22BBV1_7TV50 U14 ( .B1(n10), .B2(n92), .A1(n10), .A2(spicr2[0]), .ZN(n60)
         );
  AOI22BBV1_7TV50 U15 ( .B1(n10), .B2(n91), .A1(n10), .A2(spicr2[1]), .ZN(n61)
         );
  AOI22BBV1_7TV50 U16 ( .B1(n10), .B2(n90), .A1(n10), .A2(spicr2[2]), .ZN(n62)
         );
  AOI22BBV1_7TV50 U17 ( .B1(n10), .B2(n89), .A1(n10), .A2(spicr2[3]), .ZN(n63)
         );
  AOI22BBV1_7TV50 U18 ( .B1(n10), .B2(n88), .A1(n10), .A2(spicr2[4]), .ZN(n64)
         );
  AOI22BBV1_7TV50 U19 ( .B1(n10), .B2(n87), .A1(n10), .A2(spicr2[5]), .ZN(n65)
         );
  AOI22BBV1_7TV50 U20 ( .B1(n10), .B2(n86), .A1(n10), .A2(spicr2[6]), .ZN(n66)
         );
  AOI22BBV1_7TV50 U21 ( .B1(n10), .B2(n85), .A1(n10), .A2(spicr2[7]), .ZN(n67)
         );
  AOI22BBV1_7TV50 U23 ( .B1(n12), .B2(n92), .A1(n12), .A2(spibr[0]), .ZN(n68)
         );
  AOI22BBV1_7TV50 U24 ( .B1(n12), .B2(n91), .A1(n12), .A2(spibr[1]), .ZN(n69)
         );
  AOI22BBV1_7TV50 U25 ( .B1(n12), .B2(n90), .A1(n12), .A2(spibr[2]), .ZN(n70)
         );
  AOI22BBV1_7TV50 U26 ( .B1(n12), .B2(n89), .A1(n12), .A2(spibr[3]), .ZN(n71)
         );
  AOI22BBV1_7TV50 U27 ( .B1(n12), .B2(n88), .A1(n12), .A2(spibr[4]), .ZN(n72)
         );
  AOI22BBV1_7TV50 U28 ( .B1(n12), .B2(n87), .A1(n12), .A2(spibr[5]), .ZN(n73)
         );
  AOI22BBV1_7TV50 U29 ( .B1(n12), .B2(n86), .A1(n12), .A2(spibr[6]), .ZN(n74)
         );
  AOI22BBV1_7TV50 U30 ( .B1(n12), .B2(n85), .A1(n12), .A2(spibr[7]), .ZN(n75)
         );
  AOI22BBV1_7TV50 U33 ( .B1(n14), .B2(n92), .A1(n14), .A2(spidr1[0]), .ZN(n76)
         );
  AOI22BBV1_7TV50 U35 ( .B1(n14), .B2(n91), .A1(n14), .A2(spidr1[1]), .ZN(n77)
         );
  AOI22BBV1_7TV50 U37 ( .B1(n14), .B2(n90), .A1(n14), .A2(spidr1[2]), .ZN(n78)
         );
  AOI22BBV1_7TV50 U39 ( .B1(n14), .B2(n89), .A1(n14), .A2(spidr1[3]), .ZN(n79)
         );
  AOI22BBV1_7TV50 U41 ( .B1(n14), .B2(n88), .A1(n14), .A2(spidr1[4]), .ZN(n80)
         );
  AOI22BBV1_7TV50 U43 ( .B1(n14), .B2(n87), .A1(n14), .A2(spidr1[5]), .ZN(n81)
         );
  AOI22BBV1_7TV50 U45 ( .B1(n14), .B2(n86), .A1(n14), .A2(spidr1[6]), .ZN(n82)
         );
  AOI22BBV1_7TV50 U47 ( .B1(n14), .B2(n85), .A1(n14), .A2(spidr1[7]), .ZN(n83)
         );
  OAI31V1_7TV50 \inst_spi_master/U28  ( .A1(sck_m), .A2(\inst_spi_master/n18 ), 
        .A3(\inst_spi_master/n8 ), .B(\inst_spi_master/n19 ), .ZN(
        \inst_spi_master/n54 ) );
  DRNQV1_7TV50 \inst_spi_master/tr_done_dly1_reg  ( .D(
        \inst_spi_master/tr_done ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/tr_done_dly1 ) );
  DRNQV1_7TV50 \inst_spi_master/tr_done_reg  ( .D(\inst_spi_master/N152 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/tr_done ) );
  DRNQV1_7TV50 \inst_spi_master/mosi_reg  ( .D(\inst_spi_master/n42 ), .CK(clk), .RDN(n84), .Q(mosi_m) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[7]  ( .D(\inst_spi_master/n46 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[7]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[6]  ( .D(\inst_spi_master/n47 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[6]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[5]  ( .D(\inst_spi_master/n48 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[5]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[4]  ( .D(\inst_spi_master/n49 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[4]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[3]  ( .D(\inst_spi_master/n50 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[3]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[2]  ( .D(\inst_spi_master/n51 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[2]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[1]  ( .D(\inst_spi_master/n52 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[1]) );
  DRNQV1_7TV50 \inst_spi_master/data_r_m_reg[0]  ( .D(\inst_spi_master/n53 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_m[0]) );
  DSRNQV1_7TV50 \inst_spi_master/sck_reg  ( .D(\inst_spi_master/n54 ), .CK(clk), .RDN(\inst_spi_master/n30 ), .SDN(\inst_spi_master/n31 ), .Q(sck_m) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_level_reg  ( .D(\inst_spi_master/N41 ), .CK(clk), .RDN(n84), .Q(\inst_spi_master/sck_edge_level ) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_cnt_reg[4]  ( .D(
        \inst_spi_master/n55 ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/sck_edge_cnt [4]) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_cnt_reg[3]  ( .D(
        \inst_spi_master/n56 ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/sck_edge_cnt [3]) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_cnt_reg[2]  ( .D(
        \inst_spi_master/n57 ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/sck_edge_cnt [2]) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_cnt_reg[1]  ( .D(
        \inst_spi_master/n58 ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/sck_edge_cnt [1]) );
  DRNQV1_7TV50 \inst_spi_master/sck_edge_cnt_reg[0]  ( .D(
        \inst_spi_master/n59 ), .CK(clk), .RDN(n84), .Q(
        \inst_spi_master/sck_edge_cnt [0]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[7]  ( .D(\inst_spi_master/n32 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [7]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[6]  ( .D(\inst_spi_master/n33 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [6]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[5]  ( .D(\inst_spi_master/n34 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [5]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[4]  ( .D(\inst_spi_master/n35 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [4]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[3]  ( .D(\inst_spi_master/n36 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [3]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[2]  ( .D(\inst_spi_master/n37 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [2]) );
  DRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[1]  ( .D(\inst_spi_master/n38 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_master/clk_cnt [1]) );
  OA21BV1_7TV50 \inst_spi_slave/U51  ( .A1(\inst_spi_slave/n16 ), .A2(
        \inst_spi_slave/n17 ), .B(\inst_spi_slave/n8 ), .Z(\inst_spi_slave/n9 ) );
  DRNQV1_7TV50 \inst_spi_slave/data_finish_s_reg  ( .D(\inst_spi_slave/N123 ), 
        .CK(clk), .RDN(n84), .Q(data_finish_s) );
  DRNQV1_7TV50 \inst_spi_slave/miso_reg  ( .D(\inst_spi_slave/n26 ), .CK(clk), 
        .RDN(n84), .Q(miso_s) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[7]  ( .D(\inst_spi_slave/n30 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[7]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[6]  ( .D(\inst_spi_slave/n31 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[6]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[5]  ( .D(\inst_spi_slave/n32 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[5]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[4]  ( .D(\inst_spi_slave/n33 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[4]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[3]  ( .D(\inst_spi_slave/n34 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[3]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[2]  ( .D(\inst_spi_slave/n35 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[2]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[1]  ( .D(\inst_spi_slave/n36 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[1]) );
  DRNQV1_7TV50 \inst_spi_slave/data_r_s_reg[0]  ( .D(\inst_spi_slave/n37 ), 
        .CK(clk), .RDN(n84), .Q(spidr2_s[0]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_edge_cnt_reg[3]  ( .D(\inst_spi_slave/n38 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_slave/sck_edge_cnt [3]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_edge_cnt_reg[2]  ( .D(\inst_spi_slave/n39 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_slave/sck_edge_cnt [2]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_edge_cnt_reg[1]  ( .D(\inst_spi_slave/n40 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_slave/sck_edge_cnt [1]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_edge_cnt_reg[4]  ( .D(\inst_spi_slave/n41 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_slave/sck_edge_cnt [4]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_edge_cnt_reg[0]  ( .D(\inst_spi_slave/n42 ), 
        .CK(clk), .RDN(n84), .Q(\inst_spi_slave/sck_edge_cnt [0]) );
  DRNQV1_7TV50 \inst_spi_slave/sck_dly1_reg  ( .D(sck_s), .CK(clk), .RDN(n84), 
        .Q(\inst_spi_slave/sck_dly1 ) );
  ADH1V1_7TV50 \inst_spi_slave/add_80/U1_1_1  ( .A(
        \inst_spi_slave/sck_edge_cnt [1]), .B(\inst_spi_slave/sck_edge_cnt [0]), .CO(\inst_spi_slave/add_80/carry [2]), .S(\inst_spi_slave/N20 ) );
  ADH1V1_7TV50 \inst_spi_slave/add_80/U1_1_2  ( .A(
        \inst_spi_slave/sck_edge_cnt [2]), .B(\inst_spi_slave/add_80/carry [2]), .CO(\inst_spi_slave/add_80/carry [3]), .S(\inst_spi_slave/N21 ) );
  ADH1V1_7TV50 \inst_spi_slave/add_80/U1_1_3  ( .A(
        \inst_spi_slave/sck_edge_cnt [3]), .B(\inst_spi_slave/add_80/carry [3]), .CO(\inst_spi_slave/add_80/carry [4]), .S(\inst_spi_slave/N22 ) );
  ADH1V1_7TV50 \inst_spi_master/add_113/U1_1_1  ( .A(
        \inst_spi_master/sck_edge_cnt [1]), .B(
        \inst_spi_master/sck_edge_cnt [0]), .CO(
        \inst_spi_master/add_113/carry [2]), .S(\inst_spi_master/N31 ) );
  ADH1V1_7TV50 \inst_spi_master/add_113/U1_1_2  ( .A(
        \inst_spi_master/sck_edge_cnt [2]), .B(
        \inst_spi_master/add_113/carry [2]), .CO(
        \inst_spi_master/add_113/carry [3]), .S(\inst_spi_master/N32 ) );
  ADH1V1_7TV50 \inst_spi_master/add_113/U1_1_3  ( .A(
        \inst_spi_master/sck_edge_cnt [3]), .B(
        \inst_spi_master/add_113/carry [3]), .CO(
        \inst_spi_master/add_113/carry [4]), .S(\inst_spi_master/N33 ) );
  ADH1V1_7TV50 \inst_spi_master/add_65_DP_OP_289_508_1/U168  ( .A(spibr[4]), 
        .B(spibr[5]), .CO(\inst_spi_master/add_65_DP_OP_289_508_1/n158 ), .S(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ) );
  ADH1V1_7TV50 \inst_spi_master/add_65_DP_OP_289_508_1/U167  ( .A(
        \inst_spi_master/add_65_DP_OP_289_508_1/n158 ), .B(spibr[6]), .CO(
        \inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .S(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U7  ( .A(n98), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n14 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n6 ), .S(
        \inst_spi_master/N19 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U6  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n6 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n13 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n5 ), .S(
        \inst_spi_master/N20 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U5  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n5 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n12 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n4 ), .S(
        \inst_spi_master/N21 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U4  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n4 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n11 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n3 ), .S(
        \inst_spi_master/N22 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U3  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n3 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n10 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n2 ), .S(
        \inst_spi_master/N23 ) );
  ADH1V1_7TV50 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U2  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n2 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n9 ), .CO(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 ), .S(
        \inst_spi_master/N24 ) );
  DRNQV1_7TV50 \spibr_reg[0]  ( .D(n68), .CK(clk), .RDN(n84), .Q(spibr[0]) );
  DRNQV1_7TV50 \spibr_reg[1]  ( .D(n69), .CK(clk), .RDN(n84), .Q(spibr[1]) );
  TBUFV1_7TV50 mosi_s_tri ( .I(mosi), .OE(n106), .Z(mosi_s) );
  TBUFV1_7TV50 miso_m_tri ( .I(miso), .OE(spicr1[4]), .Z(miso_m) );
  TBUFV1_7TV50 mosi_tri ( .I(mosi_m), .OE(spicr1[4]), .Z(mosi) );
  TBUFV1_7TV50 sck_tri ( .I(sck_m), .OE(spicr1[4]), .Z(sck) );
  TBUFV1_7TV50 miso_tri ( .I(miso_s), .OE(n106), .Z(miso) );
  TBUFV1_7TV50 sck_s_tri ( .I(sck), .OE(n106), .Z(sck_s) );
  NOR2V1_7TV50 \inst_spi_slave/U28  ( .A1(ssn), .A2(
        \inst_spi_slave/sck_edge_cnt [4]), .ZN(\inst_spi_slave/n19 ) );
  NOR2V1_7TV50 \inst_spi_slave/U15  ( .A1(ssn), .A2(\inst_spi_slave/n9 ), .ZN(
        \inst_spi_slave/n7 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U47  ( .I0(spidr1[0]), .I1(spidr1[1]), .S(
        \inst_spi_slave/bit_count [0]), .ZN(\inst_spi_slave/n47 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U46  ( .I0(spidr1[2]), .I1(spidr1[3]), .S(
        \inst_spi_slave/bit_count [0]), .ZN(\inst_spi_slave/n48 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U45  ( .I0(\inst_spi_slave/n47 ), .I1(
        \inst_spi_slave/n48 ), .S(\inst_spi_slave/bit_count [1]), .ZN(
        \inst_spi_slave/n43 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U44  ( .I0(spidr1[4]), .I1(spidr1[5]), .S(
        \inst_spi_slave/bit_count [0]), .ZN(\inst_spi_slave/n45 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U43  ( .I0(spidr1[6]), .I1(spidr1[7]), .S(
        \inst_spi_slave/bit_count [0]), .ZN(\inst_spi_slave/n46 ) );
  MUX2NV1_7TV50 \inst_spi_slave/U42  ( .I0(\inst_spi_slave/n45 ), .I1(
        \inst_spi_slave/n46 ), .S(\inst_spi_slave/bit_count [1]), .ZN(
        \inst_spi_slave/n44 ) );
  AO222V1_7TV50 \inst_spi_slave/U6  ( .A1(\inst_spi_slave/n7 ), .A2(
        \inst_spi_slave/N35 ), .B1(\inst_spi_slave/n8 ), .B2(spidr1[7]), .C1(
        \inst_spi_slave/n9 ), .C2(miso_s), .Z(\inst_spi_slave/n26 ) );
  NOR2V1_7TV50 \inst_spi_slave/U10  ( .A1(\inst_spi_slave/bit_count [0]), .A2(
        \inst_spi_slave/bit_count [1]), .ZN(\inst_spi_slave/n12 ) );
  AOI21V1_7TV50 \inst_spi_slave/U8  ( .A1(\inst_spi_slave/bit_count [2]), .A2(
        \inst_spi_slave/n10 ), .B(ssn), .ZN(\inst_spi_slave/n11 ) );
  OAI21V1_7TV50 \inst_spi_slave/U7  ( .A1(\inst_spi_slave/bit_count [2]), .A2(
        \inst_spi_slave/n10 ), .B(\inst_spi_slave/n11 ), .ZN(
        \inst_spi_slave/n27 ) );
  OAI21V1_7TV50 \inst_spi_slave/U12  ( .A1(\inst_spi_slave/n9 ), .A2(
        \inst_spi_slave/bit_count [0]), .B(\inst_spi_slave/bit_count [1]), 
        .ZN(\inst_spi_slave/n14 ) );
  OAI211V1_7TV50 \inst_spi_slave/U11  ( .A1(\inst_spi_slave/bit_count [1]), 
        .A2(\inst_spi_slave/n13 ), .B(n97), .C(\inst_spi_slave/n14 ), .ZN(
        \inst_spi_slave/n28 ) );
  OAI211V1_7TV50 \inst_spi_slave/U13  ( .A1(n96), .A2(n112), .B(
        \inst_spi_slave/n15 ), .C(\inst_spi_slave/n13 ), .ZN(
        \inst_spi_slave/n29 ) );
  OR3V1_7TV50 \inst_spi_master/U59  ( .A1(\inst_spi_master/sck_edge_cnt [1]), 
        .A2(\inst_spi_master/sck_edge_cnt [3]), .A3(
        \inst_spi_master/sck_edge_cnt [2]), .Z(\inst_spi_master/n21 ) );
  OAI21V1_7TV50 \inst_spi_master/U33  ( .A1(\inst_spi_master/sck_edge_cnt [4]), 
        .A2(\inst_spi_master/n21 ), .B(\inst_spi_master/sck_edge_level ), .ZN(
        \inst_spi_master/n22 ) );
  AOI211V1_7TV50 \inst_spi_master/U32  ( .A1(\inst_spi_master/sck_edge_cnt [4]), .A2(\inst_spi_master/n21 ), .B(\inst_spi_master/sck_edge_cnt [0]), .C(
        \inst_spi_master/n22 ), .ZN(\inst_spi_master/n16 ) );
  AND3V1_7TV50 \inst_spi_master/U31  ( .A1(\inst_spi_master/sck_edge_cnt [0]), 
        .A2(\inst_spi_master/sck_edge_level ), .A3(n110), .Z(
        \inst_spi_master/n15 ) );
  NAND4V1_7TV50 \inst_spi_master/U57  ( .A1(spssn_o[4]), .A2(spssn_o[5]), .A3(
        spssn_o[6]), .A4(spssn_o[7]), .ZN(\inst_spi_master/n25 ) );
  NAND4V1_7TV50 \inst_spi_master/U56  ( .A1(spssn_o[0]), .A2(spssn_o[1]), .A3(
        spssn_o[2]), .A4(spssn_o[3]), .ZN(\inst_spi_master/n26 ) );
  NOR3V1_7TV50 \inst_spi_master/U58  ( .A1(\inst_spi_master/sck_edge_cnt [0]), 
        .A2(n110), .A3(\inst_spi_master/n21 ), .ZN(\inst_spi_master/n24 ) );
  AO22V1_7TV50 \inst_spi_master/U38  ( .A1(\inst_spi_master/sck_edge_cnt [0]), 
        .A2(\inst_spi_master/n23 ), .B1(\inst_spi_master/N41 ), .B2(n111), .Z(
        \inst_spi_master/n59 ) );
  AO22V1_7TV50 \inst_spi_master/U35  ( .A1(\inst_spi_master/sck_edge_cnt [3]), 
        .A2(\inst_spi_master/n23 ), .B1(\inst_spi_master/N41 ), .B2(
        \inst_spi_master/N33 ), .Z(\inst_spi_master/n56 ) );
  AO22V1_7TV50 \inst_spi_master/U37  ( .A1(\inst_spi_master/sck_edge_cnt [1]), 
        .A2(\inst_spi_master/n23 ), .B1(\inst_spi_master/N41 ), .B2(
        \inst_spi_master/N31 ), .Z(\inst_spi_master/n58 ) );
  AO22V1_7TV50 \inst_spi_master/U34  ( .A1(\inst_spi_master/sck_edge_cnt [4]), 
        .A2(\inst_spi_master/n23 ), .B1(\inst_spi_master/N41 ), .B2(
        \inst_spi_master/N34 ), .Z(\inst_spi_master/n55 ) );
  AO22V1_7TV50 \inst_spi_master/U36  ( .A1(\inst_spi_master/sck_edge_cnt [2]), 
        .A2(\inst_spi_master/n23 ), .B1(\inst_spi_master/N41 ), .B2(
        \inst_spi_master/N32 ), .Z(\inst_spi_master/n57 ) );
  AOI22V1_7TV50 \inst_spi_master/U17  ( .A1(spicr1[1]), .A2(
        \inst_spi_master/n15 ), .B1(\inst_spi_master/n16 ), .B2(n108), .ZN(
        \inst_spi_master/n1 ) );
  MUX2NV1_7TV50 \inst_spi_master/U71  ( .I0(spidr1[0]), .I1(spidr1[1]), .S(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n64 ) );
  MUX2NV1_7TV50 \inst_spi_master/U70  ( .I0(spidr1[2]), .I1(spidr1[3]), .S(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n65 ) );
  MUX2NV1_7TV50 \inst_spi_master/U69  ( .I0(\inst_spi_master/n64 ), .I1(
        \inst_spi_master/n65 ), .S(\inst_spi_master/bit_count [1]), .ZN(
        \inst_spi_master/n60 ) );
  MUX2NV1_7TV50 \inst_spi_master/U68  ( .I0(spidr1[4]), .I1(spidr1[5]), .S(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n62 ) );
  MUX2NV1_7TV50 \inst_spi_master/U67  ( .I0(spidr1[6]), .I1(spidr1[7]), .S(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n63 ) );
  MUX2NV1_7TV50 \inst_spi_master/U66  ( .I0(\inst_spi_master/n62 ), .I1(
        \inst_spi_master/n63 ), .S(\inst_spi_master/bit_count [1]), .ZN(
        \inst_spi_master/n61 ) );
  NAND3V1_7TV50 \inst_spi_master/U6  ( .A1(\inst_spi_master/n8 ), .A2(n108), 
        .A3(spidr1[7]), .ZN(\inst_spi_master/n3 ) );
  OAI22BBV1_7TV50 \inst_spi_master/U5  ( .B1(n95), .B2(n108), .A1(
        \inst_spi_master/n1 ), .A2(n95), .ZN(\inst_spi_master/n5 ) );
  OAI211V1_7TV50 \inst_spi_master/U3  ( .A1(\inst_spi_master/n1 ), .A2(
        \inst_spi_master/n2 ), .B(\inst_spi_master/n3 ), .C(
        \inst_spi_master/n4 ), .ZN(\inst_spi_master/n42 ) );
  NOR3V1_7TV50 \inst_spi_master/U30  ( .A1(\inst_spi_master/n16 ), .A2(
        \inst_spi_master/n15 ), .A3(\inst_spi_master/n8 ), .ZN(
        \inst_spi_master/n18 ) );
  AOI22V1_7TV50 \inst_spi_master/U29  ( .A1(sck_m), .A2(\inst_spi_master/n18 ), 
        .B1(spicr1[2]), .B2(\inst_spi_master/n8 ), .ZN(\inst_spi_master/n19 )
         );
  AOI32V1_7TV50 \inst_spi_master/U13  ( .A1(n107), .A2(n95), .A3(
        \inst_spi_master/n14 ), .B1(n108), .B2(\inst_spi_master/n8 ), .ZN(
        \inst_spi_master/n45 ) );
  NOR3V1_7TV50 U92 ( .A1(sfraddr_r[2]), .A2(n93), .A3(n94), .ZN(n33) );
  AOI22V1_7TV50 U78 ( .A1(n33), .A2(spisr[1]), .B1(n22), .B2(spidr2_s[1]), 
        .ZN(n40) );
  AOI22V1_7TV50 U77 ( .A1(n23), .A2(spidr2_m[1]), .B1(n20), .B2(spidr1[1]), 
        .ZN(n41) );
  AOI222V1_7TV50 U76 ( .A1(n18), .A2(spibr[1]), .B1(n21), .B2(spicr1[1]), .C1(
        n19), .C2(spicr2[1]), .ZN(n42) );
  NAND3V1_7TV50 U75 ( .A1(n40), .A2(n41), .A3(n42), .ZN(N73) );
  AOI22V1_7TV50 U66 ( .A1(n33), .A2(spisr[4]), .B1(n22), .B2(spidr2_s[4]), 
        .ZN(n30) );
  AOI22V1_7TV50 U65 ( .A1(n23), .A2(spidr2_m[4]), .B1(n20), .B2(spidr1[4]), 
        .ZN(n31) );
  AOI222V1_7TV50 U64 ( .A1(n18), .A2(spibr[4]), .B1(spicr1[4]), .B2(n21), .C1(
        n19), .C2(spicr2[4]), .ZN(n32) );
  NAND3V1_7TV50 U63 ( .A1(n30), .A2(n31), .A3(n32), .ZN(N76) );
  AOI22V1_7TV50 U88 ( .A1(n33), .A2(spisr[0]), .B1(n22), .B2(spidr2_s[0]), 
        .ZN(n43) );
  AOI22V1_7TV50 U84 ( .A1(n23), .A2(spidr2_m[0]), .B1(spidr1[0]), .B2(n20), 
        .ZN(n44) );
  AOI222V1_7TV50 U80 ( .A1(spibr[0]), .A2(n18), .B1(spicr1[0]), .B2(n21), .C1(
        spicr2[0]), .C2(n19), .ZN(n45) );
  NAND3V1_7TV50 U79 ( .A1(n43), .A2(n44), .A3(n45), .ZN(N72) );
  AOI22V1_7TV50 U54 ( .A1(n22), .A2(spidr2_s[7]), .B1(n23), .B2(spidr2_m[7]), 
        .ZN(n15) );
  AOI22V1_7TV50 U53 ( .A1(n20), .A2(spidr1[7]), .B1(n21), .B2(spicr1[7]), .ZN(
        n16) );
  AOI22V1_7TV50 U52 ( .A1(n18), .A2(spibr[7]), .B1(n19), .B2(spicr2[7]), .ZN(
        n17) );
  NAND3V1_7TV50 U51 ( .A1(n15), .A2(n16), .A3(n17), .ZN(N79) );
  AOI22V1_7TV50 U70 ( .A1(n22), .A2(spidr2_s[3]), .B1(n23), .B2(spidr2_m[3]), 
        .ZN(n34) );
  AOI22V1_7TV50 U69 ( .A1(n20), .A2(spidr1[3]), .B1(n21), .B2(spicr1[3]), .ZN(
        n35) );
  AOI22V1_7TV50 U68 ( .A1(n18), .A2(spibr[3]), .B1(n19), .B2(spicr2[3]), .ZN(
        n36) );
  NAND3V1_7TV50 U67 ( .A1(n34), .A2(n35), .A3(n36), .ZN(N75) );
  AOI22V1_7TV50 U74 ( .A1(n22), .A2(spidr2_s[2]), .B1(n23), .B2(spidr2_m[2]), 
        .ZN(n37) );
  AOI22V1_7TV50 U73 ( .A1(n20), .A2(spidr1[2]), .B1(n21), .B2(spicr1[2]), .ZN(
        n38) );
  AOI22V1_7TV50 U72 ( .A1(n18), .A2(spibr[2]), .B1(n19), .B2(spicr2[2]), .ZN(
        n39) );
  NAND3V1_7TV50 U71 ( .A1(n37), .A2(n38), .A3(n39), .ZN(N74) );
  AOI22V1_7TV50 U62 ( .A1(n22), .A2(spidr2_s[5]), .B1(n23), .B2(spidr2_m[5]), 
        .ZN(n27) );
  AOI22V1_7TV50 U61 ( .A1(n20), .A2(spidr1[5]), .B1(n21), .B2(spicr1[5]), .ZN(
        n28) );
  AOI22V1_7TV50 U60 ( .A1(n18), .A2(spibr[5]), .B1(n19), .B2(spicr2[5]), .ZN(
        n29) );
  NAND3V1_7TV50 U59 ( .A1(n27), .A2(n28), .A3(n29), .ZN(N77) );
  AOI22V1_7TV50 U58 ( .A1(n22), .A2(spidr2_s[6]), .B1(n23), .B2(spidr2_m[6]), 
        .ZN(n24) );
  AOI22V1_7TV50 U57 ( .A1(n20), .A2(spidr1[6]), .B1(n21), .B2(spicr1[6]), .ZN(
        n25) );
  AOI22V1_7TV50 U56 ( .A1(n18), .A2(spibr[6]), .B1(n19), .B2(spicr2[6]), .ZN(
        n26) );
  NAND3V1_7TV50 U55 ( .A1(n24), .A2(n25), .A3(n26), .ZN(N78) );
  OAI211V1_7TV50 \inst_spi_master/U10  ( .A1(\inst_spi_master/n12 ), .A2(n109), 
        .B(n95), .C(\inst_spi_master/n9 ), .ZN(\inst_spi_master/n44 ) );
  OAI21V1_7TV50 \inst_spi_master/U9  ( .A1(\inst_spi_master/bit_count [1]), 
        .A2(n107), .B(\inst_spi_master/bit_count [2]), .ZN(
        \inst_spi_master/n10 ) );
  OAI211V1_7TV50 \inst_spi_master/U8  ( .A1(\inst_spi_master/bit_count [2]), 
        .A2(\inst_spi_master/n9 ), .B(n95), .C(\inst_spi_master/n10 ), .ZN(
        \inst_spi_master/n43 ) );
  NOR4V1_7TV50 \inst_spi_slave/U40  ( .A1(\inst_spi_slave/sck_edge_cnt [0]), 
        .A2(\inst_spi_slave/sck_edge_cnt [2]), .A3(
        \inst_spi_slave/sck_edge_cnt [1]), .A4(
        \inst_spi_slave/sck_edge_cnt [3]), .ZN(\inst_spi_slave/n25 ) );
  AO22V1_7TV50 \inst_spi_slave/U30  ( .A1(\inst_spi_slave/sck_edge_cnt [3]), 
        .A2(\inst_spi_slave/n21 ), .B1(\inst_spi_slave/n22 ), .B2(
        \inst_spi_slave/N22 ), .Z(\inst_spi_slave/n38 ) );
  AO22V1_7TV50 \inst_spi_slave/U33  ( .A1(\inst_spi_slave/sck_edge_cnt [4]), 
        .A2(\inst_spi_slave/n21 ), .B1(\inst_spi_slave/n22 ), .B2(
        \inst_spi_slave/N23 ), .Z(\inst_spi_slave/n41 ) );
  AO22V1_7TV50 \inst_spi_slave/U34  ( .A1(\inst_spi_slave/sck_edge_cnt [0]), 
        .A2(\inst_spi_slave/n21 ), .B1(\inst_spi_slave/n22 ), .B2(n113), .Z(
        \inst_spi_slave/n42 ) );
  AO22V1_7TV50 \inst_spi_slave/U31  ( .A1(\inst_spi_slave/sck_edge_cnt [2]), 
        .A2(\inst_spi_slave/n21 ), .B1(\inst_spi_slave/n22 ), .B2(
        \inst_spi_slave/N21 ), .Z(\inst_spi_slave/n39 ) );
  AO22V1_7TV50 \inst_spi_slave/U32  ( .A1(\inst_spi_slave/sck_edge_cnt [1]), 
        .A2(\inst_spi_slave/n21 ), .B1(\inst_spi_slave/n22 ), .B2(
        \inst_spi_slave/N20 ), .Z(\inst_spi_slave/n40 ) );
  NOR2XBV1_7TV50 \inst_spi_master/U54  ( .A1(\inst_spi_master/n24 ), .B1(
        \inst_spi_master/n8 ), .ZN(\inst_spi_master/N152 ) );
  NOR2V1_7TV50 \inst_spi_slave/U38  ( .A1(ssn), .A2(\inst_spi_slave/n24 ), 
        .ZN(\inst_spi_slave/N123 ) );
  NOR2XBV1_7TV50 \inst_spi_master/U51  ( .A1(\inst_spi_master/tr_done ), .B1(
        \inst_spi_master/tr_done_dly1 ), .ZN(data_finish_m) );
  NAND2XBV1_7TV50 \inst_spi_master/U40  ( .A1(n84), .B1(spicr1[2]), .ZN(
        \inst_spi_master/n31 ) );
  AOI22BBV1_7TV50 \inst_spi_slave/U52  ( .B1(\inst_spi_slave/sck_dly1 ), .B2(
        sck_s), .A1(\inst_spi_slave/sck_dly1 ), .A2(sck_s), .ZN(
        \inst_spi_slave/n20 ) );
  XNOR2V1_7TV50 \inst_spi_slave/U29  ( .A1(spicr1[1]), .A2(
        \inst_spi_slave/sck_edge_cnt [0]), .ZN(\inst_spi_slave/n17 ) );
  NOR2V1_7TV50 U89 ( .A1(spicr1[4]), .A2(n49), .ZN(n22) );
  NOR3V1_7TV50 U83 ( .A1(sfraddr_r[2]), .A2(sfraddr_r[0]), .A3(n93), .ZN(n18)
         );
  NOR3V1_7TV50 U82 ( .A1(sfraddr_r[1]), .A2(sfraddr_r[2]), .A3(sfraddr_r[0]), 
        .ZN(n21) );
  NOR3V1_7TV50 U81 ( .A1(sfraddr_r[1]), .A2(sfraddr_r[2]), .A3(n94), .ZN(n19)
         );
  NOR2V1_7TV50 \inst_spi_slave/U36  ( .A1(\inst_spi_slave/n20 ), .A2(
        \inst_spi_slave/n23 ), .ZN(\inst_spi_slave/n21 ) );
  NOR2XBV1_7TV50 \inst_spi_slave/U35  ( .A1(\inst_spi_slave/n20 ), .B1(
        \inst_spi_slave/n23 ), .ZN(\inst_spi_slave/n22 ) );
  NAND2V1_7TV50 \inst_spi_slave/U27  ( .A1(\inst_spi_slave/n19 ), .A2(
        \inst_spi_slave/n20 ), .ZN(\inst_spi_slave/n16 ) );
  MUX2V1_7TV50 \inst_spi_slave/U41  ( .I0(\inst_spi_slave/n43 ), .I1(
        \inst_spi_slave/n44 ), .S(\inst_spi_slave/bit_count [2]), .Z(
        \inst_spi_slave/N35 ) );
  NAND2V1_7TV50 \inst_spi_slave/U9  ( .A1(\inst_spi_slave/n12 ), .A2(n96), 
        .ZN(\inst_spi_slave/n10 ) );
  NAND2V1_7TV50 \inst_spi_slave/U14  ( .A1(\inst_spi_slave/n7 ), .A2(n112), 
        .ZN(\inst_spi_slave/n13 ) );
  CLKNAND2V1_7TV50 \inst_spi_slave/U16  ( .A1(ssn), .A2(spicr1[1]), .ZN(
        \inst_spi_slave/n15 ) );
  MUX2V1_7TV50 \inst_spi_master/U18  ( .I0(spidr2_m[7]), .I1(spidr2_m[6]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n46 ) );
  MUX2V1_7TV50 \inst_spi_master/U24  ( .I0(spidr2_m[1]), .I1(spidr2_m[0]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n52 ) );
  MUX2V1_7TV50 \inst_spi_master/U22  ( .I0(spidr2_m[3]), .I1(spidr2_m[2]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n50 ) );
  MUX2V1_7TV50 \inst_spi_master/U23  ( .I0(spidr2_m[2]), .I1(spidr2_m[1]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n51 ) );
  MUX2V1_7TV50 \inst_spi_master/U25  ( .I0(spidr2_m[0]), .I1(miso_m), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n53 ) );
  MUX2V1_7TV50 \inst_spi_master/U20  ( .I0(spidr2_m[5]), .I1(spidr2_m[4]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n48 ) );
  MUX2V1_7TV50 \inst_spi_master/U21  ( .I0(spidr2_m[4]), .I1(spidr2_m[3]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n49 ) );
  MUX2V1_7TV50 \inst_spi_master/U19  ( .I0(spidr2_m[6]), .I1(spidr2_m[5]), .S(
        \inst_spi_master/n17 ), .Z(\inst_spi_master/n47 ) );
  NOR3V1_7TV50 \inst_spi_master/U52  ( .A1(\inst_spi_master/n24 ), .A2(
        \inst_spi_master/n8 ), .A3(n99), .ZN(\inst_spi_master/N41 ) );
  MUX2V1_7TV50 \inst_spi_slave/U22  ( .I0(spidr2_s[3]), .I1(spidr2_s[2]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n34 ) );
  MUX2V1_7TV50 \inst_spi_slave/U23  ( .I0(spidr2_s[2]), .I1(spidr2_s[1]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n35 ) );
  MUX2V1_7TV50 \inst_spi_slave/U24  ( .I0(spidr2_s[1]), .I1(spidr2_s[0]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n36 ) );
  MUX2V1_7TV50 \inst_spi_slave/U20  ( .I0(spidr2_s[5]), .I1(spidr2_s[4]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n32 ) );
  MUX2V1_7TV50 \inst_spi_slave/U21  ( .I0(spidr2_s[4]), .I1(spidr2_s[3]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n33 ) );
  MUX2V1_7TV50 \inst_spi_slave/U19  ( .I0(spidr2_s[6]), .I1(spidr2_s[5]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n31 ) );
  MUX2V1_7TV50 \inst_spi_slave/U18  ( .I0(spidr2_s[7]), .I1(spidr2_s[6]), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n30 ) );
  MUX2V1_7TV50 \inst_spi_slave/U25  ( .I0(spidr2_s[0]), .I1(mosi_s), .S(
        \inst_spi_slave/n18 ), .Z(\inst_spi_slave/n37 ) );
  MUX2V1_7TV50 \inst_spi_master/U65  ( .I0(\inst_spi_master/n60 ), .I1(
        \inst_spi_master/n61 ), .S(\inst_spi_master/bit_count [2]), .Z(
        \inst_spi_master/N49 ) );
  NAND2V1_7TV50 \inst_spi_master/U7  ( .A1(n95), .A2(\inst_spi_master/N49 ), 
        .ZN(\inst_spi_master/n2 ) );
  NAND2V1_7TV50 \inst_spi_master/U4  ( .A1(mosi_m), .A2(\inst_spi_master/n5 ), 
        .ZN(\inst_spi_master/n4 ) );
  NOR2V1_7TV50 \inst_spi_master/U16  ( .A1(\inst_spi_master/n1 ), .A2(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n12 ) );
  NAND2V1_7TV50 \inst_spi_master/U14  ( .A1(\inst_spi_master/n1 ), .A2(
        \inst_spi_master/bit_count [0]), .ZN(\inst_spi_master/n14 ) );
  NAND2V1_7TV50 U91 ( .A1(n93), .A2(sfraddr_r[2]), .ZN(n48) );
  CLKOR2V1_7TV50 U90 ( .A1(n48), .A2(n94), .Z(n49) );
  NAND2V1_7TV50 \inst_spi_master/U11  ( .A1(\inst_spi_master/n12 ), .A2(n109), 
        .ZN(\inst_spi_master/n9 ) );
  NAND2V1_7TV50 \inst_spi_slave/U39  ( .A1(\inst_spi_slave/n25 ), .A2(
        \inst_spi_slave/sck_edge_cnt [4]), .ZN(\inst_spi_slave/n24 ) );
  NAND2V1_7TV50 \inst_spi_slave/U37  ( .A1(n97), .A2(\inst_spi_slave/n24 ), 
        .ZN(\inst_spi_slave/n23 ) );
  CLKOR2V1_7TV50 \inst_spi_master/U41  ( .A1(spicr1[2]), .A2(n84), .Z(
        \inst_spi_master/n30 ) );
  NOR2V1_7TV50 \inst_spi_slave/U17  ( .A1(n97), .A2(spicr1[1]), .ZN(
        \inst_spi_slave/n8 ) );
  NOR2V1_7TV50 \inst_spi_master/U39  ( .A1(\inst_spi_master/N15 ), .A2(
        \inst_spi_master/n8 ), .ZN(\inst_spi_master/n23 ) );
  NOR2V1_7TV50 U86 ( .A1(n106), .A2(n49), .ZN(n23) );
  NOR2V1_7TV50 U85 ( .A1(sfraddr_r[0]), .A2(n48), .ZN(n20) );
  OAI21V1_7TV50 \inst_spi_master/U55  ( .A1(\inst_spi_master/n25 ), .A2(
        \inst_spi_master/n26 ), .B(spicr1[6]), .ZN(\inst_spi_master/n8 ) );
  OA221V1_7TV50 \inst_spi_master/U26  ( .A1(n108), .A2(\inst_spi_master/n16 ), 
        .B1(spicr1[1]), .B2(\inst_spi_master/n15 ), .C(n95), .Z(
        \inst_spi_master/n17 ) );
  NOR2XBV1_7TV50 \inst_spi_slave/U26  ( .A1(\inst_spi_slave/n17 ), .B1(
        \inst_spi_slave/n16 ), .ZN(\inst_spi_slave/n18 ) );
  CLKNAND2V1_7TV50 U32 ( .A1(sfrwe), .A2(sfraddr_w[1]), .ZN(n13) );
  CLKNAND2V1_7TV50 U50 ( .A1(sfrwe), .A2(sfraddr_w[0]), .ZN(n11) );
  MUX2V1_7TV50 \inst_spi_master/U49  ( .I0(\inst_spi_master/clk_cnt [0]), .I1(
        \inst_spi_master/N18 ), .S(n95), .Z(\inst_spi_master/n40 ) );
  MUX2V1_7TV50 \inst_spi_master/U42  ( .I0(\inst_spi_master/clk_cnt [7]), .I1(
        \inst_spi_master/N25 ), .S(n95), .Z(\inst_spi_master/n32 ) );
  MUX2V1_7TV50 \inst_spi_master/U44  ( .I0(\inst_spi_master/clk_cnt [5]), .I1(
        \inst_spi_master/N23 ), .S(n95), .Z(\inst_spi_master/n34 ) );
  MUX2V1_7TV50 \inst_spi_master/U43  ( .I0(\inst_spi_master/clk_cnt [6]), .I1(
        \inst_spi_master/N24 ), .S(n95), .Z(\inst_spi_master/n33 ) );
  MUX2V1_7TV50 \inst_spi_master/U48  ( .I0(\inst_spi_master/clk_cnt [1]), .I1(
        \inst_spi_master/N19 ), .S(n95), .Z(\inst_spi_master/n38 ) );
  MUX2V1_7TV50 \inst_spi_master/U45  ( .I0(\inst_spi_master/clk_cnt [4]), .I1(
        \inst_spi_master/N22 ), .S(n95), .Z(\inst_spi_master/n35 ) );
  MUX2V1_7TV50 \inst_spi_master/U47  ( .I0(\inst_spi_master/clk_cnt [2]), .I1(
        \inst_spi_master/N20 ), .S(n95), .Z(\inst_spi_master/n37 ) );
  MUX2V1_7TV50 \inst_spi_master/U46  ( .I0(\inst_spi_master/clk_cnt [3]), .I1(
        \inst_spi_master/N21 ), .S(n95), .Z(\inst_spi_master/n36 ) );
  DSRNQV1_7TV50 \inst_spi_master/bit_count_reg[2]  ( .D(\inst_spi_master/n43 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(rst_n_sync), .Q(
        \inst_spi_master/bit_count [2]) );
  DSRNQV1_7TV50 \inst_spi_master/bit_count_reg[1]  ( .D(\inst_spi_master/n44 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(
        \inst_spi_master/bit_count [1]) );
  DSRNQV1_7TV50 \inst_spi_slave/bit_count_reg[0]  ( .D(\inst_spi_slave/n29 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(
        \inst_spi_slave/bit_count [0]) );
  DSRNQV1_7TV50 \inst_spi_slave/bit_count_reg[2]  ( .D(\inst_spi_slave/n27 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(
        \inst_spi_slave/bit_count [2]) );
  DSRNQV1_7TV50 \inst_spi_slave/bit_count_reg[1]  ( .D(\inst_spi_slave/n28 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(
        \inst_spi_slave/bit_count [1]) );
  DSRNQV1_7TV50 \inst_spi_master/bit_count_reg[0]  ( .D(\inst_spi_master/n45 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(
        \inst_spi_master/bit_count [0]) );
  DSRNQV1_7TV50 \inst_spi_master/clk_cnt_reg[0]  ( .D(\inst_spi_master/n40 ), 
        .CK(clk), .RDN(\*Logic1* ), .SDN(n84), .Q(\inst_spi_master/clk_cnt [0]) );
  PULL1_7TV50 U95 ( .Z(\*Logic1* ) );
  INV1_7TV50 U96 ( .I(\inst_spi_master/n8 ), .ZN(n95) );
  NOR2V1_7TV50 U97 ( .A1(sfraddr_w[0]), .A2(n13), .ZN(n12) );
  NOR2V1_7TV50 U98 ( .A1(sfraddr_w[1]), .A2(n11), .ZN(n10) );
  NOR2XBV1_7TV50 U99 ( .A1(sfraddr_w[1]), .B1(n11), .ZN(n14) );
  NOR3BV1_7TV50 U100 ( .A1(sfrwe), .B1(sfraddr_w[0]), .B2(sfraddr_w[1]), .ZN(
        n1) );
  INV0P7_7TV50 U101 ( .I(\inst_spi_master/N15 ), .ZN(n99) );
  CLKBUFV2_7TV50 U102 ( .I(rst_n_sync), .Z(n84) );
  INV0P7_7TV50 U103 ( .I(\inst_spi_master/bit_count [1]), .ZN(n109) );
  INV0P7_7TV50 U104 ( .I(spicr1[4]), .ZN(n106) );
  CLKINV1_7TV50 U105 ( .I(sfraddr_r[0]), .ZN(n94) );
  CLKINV1_7TV50 U106 ( .I(sfraddr_r[1]), .ZN(n93) );
  NAND2V1_7TV50 U107 ( .A1(\inst_spi_master/clk_cnt [7]), .A2(n99), .ZN(n114)
         );
  CLKINV1_7TV50 U108 ( .I(spidata_i[7]), .ZN(n85) );
  CLKINV1_7TV50 U109 ( .I(spidata_i[6]), .ZN(n86) );
  CLKINV1_7TV50 U110 ( .I(spidata_i[5]), .ZN(n87) );
  CLKINV1_7TV50 U111 ( .I(spidata_i[4]), .ZN(n88) );
  CLKINV1_7TV50 U112 ( .I(spidata_i[3]), .ZN(n89) );
  CLKINV1_7TV50 U113 ( .I(spidata_i[2]), .ZN(n90) );
  CLKINV1_7TV50 U114 ( .I(spidata_i[1]), .ZN(n91) );
  CLKINV1_7TV50 U115 ( .I(spidata_i[0]), .ZN(n92) );
  NAND2V1_7TV50 U116 ( .A1(n127), .A2(n126), .ZN(n133) );
  INV0P7_7TV50 U117 ( .I(\inst_spi_master/sck_edge_cnt [4]), .ZN(n110) );
  INV0P7_7TV50 U118 ( .I(spicr1[1]), .ZN(n108) );
  INV0P7_7TV50 U119 ( .I(\inst_spi_slave/bit_count [0]), .ZN(n112) );
  CLKINV1_7TV50 U120 ( .I(ssn), .ZN(n97) );
  INV0P7_7TV50 U121 ( .I(\inst_spi_slave/sck_edge_cnt [0]), .ZN(n113) );
  AND2V1_7TV50 U122 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [6]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n9 ) );
  AND2V1_7TV50 U123 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [5]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n10 ) );
  AND2V1_7TV50 U124 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [4]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n11 ) );
  AND2V1_7TV50 U125 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [3]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n12 ) );
  AND2V1_7TV50 U126 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [2]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n13 ) );
  AND2V1_7TV50 U127 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [1]), .Z(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n14 ) );
  CLKINV1_7TV50 U128 ( .I(\inst_spi_master/N18 ), .ZN(n98) );
  NAND2V1_7TV50 U129 ( .A1(n99), .A2(\inst_spi_master/clk_cnt [0]), .ZN(
        \inst_spi_master/N18 ) );
  INV0P7_7TV50 U130 ( .I(\inst_spi_master/sck_edge_cnt [0]), .ZN(n111) );
  NAND2V1_7TV50 U131 ( .A1(n142), .A2(n141), .ZN(n144) );
  AND2V1_7TV50 U132 ( .A1(n134), .A2(n101), .Z(n135) );
  CLKOR2V1_7TV50 U133 ( .A1(n142), .A2(n128), .Z(n129) );
  NAND2V1_7TV50 U134 ( .A1(spibr[1]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .ZN(n152) );
  NAND2V1_7TV50 U135 ( .A1(spibr[0]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .ZN(n151) );
  CLKINV1_7TV50 U136 ( .I(n131), .ZN(n101) );
  CLKOR2V1_7TV50 U137 ( .A1(n126), .A2(n127), .Z(n154) );
  AND2V1_7TV50 U138 ( .A1(spibr[0]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .Z(n127) );
  NAND2V1_7TV50 U139 ( .A1(spibr[1]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .ZN(n126) );
  CLKINV1_7TV50 U140 ( .I(n155), .ZN(n102) );
  NAND2V1_7TV50 U141 ( .A1(n142), .A2(n103), .ZN(n156) );
  CLKINV1_7TV50 U142 ( .I(n141), .ZN(n103) );
  CLKINV1_7TV50 U143 ( .I(\inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .ZN(
        n100) );
  NAND2V1_7TV50 U144 ( .A1(spibr[2]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .ZN(n131) );
  NAND2V1_7TV50 U145 ( .A1(spibr[0]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .ZN(n148) );
  NAND2V1_7TV50 U146 ( .A1(spibr[1]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .ZN(n119) );
  INV0P7_7TV50 U147 ( .I(n128), .ZN(n104) );
  INV0P7_7TV50 U148 ( .I(spibr[2]), .ZN(n105) );
  NAND2V1_7TV50 U149 ( .A1(spibr[2]), .A2(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .ZN(n155) );
  NOR3V1_7TV50 U150 ( .A1(n165), .A2(n164), .A3(n163), .ZN(
        \inst_spi_master/N15 ) );
  INV0P7_7TV50 U151 ( .I(\inst_spi_master/n12 ), .ZN(n107) );
  XNOR2V1_7TV50 U152 ( .A1(n114), .A2(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 ), .ZN(
        \inst_spi_master/N25 ) );
  NAND3V1_7TV50 U153 ( .A1(n162), .A2(n161), .A3(n160), .ZN(n163) );
  AOI221V1_7TV50 U154 ( .A1(\inst_spi_master/clk_cnt [5]), .A2(n159), .B1(n158), .B2(\inst_spi_master/clk_cnt [7]), .C(n157), .ZN(n160) );
  OAI22V1_7TV50 U155 ( .A1(\inst_spi_master/clk_cnt [5]), .A2(n159), .B1(
        \inst_spi_master/clk_cnt [7]), .B2(n158), .ZN(n157) );
  OA221V1_7TV50 U156 ( .A1(n104), .A2(n156), .B1(n155), .B2(n154), .C(n153), 
        .Z(n158) );
  AOI32V1_7TV50 U157 ( .A1(n152), .A2(n151), .A3(n150), .B1(n149), .B2(n101), 
        .ZN(n153) );
  AOI2XB11V1_7TV50 U158 ( .A2N(n148), .A1(n147), .B(n146), .C(n145), .ZN(n159)
         );
  OAI22BBV1_7TV50 U159 ( .B1(n104), .B2(n144), .A1(n143), .A2(n102), .ZN(n145)
         );
  NOR3BV1_7TV50 U160 ( .A1(n151), .B1(n150), .B2(n152), .ZN(n146) );
  AOI221V1_7TV50 U161 ( .A1(\inst_spi_master/clk_cnt [2]), .A2(n140), .B1(n139), .B2(\inst_spi_master/clk_cnt [6]), .C(n138), .ZN(n161) );
  OAI22V1_7TV50 U162 ( .A1(\inst_spi_master/clk_cnt [2]), .A2(n140), .B1(
        \inst_spi_master/clk_cnt [6]), .B2(n139), .ZN(n138) );
  AOI2XB11V1_7TV50 U163 ( .A2N(n152), .A1(n137), .B(n136), .C(n135), .ZN(n139)
         );
  OAI22BBV1_7TV50 U164 ( .B1(n155), .B2(n133), .A1(n132), .A2(n103), .ZN(n136)
         );
  AOI31V1_7TV50 U165 ( .A1(n134), .A2(n131), .A3(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .B(n130), .ZN(n140) );
  OAI22V1_7TV50 U166 ( .A1(n102), .A2(n133), .B1(n141), .B2(n129), .ZN(n130)
         );
  OAI21V1_7TV50 U167 ( .A1(spibr[0]), .A2(spibr[1]), .B(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .ZN(n134) );
  AOI221V1_7TV50 U168 ( .A1(\inst_spi_master/clk_cnt [3]), .A2(n125), .B1(n124), .B2(\inst_spi_master/clk_cnt [4]), .C(n123), .ZN(n162) );
  OAI22V1_7TV50 U169 ( .A1(\inst_spi_master/clk_cnt [3]), .A2(n125), .B1(
        \inst_spi_master/clk_cnt [4]), .B2(n124), .ZN(n123) );
  AOI21V1_7TV50 U170 ( .A1(n147), .A2(n148), .B(n122), .ZN(n124) );
  OAI21V1_7TV50 U171 ( .A1(n126), .A2(n121), .B(n120), .ZN(n122) );
  AOI22V1_7TV50 U172 ( .A1(n137), .A2(n152), .B1(n132), .B2(n141), .ZN(n120)
         );
  NOR2V1_7TV50 U173 ( .A1(n142), .A2(n104), .ZN(n132) );
  NOR2V1_7TV50 U174 ( .A1(n150), .A2(n151), .ZN(n137) );
  NOR2V1_7TV50 U175 ( .A1(n105), .A2(n100), .ZN(n150) );
  CLKNAND2V1_7TV50 U176 ( .A1(n127), .A2(n155), .ZN(n121) );
  NOR2V1_7TV50 U177 ( .A1(n101), .A2(n119), .ZN(n147) );
  AOI211V1_7TV50 U178 ( .A1(n149), .A2(n131), .B(n118), .C(n117), .ZN(n125) );
  OAI22V1_7TV50 U179 ( .A1(n128), .A2(n156), .B1(n102), .B2(n154), .ZN(n117)
         );
  NOR4V1_7TV50 U180 ( .A1(spibr[2]), .A2(spibr[0]), .A3(spibr[1]), .A4(n100), 
        .ZN(n118) );
  NOR2XBV1_7TV50 U181 ( .A1(n119), .B1(n148), .ZN(n149) );
  AO33V1_7TV50 U182 ( .A1(n155), .A2(n143), .A3(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .B1(n141), .B2(n104), 
        .B3(n142), .Z(n116) );
  NOR2XBV1_7TV50 U183 ( .A1(spibr[0]), .B1(spibr[4]), .ZN(n142) );
  NOR2V1_7TV50 U184 ( .A1(spibr[4]), .A2(n105), .ZN(n128) );
  NAND2XBV1_7TV50 U185 ( .A1(spibr[4]), .B1(spibr[1]), .ZN(n141) );
  OAI21V1_7TV50 U186 ( .A1(spibr[0]), .A2(spibr[1]), .B(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .ZN(n143) );
  NOR4V1_7TV50 U187 ( .A1(spibr[2]), .A2(spibr[4]), .A3(spibr[0]), .A4(
        spibr[1]), .ZN(n115) );
  INV0P7_7TV50 U188 ( .I(\inst_spi_slave/n9 ), .ZN(n96) );
  AOI22BBV1_7TV50 U189 ( .B1(\inst_spi_master/clk_cnt [0]), .B2(n115), .A1(
        \inst_spi_master/clk_cnt [0]), .A2(n115), .ZN(n165) );
  AOI22BBV1_7TV50 U190 ( .B1(\inst_spi_master/clk_cnt [1]), .B2(n116), .A1(
        \inst_spi_master/clk_cnt [1]), .A2(n116), .ZN(n164) );
  AOI22BBV1_7TV50 U191 ( .B1(\inst_spi_master/add_113/carry [4]), .B2(
        \inst_spi_master/sck_edge_cnt [4]), .A1(
        \inst_spi_master/add_113/carry [4]), .A2(
        \inst_spi_master/sck_edge_cnt [4]), .ZN(\inst_spi_master/N34 ) );
  AOI22BBV1_7TV50 U192 ( .B1(\inst_spi_slave/add_80/carry [4]), .B2(
        \inst_spi_slave/sck_edge_cnt [4]), .A1(
        \inst_spi_slave/add_80/carry [4]), .A2(
        \inst_spi_slave/sck_edge_cnt [4]), .ZN(\inst_spi_slave/N23 ) );
endmodule

