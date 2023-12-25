/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Dec 19 23:17:10 2023
/////////////////////////////////////////////////////////////


module spi_ms ( clk, rst_n, sfraddr_w, sfraddr_r, sfrwe, spssn_i, spidata_i, 
        mosi, miso, sck, ssn, spssn_o, sfr_data_o, intspi, SPC0 );
  input [2:0] sfraddr_w;
  input [2:0] sfraddr_r;
  input [7:0] spssn_i;
  input [7:0] spidata_i;
  output [7:0] spssn_o;
  output [7:0] sfr_data_o;
  input clk, rst_n, sfrwe, ssn;
  output intspi, SPC0;
  inout mosi,  miso,  sck;
  wire   n616, sck_m, mosi_m, miso_s, rst_n_sync, rst_n_sync_pre,
         data_finish_m, data_finish_s, N77, N78, N79, N80, N81, N82, N83, N84,
         n1, n19, n20, n31, n32, n43, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n94, n97, n98, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, \inst_spi_master/n124 , \inst_spi_master/n123 ,
         \inst_spi_master/n122 , \inst_spi_master/n121 ,
         \inst_spi_master/n120 , \inst_spi_master/n119 ,
         \inst_spi_master/n118 , \inst_spi_master/n115 ,
         \inst_spi_master/n114 , \inst_spi_master/n113 ,
         \inst_spi_master/n112 , \inst_spi_master/n111 , \inst_spi_master/n76 ,
         \inst_spi_master/n75 , \inst_spi_master/n60 , \inst_spi_master/n59 ,
         \inst_spi_master/n58 , \inst_spi_master/n57 , \inst_spi_master/n56 ,
         \inst_spi_master/n55 , \inst_spi_master/n52 , \inst_spi_master/n51 ,
         \inst_spi_master/n50 , \inst_spi_master/n49 , \inst_spi_master/n48 ,
         \inst_spi_master/n47 , \inst_spi_master/n46 , \inst_spi_master/n45 ,
         \inst_spi_master/n44 , \inst_spi_master/n42 , \inst_spi_master/n41 ,
         \inst_spi_master/n40 , \inst_spi_master/n39 , \inst_spi_master/n36 ,
         \inst_spi_master/n35 , \inst_spi_master/n34 , \inst_spi_master/n33 ,
         \inst_spi_master/n32 , \inst_spi_master/n31 , \inst_spi_master/n30 ,
         \inst_spi_master/n29 , \inst_spi_master/n28 , \inst_spi_master/n27 ,
         \inst_spi_master/n25 , \inst_spi_master/n24 , \inst_spi_master/n23 ,
         \inst_spi_master/n22 , \inst_spi_master/n21 , \inst_spi_master/n20 ,
         \inst_spi_master/n19 , \inst_spi_master/n18 , \inst_spi_master/n17 ,
         \inst_spi_master/n16 , \inst_spi_master/n15 , \inst_spi_master/n14 ,
         \inst_spi_master/n13 , \inst_spi_master/n11 , \inst_spi_master/n10 ,
         \inst_spi_master/n9 , \inst_spi_master/n8 , \inst_spi_master/n7 ,
         \inst_spi_master/n5 , \inst_spi_master/n4 , \inst_spi_master/n2 ,
         \inst_spi_master/n1 , \inst_spi_master/N152 ,
         \inst_spi_master/tr_done , \inst_spi_master/tr_done_dly1 ,
         \inst_spi_master/N34 , \inst_spi_master/N33 , \inst_spi_master/N32 ,
         \inst_spi_master/N31 , \inst_spi_master/sck_edge_level ,
         \inst_spi_master/N25 , \inst_spi_master/N24 , \inst_spi_master/N23 ,
         \inst_spi_master/N22 , \inst_spi_master/N21 , \inst_spi_master/N20 ,
         \inst_spi_master/N19 , \inst_spi_master/N18 , \inst_spi_master/N15 ,
         \inst_spi_slave/n83 , \inst_spi_slave/n82 , \inst_spi_slave/n81 ,
         \inst_spi_slave/n80 , \inst_spi_slave/n79 , \inst_spi_slave/n78 ,
         \inst_spi_slave/n77 , \inst_spi_slave/n76 , \inst_spi_slave/n75 ,
         \inst_spi_slave/n74 , \inst_spi_slave/n73 , \inst_spi_slave/n72 ,
         \inst_spi_slave/n71 , \inst_spi_slave/n70 , \inst_spi_slave/n69 ,
         \inst_spi_slave/n68 , \inst_spi_slave/n67 , \inst_spi_slave/n66 ,
         \inst_spi_slave/n65 , \inst_spi_slave/n64 , \inst_spi_slave/n63 ,
         \inst_spi_slave/n62 , \inst_spi_slave/n61 , \inst_spi_slave/n60 ,
         \inst_spi_slave/n59 , \inst_spi_slave/n58 , \inst_spi_slave/n57 ,
         \inst_spi_slave/n56 , \inst_spi_slave/n55 , \inst_spi_slave/n54 ,
         \inst_spi_slave/n53 , \inst_spi_slave/n52 , \inst_spi_slave/n51 ,
         \inst_spi_slave/n50 , \inst_spi_slave/n49 , \inst_spi_slave/n48 ,
         \inst_spi_slave/n47 , \inst_spi_slave/n46 , \inst_spi_slave/n45 ,
         \inst_spi_slave/n44 , \inst_spi_slave/n43 , \inst_spi_slave/n42 ,
         \inst_spi_slave/n41 , \inst_spi_slave/n40 , \inst_spi_slave/N123 ,
         \inst_spi_slave/N23 , \inst_spi_slave/N22 , \inst_spi_slave/N21 ,
         \inst_spi_slave/N20 , \inst_spi_slave/sck_dly1 ,
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
         \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 , n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739;
  wire   [7:1] SPICR2;
  wire   [7:0] SPICR1;
  wire   [7:0] SPIDR1;
  wire   [7:0] SPIBR;
  wire   [7:0] SPIDR2_m;
  wire   [7:0] SPIDR2_s;
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

  DFFSR rst_n_sync_pre_reg ( .D(1'b1), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        rst_n_sync_pre) );
  AOI22X1 U6 ( .A(n179), .B(n529), .C(n553), .D(n1), .Y(n143) );
  AOI22X1 U8 ( .A(n179), .B(n528), .C(n552), .D(n1), .Y(n144) );
  AOI22X1 U10 ( .A(n179), .B(n527), .C(n476), .D(n1), .Y(n145) );
  AOI22X1 U12 ( .A(n179), .B(n526), .C(n347), .D(n1), .Y(n146) );
  AOI22X1 U14 ( .A(n179), .B(n525), .C(n463), .D(n1), .Y(n147) );
  AOI22X1 U16 ( .A(n179), .B(n524), .C(n425), .D(n1), .Y(n148) );
  AOI22X1 U18 ( .A(n179), .B(n523), .C(n427), .D(n1), .Y(n149) );
  AOI22X1 U20 ( .A(n179), .B(n522), .C(n349), .D(n1), .Y(n150) );
  AOI22X1 U24 ( .A(n178), .B(n529), .C(n398), .D(n20), .Y(n151) );
  AOI22X1 U26 ( .A(n178), .B(n528), .C(n368), .D(n20), .Y(n152) );
  AOI22X1 U28 ( .A(n178), .B(n527), .C(n351), .D(n20), .Y(n153) );
  AOI22X1 U30 ( .A(n178), .B(n526), .C(n353), .D(n20), .Y(n154) );
  AOI22X1 U32 ( .A(n178), .B(n525), .C(n355), .D(n20), .Y(n155) );
  AOI22X1 U34 ( .A(n178), .B(n524), .C(n357), .D(n20), .Y(n156) );
  AOI22X1 U36 ( .A(n178), .B(n523), .C(n359), .D(n20), .Y(n157) );
  AOI22X1 U38 ( .A(n178), .B(n522), .C(n361), .D(n20), .Y(n158) );
  AOI22X1 U42 ( .A(n177), .B(n529), .C(n366), .D(n32), .Y(n159) );
  AOI22X1 U44 ( .A(n177), .B(n528), .C(n549), .D(n32), .Y(n160) );
  AOI22X1 U46 ( .A(n177), .B(n527), .C(n468), .D(n32), .Y(n161) );
  AOI22X1 U48 ( .A(n177), .B(n526), .C(n370), .D(n32), .Y(n162) );
  AOI22X1 U50 ( .A(n177), .B(n525), .C(n480), .D(n32), .Y(n163) );
  AOI22X1 U51 ( .A(n177), .B(n524), .C(n372), .D(n32), .Y(n164) );
  AOI22X1 U53 ( .A(n177), .B(n523), .C(n400), .D(n32), .Y(n165) );
  AOI22X1 U55 ( .A(n177), .B(n522), .C(n374), .D(n32), .Y(n166) );
  NAND3X1 U59 ( .A(sfrwe), .B(n492), .C(n493), .Y(n31) );
  AOI22X1 U61 ( .A(n176), .B(n529), .C(n444), .D(n43), .Y(n167) );
  AOI22X1 U64 ( .A(n176), .B(n528), .C(n452), .D(n43), .Y(n168) );
  AOI22X1 U67 ( .A(n176), .B(n527), .C(n446), .D(n43), .Y(n169) );
  AOI22X1 U70 ( .A(n176), .B(n526), .C(n454), .D(n43), .Y(n170) );
  AOI22X1 U73 ( .A(n176), .B(n525), .C(n448), .D(n43), .Y(n171) );
  AOI22X1 U76 ( .A(n176), .B(n524), .C(n456), .D(n43), .Y(n172) );
  AOI22X1 U79 ( .A(n176), .B(n523), .C(n450), .D(n43), .Y(n173) );
  AOI22X1 U82 ( .A(n176), .B(n522), .C(n545), .D(n43), .Y(n174) );
  NAND3X1 U87 ( .A(sfrwe), .B(sfraddr_w[1]), .C(n492), .Y(n19) );
  NAND3X1 U94 ( .A(n297), .B(n308), .C(n320), .Y(N84) );
  AOI22X1 U95 ( .A(n56), .B(n482), .C(n57), .D(n375), .Y(n55) );
  AOI22X1 U96 ( .A(n486), .B(n350), .C(n488), .D(n397), .Y(n54) );
  AOI22X1 U97 ( .A(n60), .B(n362), .C(n487), .D(n396), .Y(n53) );
  NAND3X1 U98 ( .A(n296), .B(n307), .C(n319), .Y(N83) );
  AOI22X1 U99 ( .A(n56), .B(n451), .C(n57), .D(n401), .Y(n64) );
  AOI22X1 U100 ( .A(n486), .B(n428), .C(n488), .D(n424), .Y(n63) );
  AOI22X1 U101 ( .A(n60), .B(n360), .C(n487), .D(n419), .Y(n62) );
  NAND3X1 U102 ( .A(n295), .B(n306), .C(n318), .Y(N82) );
  AOI22X1 U103 ( .A(n56), .B(n457), .C(n57), .D(n373), .Y(n67) );
  AOI22X1 U104 ( .A(n486), .B(n426), .C(n488), .D(n423), .Y(n66) );
  AOI22X1 U105 ( .A(n60), .B(n358), .C(n487), .D(n418), .Y(n65) );
  NAND3X1 U106 ( .A(n294), .B(n305), .C(n317), .Y(N81) );
  AOI22X1 U107 ( .A(n56), .B(n449), .C(n481), .D(n57), .Y(n70) );
  AOI22X1 U108 ( .A(n486), .B(n464), .C(n488), .D(n422), .Y(n69) );
  AOI22X1 U109 ( .A(n60), .B(n356), .C(n487), .D(n417), .Y(n68) );
  NAND3X1 U110 ( .A(n293), .B(n304), .C(n316), .Y(N80) );
  AOI22X1 U111 ( .A(n56), .B(n455), .C(n57), .D(n371), .Y(n73) );
  AOI22X1 U112 ( .A(n486), .B(n348), .C(n488), .D(n421), .Y(n72) );
  AOI22X1 U113 ( .A(n60), .B(n354), .C(n487), .D(n416), .Y(n71) );
  NAND3X1 U114 ( .A(n292), .B(n303), .C(n315), .Y(N79) );
  AOI22X1 U115 ( .A(n56), .B(n447), .C(n57), .D(n469), .Y(n76) );
  AOI22X1 U116 ( .A(n486), .B(n477), .C(n488), .D(n420), .Y(n75) );
  AOI22X1 U117 ( .A(n60), .B(n352), .C(n487), .D(n415), .Y(n74) );
  AOI21X1 U119 ( .A(n453), .B(n56), .C(n291), .Y(n78) );
  AOI22X1 U121 ( .A(n488), .B(n411), .C(n57), .D(n485), .Y(n81) );
  AOI22X1 U122 ( .A(n487), .B(n414), .C(n486), .D(n490), .Y(n80) );
  AOI22X1 U123 ( .A(n391), .B(n301), .C(n60), .D(n369), .Y(n77) );
  AOI21X1 U125 ( .A(n56), .B(n445), .C(n290), .Y(n84) );
  AOI22X1 U127 ( .A(n488), .B(n412), .C(n367), .D(n57), .Y(n87) );
  NOR3X1 U128 ( .A(sfraddr_r[1]), .B(sfraddr_r[2]), .C(sfraddr_r[0]), .Y(n57)
         );
  AOI22X1 U131 ( .A(n487), .B(n413), .C(n489), .D(n486), .Y(n86) );
  AOI22X1 U137 ( .A(n302), .B(n391), .C(SPC0), .D(n60), .Y(n83) );
  NOR3X1 U138 ( .A(sfraddr_r[1]), .B(sfraddr_r[2]), .C(n496), .Y(n60) );
  MUX2X1 \inst_spi_master/U129  ( .B(n445), .A(n453), .S(n483), .Y(
        \inst_spi_master/n123 ) );
  MUX2X1 \inst_spi_master/U128  ( .B(n447), .A(n455), .S(n483), .Y(
        \inst_spi_master/n124 ) );
  MUX2X1 \inst_spi_master/U127  ( .B(\inst_spi_master/n123 ), .A(
        \inst_spi_master/n124 ), .S(n479), .Y(\inst_spi_master/n119 ) );
  MUX2X1 \inst_spi_master/U126  ( .B(n449), .A(n457), .S(n483), .Y(
        \inst_spi_master/n121 ) );
  MUX2X1 \inst_spi_master/U125  ( .B(n451), .A(n482), .S(n483), .Y(
        \inst_spi_master/n122 ) );
  MUX2X1 \inst_spi_master/U124  ( .B(\inst_spi_master/n121 ), .A(
        \inst_spi_master/n122 ), .S(n479), .Y(\inst_spi_master/n120 ) );
  MUX2X1 \inst_spi_master/U123  ( .B(\inst_spi_master/n119 ), .A(
        \inst_spi_master/n120 ), .S(n431), .Y(\inst_spi_master/n118 ) );
  NAND3X1 \inst_spi_master/U93  ( .A(spssn_o[7]), .B(spssn_o[6]), .C(
        \inst_spi_master/n60 ), .Y(\inst_spi_master/n57 ) );
  NAND3X1 \inst_spi_master/U91  ( .A(spssn_o[3]), .B(spssn_o[2]), .C(
        \inst_spi_master/n59 ), .Y(\inst_spi_master/n58 ) );
  OAI21X1 \inst_spi_master/U90  ( .A(n300), .B(n311), .C(n401), .Y(
        \inst_spi_master/n4 ) );
  NOR3X1 \inst_spi_master/U88  ( .A(n435), .B(n437), .C(n439), .Y(
        \inst_spi_master/n51 ) );
  NAND3X1 \inst_spi_master/U87  ( .A(n471), .B(n462), .C(\inst_spi_master/n51 ), .Y(\inst_spi_master/n56 ) );
  NAND3X1 \inst_spi_master/U84  ( .A(n384), .B(n512), .C(\inst_spi_master/N15 ), .Y(\inst_spi_master/n55 ) );
  NAND3X1 \inst_spi_master/U79  ( .A(n472), .B(n405), .C(n554), .Y(
        \inst_spi_master/n8 ) );
  OAI21X1 \inst_spi_master/U78  ( .A(\inst_spi_master/n51 ), .B(n554), .C(n471), .Y(\inst_spi_master/n52 ) );
  AOI21X1 \inst_spi_master/U77  ( .A(\inst_spi_master/n51 ), .B(n554), .C(
        \inst_spi_master/n52 ), .Y(\inst_spi_master/n36 ) );
  AOI22X1 \inst_spi_master/U74  ( .A(n485), .B(n395), .C(n393), .D(n549), .Y(
        \inst_spi_master/n42 ) );
  AOI22X1 \inst_spi_master/U71  ( .A(n483), .B(n409), .C(n485), .D(
        \inst_spi_master/n4 ), .Y(\inst_spi_master/n50 ) );
  OAI21X1 \inst_spi_master/U70  ( .A(\inst_spi_master/n4 ), .B(
        \inst_spi_master/n48 ), .C(n277), .Y(\inst_spi_master/n114 ) );
  AOI21X1 \inst_spi_master/U69  ( .A(n479), .B(\inst_spi_master/n48 ), .C(
        \inst_spi_master/n4 ), .Y(\inst_spi_master/n49 ) );
  OAI21X1 \inst_spi_master/U68  ( .A(n479), .B(\inst_spi_master/n48 ), .C(n284), .Y(\inst_spi_master/n113 ) );
  AOI21X1 \inst_spi_master/U66  ( .A(n431), .B(\inst_spi_master/n46 ), .C(
        \inst_spi_master/n4 ), .Y(\inst_spi_master/n47 ) );
  OAI21X1 \inst_spi_master/U65  ( .A(n431), .B(\inst_spi_master/n46 ), .C(n283), .Y(\inst_spi_master/n112 ) );
  OAI21X1 \inst_spi_master/U63  ( .A(n409), .B(n314), .C(n342), .Y(
        \inst_spi_master/n39 ) );
  NAND3X1 \inst_spi_master/U61  ( .A(n512), .B(n386), .C(n546), .Y(
        \inst_spi_master/n40 ) );
  NAND3X1 \inst_spi_master/U60  ( .A(n482), .B(\inst_spi_master/n4 ), .C(n549), 
        .Y(\inst_spi_master/n41 ) );
  NAND3X1 \inst_spi_master/U59  ( .A(\inst_spi_master/n39 ), .B(n310), .C(n321), .Y(\inst_spi_master/n111 ) );
  OAI21X1 \inst_spi_master/U58  ( .A(n485), .B(n554), .C(n405), .Y(
        \inst_spi_master/n34 ) );
  AOI22X1 \inst_spi_master/U57  ( .A(n485), .B(n376), .C(n472), .D(n549), .Y(
        \inst_spi_master/n35 ) );
  NOR3X1 \inst_spi_master/U56  ( .A(\inst_spi_master/n4 ), .B(
        \inst_spi_master/n34 ), .C(n322), .Y(\inst_spi_master/n25 ) );
  MUX2X1 \inst_spi_master/U54  ( .B(n412), .A(n411), .S(n521), .Y(
        \inst_spi_master/n33 ) );
  AOI22X1 \inst_spi_master/U52  ( .A(\inst_spi_master/n25 ), .B(miso_m), .C(
        n412), .D(n521), .Y(\inst_spi_master/n32 ) );
  AOI22X1 \inst_spi_master/U50  ( .A(\inst_spi_master/n25 ), .B(n424), .C(n397), .D(n521), .Y(\inst_spi_master/n31 ) );
  AOI22X1 \inst_spi_master/U48  ( .A(\inst_spi_master/n25 ), .B(n423), .C(n424), .D(n521), .Y(\inst_spi_master/n30 ) );
  AOI22X1 \inst_spi_master/U46  ( .A(\inst_spi_master/n25 ), .B(n422), .C(n423), .D(n521), .Y(\inst_spi_master/n29 ) );
  AOI22X1 \inst_spi_master/U44  ( .A(\inst_spi_master/n25 ), .B(n421), .C(n422), .D(n521), .Y(\inst_spi_master/n28 ) );
  AOI22X1 \inst_spi_master/U42  ( .A(\inst_spi_master/n25 ), .B(n420), .C(n421), .D(n521), .Y(\inst_spi_master/n27 ) );
  AOI22X1 \inst_spi_master/U40  ( .A(\inst_spi_master/n25 ), .B(n411), .C(n420), .D(n521), .Y(\inst_spi_master/n24 ) );
  AOI22X1 \inst_spi_master/U36  ( .A(n437), .B(n474), .C(n511), .D(
        \inst_spi_master/N33 ), .Y(\inst_spi_master/n23 ) );
  AOI22X1 \inst_spi_master/U34  ( .A(n439), .B(n474), .C(n511), .D(
        \inst_spi_master/N32 ), .Y(\inst_spi_master/n22 ) );
  AOI22X1 \inst_spi_master/U32  ( .A(n435), .B(n474), .C(n511), .D(
        \inst_spi_master/N31 ), .Y(\inst_spi_master/n21 ) );
  AOI22X1 \inst_spi_master/U30  ( .A(n512), .B(n363), .C(n433), .D(
        \inst_spi_master/n4 ), .Y(\inst_spi_master/n20 ) );
  AOI22X1 \inst_spi_master/U28  ( .A(n512), .B(\inst_spi_master/N19 ), .C(n458), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n19 ) );
  AOI22X1 \inst_spi_master/U26  ( .A(n512), .B(\inst_spi_master/N20 ), .C(n440), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n18 ) );
  AOI22X1 \inst_spi_master/U24  ( .A(n512), .B(\inst_spi_master/N21 ), .C(n441), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n17 ) );
  AOI22X1 \inst_spi_master/U22  ( .A(n512), .B(\inst_spi_master/N22 ), .C(n459), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n16 ) );
  AOI22X1 \inst_spi_master/U20  ( .A(n512), .B(\inst_spi_master/N23 ), .C(n432), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n15 ) );
  AOI22X1 \inst_spi_master/U18  ( .A(n512), .B(\inst_spi_master/N24 ), .C(n460), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n14 ) );
  AOI22X1 \inst_spi_master/U16  ( .A(n512), .B(\inst_spi_master/N25 ), .C(n429), .D(\inst_spi_master/n4 ), .Y(\inst_spi_master/n13 ) );
  AOI22X1 \inst_spi_master/U11  ( .A(n472), .B(n474), .C(n511), .D(n471), .Y(
        \inst_spi_master/n11 ) );
  AOI22X1 \inst_spi_master/U9  ( .A(n462), .B(n474), .C(n511), .D(
        \inst_spi_master/N34 ), .Y(\inst_spi_master/n9 ) );
  NAND3X1 \inst_spi_master/U7  ( .A(n512), .B(n393), .C(n395), .Y(
        \inst_spi_master/n5 ) );
  AOI22X1 \inst_spi_master/U4  ( .A(n407), .B(n497), .C(n469), .D(
        \inst_spi_master/n4 ), .Y(\inst_spi_master/n2 ) );
  OAI21X1 \inst_spi_master/U3  ( .A(n407), .B(n313), .C(n276), .Y(
        \inst_spi_master/n115 ) );
  DFFSR \inst_spi_master/bit_count_reg[2]  ( .D(\inst_spi_master/n112 ), .CLK(
        clk), .R(1'b1), .S(n215), .Q(\inst_spi_master/bit_count [2]) );
  DFFSR \inst_spi_master/bit_count_reg[1]  ( .D(\inst_spi_master/n113 ), .CLK(
        clk), .R(1'b1), .S(n215), .Q(\inst_spi_master/bit_count [1]) );
  DFFSR \inst_spi_master/bit_count_reg[0]  ( .D(\inst_spi_master/n114 ), .CLK(
        clk), .R(1'b1), .S(n215), .Q(\inst_spi_master/bit_count [0]) );
  DFFSR \inst_spi_master/sck_reg  ( .D(\inst_spi_master/n115 ), .CLK(clk), .R(
        \inst_spi_master/n75 ), .S(n329), .Q(sck_m) );
  DFFSR \inst_spi_master/clk_cnt_reg[0]  ( .D(n505), .CLK(clk), .R(1'b1), .S(
        n215), .Q(\inst_spi_master/clk_cnt [0]) );
  MUX2X1 \inst_spi_slave/U86  ( .B(n445), .A(n453), .S(n484), .Y(
        \inst_spi_slave/n82 ) );
  MUX2X1 \inst_spi_slave/U85  ( .B(n447), .A(n455), .S(n484), .Y(
        \inst_spi_slave/n83 ) );
  MUX2X1 \inst_spi_slave/U84  ( .B(\inst_spi_slave/n82 ), .A(
        \inst_spi_slave/n83 ), .S(n478), .Y(\inst_spi_slave/n78 ) );
  MUX2X1 \inst_spi_slave/U83  ( .B(n449), .A(n457), .S(n484), .Y(
        \inst_spi_slave/n80 ) );
  MUX2X1 \inst_spi_slave/U82  ( .B(n451), .A(n482), .S(n484), .Y(
        \inst_spi_slave/n81 ) );
  MUX2X1 \inst_spi_slave/U81  ( .B(\inst_spi_slave/n80 ), .A(
        \inst_spi_slave/n81 ), .S(n478), .Y(\inst_spi_slave/n79 ) );
  MUX2X1 \inst_spi_slave/U80  ( .B(\inst_spi_slave/n78 ), .A(
        \inst_spi_slave/n79 ), .S(n430), .Y(\inst_spi_slave/n77 ) );
  NOR3X1 \inst_spi_slave/U79  ( .A(n434), .B(n436), .C(n438), .Y(
        \inst_spi_slave/n73 ) );
  NAND3X1 \inst_spi_slave/U78  ( .A(n465), .B(\inst_spi_slave/n73 ), .C(n466), 
        .Y(\inst_spi_slave/n72 ) );
  XNOR2X1 \inst_spi_slave/U75  ( .A(n331), .B(sck_s), .Y(\inst_spi_slave/n63 )
         );
  AOI22X1 \inst_spi_slave/U72  ( .A(n467), .B(n473), .C(n475), .D(n466), .Y(
        \inst_spi_slave/n70 ) );
  AOI22X1 \inst_spi_slave/U71  ( .A(n465), .B(n473), .C(n475), .D(
        \inst_spi_slave/N23 ), .Y(\inst_spi_slave/n69 ) );
  AOI22X1 \inst_spi_slave/U70  ( .A(n434), .B(n473), .C(n475), .D(
        \inst_spi_slave/N20 ), .Y(\inst_spi_slave/n68 ) );
  AOI22X1 \inst_spi_slave/U69  ( .A(n438), .B(n473), .C(n475), .D(
        \inst_spi_slave/N21 ), .Y(\inst_spi_slave/n67 ) );
  AOI22X1 \inst_spi_slave/U68  ( .A(n436), .B(n473), .C(n475), .D(
        \inst_spi_slave/N22 ), .Y(\inst_spi_slave/n64 ) );
  NOR3X1 \inst_spi_slave/U67  ( .A(ssn), .B(n465), .C(\inst_spi_slave/n63 ), 
        .Y(\inst_spi_slave/n53 ) );
  MUX2X1 \inst_spi_slave/U66  ( .B(n549), .A(n485), .S(n467), .Y(
        \inst_spi_slave/n52 ) );
  AOI22X1 \inst_spi_slave/U64  ( .A(\inst_spi_slave/n55 ), .B(mosi_s), .C(n413), .D(n175), .Y(\inst_spi_slave/n62 ) );
  AOI22X1 \inst_spi_slave/U63  ( .A(\inst_spi_slave/n55 ), .B(n413), .C(n414), 
        .D(n175), .Y(\inst_spi_slave/n61 ) );
  AOI22X1 \inst_spi_slave/U62  ( .A(\inst_spi_slave/n55 ), .B(n414), .C(n415), 
        .D(n175), .Y(\inst_spi_slave/n60 ) );
  AOI22X1 \inst_spi_slave/U61  ( .A(\inst_spi_slave/n55 ), .B(n415), .C(n416), 
        .D(n175), .Y(\inst_spi_slave/n59 ) );
  AOI22X1 \inst_spi_slave/U60  ( .A(\inst_spi_slave/n55 ), .B(n416), .C(n417), 
        .D(n175), .Y(\inst_spi_slave/n58 ) );
  AOI22X1 \inst_spi_slave/U59  ( .A(\inst_spi_slave/n55 ), .B(n417), .C(n418), 
        .D(n175), .Y(\inst_spi_slave/n57 ) );
  AOI22X1 \inst_spi_slave/U58  ( .A(\inst_spi_slave/n55 ), .B(n418), .C(n419), 
        .D(n175), .Y(\inst_spi_slave/n56 ) );
  AOI22X1 \inst_spi_slave/U57  ( .A(\inst_spi_slave/n55 ), .B(n419), .C(n396), 
        .D(n175), .Y(\inst_spi_slave/n54 ) );
  AOI22X1 \inst_spi_slave/U55  ( .A(ssn), .B(n485), .C(\inst_spi_slave/n51 ), 
        .D(n484), .Y(\inst_spi_slave/n50 ) );
  OAI21X1 \inst_spi_slave/U54  ( .A(ssn), .B(\inst_spi_slave/n48 ), .C(n275), 
        .Y(\inst_spi_slave/n76 ) );
  AOI21X1 \inst_spi_slave/U53  ( .A(n478), .B(\inst_spi_slave/n48 ), .C(ssn), 
        .Y(\inst_spi_slave/n49 ) );
  OAI21X1 \inst_spi_slave/U52  ( .A(n478), .B(\inst_spi_slave/n48 ), .C(n282), 
        .Y(\inst_spi_slave/n75 ) );
  AOI21X1 \inst_spi_slave/U51  ( .A(n430), .B(\inst_spi_slave/n46 ), .C(ssn), 
        .Y(\inst_spi_slave/n47 ) );
  OAI21X1 \inst_spi_slave/U50  ( .A(n430), .B(\inst_spi_slave/n46 ), .C(n281), 
        .Y(\inst_spi_slave/n74 ) );
  NAND3X1 \inst_spi_slave/U49  ( .A(n482), .B(n549), .C(ssn), .Y(
        \inst_spi_slave/n45 ) );
  OAI21X1 \inst_spi_slave/U48  ( .A(ssn), .B(\inst_spi_slave/n77 ), .C(n280), 
        .Y(\inst_spi_slave/n41 ) );
  MUX2X1 \inst_spi_slave/U45  ( .B(n346), .A(\inst_spi_slave/n41 ), .S(n330), 
        .Y(\inst_spi_slave/n40 ) );
  DFFSR \inst_spi_slave/bit_count_reg[2]  ( .D(\inst_spi_slave/n74 ), .CLK(clk), .R(1'b1), .S(n215), .Q(\inst_spi_slave/bit_count [2]) );
  DFFSR \inst_spi_slave/bit_count_reg[1]  ( .D(\inst_spi_slave/n75 ), .CLK(clk), .R(1'b1), .S(n215), .Q(\inst_spi_slave/bit_count [1]) );
  DFFSR \inst_spi_slave/bit_count_reg[0]  ( .D(\inst_spi_slave/n76 ), .CLK(clk), .R(1'b1), .S(n215), .Q(\inst_spi_slave/bit_count [0]) );
  HAX1 \inst_spi_slave/add_80/U1_1_1  ( .A(n434), .B(n467), .YC(
        \inst_spi_slave/add_80/carry [2]), .YS(\inst_spi_slave/N20 ) );
  HAX1 \inst_spi_slave/add_80/U1_1_2  ( .A(n438), .B(
        \inst_spi_slave/add_80/carry [2]), .YC(
        \inst_spi_slave/add_80/carry [3]), .YS(\inst_spi_slave/N21 ) );
  HAX1 \inst_spi_slave/add_80/U1_1_3  ( .A(n436), .B(
        \inst_spi_slave/add_80/carry [3]), .YC(
        \inst_spi_slave/add_80/carry [4]), .YS(\inst_spi_slave/N22 ) );
  HAX1 \inst_spi_master/add_113/U1_1_1  ( .A(n435), .B(n472), .YC(
        \inst_spi_master/add_113/carry [2]), .YS(\inst_spi_master/N31 ) );
  HAX1 \inst_spi_master/add_113/U1_1_2  ( .A(n439), .B(
        \inst_spi_master/add_113/carry [2]), .YC(
        \inst_spi_master/add_113/carry [3]), .YS(\inst_spi_master/N32 ) );
  HAX1 \inst_spi_master/add_113/U1_1_3  ( .A(n437), .B(
        \inst_spi_master/add_113/carry [3]), .YC(
        \inst_spi_master/add_113/carry [4]), .YS(\inst_spi_master/N33 ) );
  HAX1 \inst_spi_master/add_65_DP_OP_289_508_1/U168  ( .A(n426), .B(n464), 
        .YC(\inst_spi_master/add_65_DP_OP_289_508_1/n158 ), .YS(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ) );
  HAX1 \inst_spi_master/add_65_DP_OP_289_508_1/U167  ( .A(n428), .B(
        \inst_spi_master/add_65_DP_OP_289_508_1/n158 ), .YC(
        \inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .YS(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U7  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n14 ), .B(
        \inst_spi_master/N18 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n6 ), .YS(
        \inst_spi_master/N19 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U6  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n13 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n6 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n5 ), .YS(
        \inst_spi_master/N20 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U5  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n12 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n5 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n4 ), .YS(
        \inst_spi_master/N21 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U4  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n11 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n4 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n3 ), .YS(
        \inst_spi_master/N22 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U3  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n10 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n3 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n2 ), .YS(
        \inst_spi_master/N23 ) );
  HAX1 \inst_spi_master/add_88_aco_DP_OP_288_3930_2/U2  ( .A(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n9 ), .B(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n2 ), .YC(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 ), .YS(
        \inst_spi_master/N24 ) );
  AND2X1 \inst_spi_master/U94  ( .A(spssn_o[5]), .B(spssn_o[4]), .Y(
        \inst_spi_master/n60 ) );
  AND2X1 \inst_spi_master/U92  ( .A(spssn_o[1]), .B(spssn_o[0]), .Y(
        \inst_spi_master/n59 ) );
  OR2X1 \inst_spi_master/U72  ( .A(n409), .B(n483), .Y(\inst_spi_master/n48 )
         );
  OR2X1 \inst_spi_master/U67  ( .A(\inst_spi_master/n48 ), .B(n479), .Y(
        \inst_spi_master/n46 ) );
  AND2X1 \inst_spi_slave/U24  ( .A(intspi), .B(n365), .Y(\inst_spi_slave/n51 )
         );
  OR2X1 \inst_spi_slave/U23  ( .A(\inst_spi_slave/n51 ), .B(n484), .Y(
        \inst_spi_slave/n48 ) );
  OR2X1 \inst_spi_slave/U22  ( .A(\inst_spi_slave/n48 ), .B(n478), .Y(
        \inst_spi_slave/n46 ) );
  AND2X1 U135 ( .A(n496), .B(n344), .Y(n56) );
  OR2X1 \inst_spi_master/U14  ( .A(n469), .B(n215), .Y(\inst_spi_master/n75 )
         );
  TBUFX2 sck_s_tri ( .A(n94), .EN(n480), .Y(sck_s) );
  TBUFX2 mosi_tri ( .A(n341), .EN(n481), .Y(mosi) );
  TBUFX2 miso_tri ( .A(n555), .EN(n480), .Y(miso) );
  TBUFX2 sck_tri ( .A(n406), .EN(n481), .Y(sck) );
  TBUFX2 mosi_s_tri ( .A(n97), .EN(n480), .Y(mosi_s) );
  TBUFX2 miso_m_tri ( .A(n98), .EN(n481), .Y(miso_m) );
  OR2X1 U185 ( .A(n377), .B(n547), .Y(\inst_spi_slave/n65 ) );
  OR2X1 U186 ( .A(n480), .B(n379), .Y(n59) );
  OR2X1 U187 ( .A(\inst_spi_slave/n63 ), .B(n377), .Y(\inst_spi_slave/n66 ) );
  OR2X1 U188 ( .A(n496), .B(n378), .Y(n82) );
  OR2X1 U189 ( .A(sfraddr_r[0]), .B(n378), .Y(n58) );
  AND2X1 U190 ( .A(n221), .B(n226), .Y(n85) );
  OR2X1 U191 ( .A(n481), .B(n379), .Y(n61) );
  AND2X1 U192 ( .A(n224), .B(n365), .Y(\inst_spi_slave/n42 ) );
  AND2X1 U193 ( .A(n222), .B(n227), .Y(n79) );
  AND2X1 U194 ( .A(n220), .B(n228), .Y(n609) );
  AND2X1 U195 ( .A(n344), .B(sfraddr_r[0]), .Y(n88) );
  AND2X1 U196 ( .A(intspi), .B(n345), .Y(\inst_spi_slave/n71 ) );
  AND2X1 U197 ( .A(n223), .B(n225), .Y(n582) );
  OR2X1 U198 ( .A(n339), .B(n289), .Y(data_finish_m) );
  OR2X1 U199 ( .A(\inst_spi_master/n4 ), .B(n386), .Y(\inst_spi_master/n44 )
         );
  AND2X1 U200 ( .A(n405), .B(n376), .Y(\inst_spi_master/n7 ) );
  AND2X1 U201 ( .A(\inst_spi_slave/n53 ), .B(n548), .Y(\inst_spi_slave/n55 )
         );
  INVX1 U202 ( .A(\inst_spi_slave/n55 ), .Y(n175) );
  OR2X1 U203 ( .A(n494), .B(n380), .Y(n43) );
  INVX1 U204 ( .A(n43), .Y(n176) );
  OR2X1 U205 ( .A(sfraddr_w[0]), .B(n381), .Y(n32) );
  INVX1 U206 ( .A(n32), .Y(n177) );
  OR2X1 U207 ( .A(n494), .B(n381), .Y(n20) );
  INVX1 U208 ( .A(n20), .Y(n178) );
  OR2X1 U209 ( .A(sfraddr_w[0]), .B(n380), .Y(n1) );
  INVX1 U210 ( .A(n1), .Y(n179) );
  BUFX2 U211 ( .A(n561), .Y(n180) );
  BUFX2 U212 ( .A(n592), .Y(n181) );
  BUFX2 U213 ( .A(\inst_spi_slave/n54 ), .Y(n182) );
  BUFX2 U214 ( .A(\inst_spi_slave/n56 ), .Y(n183) );
  BUFX2 U215 ( .A(\inst_spi_slave/n57 ), .Y(n184) );
  BUFX2 U216 ( .A(\inst_spi_slave/n58 ), .Y(n185) );
  BUFX2 U217 ( .A(\inst_spi_slave/n59 ), .Y(n186) );
  BUFX2 U218 ( .A(\inst_spi_slave/n60 ), .Y(n187) );
  BUFX2 U219 ( .A(\inst_spi_slave/n61 ), .Y(n188) );
  BUFX2 U220 ( .A(\inst_spi_slave/n62 ), .Y(n189) );
  BUFX2 U221 ( .A(\inst_spi_slave/n64 ), .Y(n190) );
  BUFX2 U222 ( .A(\inst_spi_slave/n67 ), .Y(n191) );
  BUFX2 U223 ( .A(\inst_spi_slave/n68 ), .Y(n192) );
  BUFX2 U224 ( .A(\inst_spi_slave/n69 ), .Y(n193) );
  BUFX2 U225 ( .A(\inst_spi_slave/n70 ), .Y(n194) );
  BUFX2 U226 ( .A(\inst_spi_master/n9 ), .Y(n195) );
  BUFX2 U227 ( .A(\inst_spi_master/n11 ), .Y(n196) );
  BUFX2 U228 ( .A(\inst_spi_master/n13 ), .Y(n197) );
  BUFX2 U229 ( .A(\inst_spi_master/n14 ), .Y(n198) );
  BUFX2 U230 ( .A(\inst_spi_master/n15 ), .Y(n199) );
  BUFX2 U231 ( .A(\inst_spi_master/n16 ), .Y(n200) );
  BUFX2 U232 ( .A(\inst_spi_master/n17 ), .Y(n201) );
  BUFX2 U233 ( .A(\inst_spi_master/n18 ), .Y(n202) );
  BUFX2 U234 ( .A(\inst_spi_master/n19 ), .Y(n203) );
  BUFX2 U235 ( .A(\inst_spi_master/n20 ), .Y(n204) );
  BUFX2 U236 ( .A(\inst_spi_master/n21 ), .Y(n205) );
  BUFX2 U237 ( .A(\inst_spi_master/n22 ), .Y(n206) );
  BUFX2 U238 ( .A(\inst_spi_master/n23 ), .Y(n207) );
  BUFX2 U239 ( .A(\inst_spi_master/n24 ), .Y(n208) );
  BUFX2 U240 ( .A(\inst_spi_master/n27 ), .Y(n209) );
  BUFX2 U241 ( .A(\inst_spi_master/n28 ), .Y(n210) );
  BUFX2 U242 ( .A(\inst_spi_master/n29 ), .Y(n211) );
  BUFX2 U243 ( .A(\inst_spi_master/n30 ), .Y(n212) );
  BUFX2 U244 ( .A(\inst_spi_master/n31 ), .Y(n213) );
  BUFX2 U245 ( .A(\inst_spi_master/n32 ), .Y(n214) );
  BUFX2 U246 ( .A(rst_n_sync), .Y(n215) );
  BUFX2 U247 ( .A(n563), .Y(n216) );
  BUFX2 U248 ( .A(n593), .Y(n217) );
  BUFX2 U249 ( .A(n591), .Y(n218) );
  BUFX2 U250 ( .A(\inst_spi_master/n55 ), .Y(n219) );
  OR2X1 U251 ( .A(n326), .B(n327), .Y(n324) );
  OR2X1 U252 ( .A(n325), .B(n562), .Y(n327) );
  OR2X1 U253 ( .A(n335), .B(n336), .Y(n332) );
  OR2X1 U254 ( .A(n333), .B(n334), .Y(n336) );
  AND2X1 U255 ( .A(n601), .B(n383), .Y(n562) );
  BUFX2 U256 ( .A(n608), .Y(n220) );
  BUFX2 U257 ( .A(n86), .Y(n221) );
  BUFX2 U258 ( .A(n80), .Y(n222) );
  BUFX2 U259 ( .A(n581), .Y(n223) );
  AND2X1 U260 ( .A(ssn), .B(n549), .Y(\inst_spi_slave/n43 ) );
  INVX1 U261 ( .A(\inst_spi_slave/n43 ), .Y(n224) );
  BUFX2 U262 ( .A(n580), .Y(n225) );
  BUFX2 U263 ( .A(n87), .Y(n226) );
  BUFX2 U264 ( .A(n81), .Y(n227) );
  BUFX2 U265 ( .A(n607), .Y(n228) );
  INVX1 U306 ( .A(\inst_spi_slave/N123 ), .Y(n269) );
  OR2X1 U307 ( .A(ssn), .B(n345), .Y(\inst_spi_slave/N123 ) );
  INVX1 U308 ( .A(\inst_spi_master/N152 ), .Y(n270) );
  OR2X1 U309 ( .A(\inst_spi_master/n4 ), .B(n384), .Y(\inst_spi_master/N152 )
         );
  INVX1 U310 ( .A(N77), .Y(n271) );
  AND2X1 U311 ( .A(n287), .B(n285), .Y(N77) );
  INVX1 U312 ( .A(N78), .Y(n272) );
  AND2X1 U313 ( .A(n288), .B(n286), .Y(N78) );
  BUFX2 U314 ( .A(n557), .Y(n273) );
  BUFX2 U315 ( .A(n569), .Y(n274) );
  BUFX2 U316 ( .A(\inst_spi_slave/n50 ), .Y(n275) );
  BUFX2 U317 ( .A(\inst_spi_master/n2 ), .Y(n276) );
  BUFX2 U318 ( .A(\inst_spi_master/n50 ), .Y(n277) );
  BUFX2 U319 ( .A(n565), .Y(n278) );
  BUFX2 U320 ( .A(n584), .Y(n279) );
  BUFX2 U321 ( .A(\inst_spi_slave/n45 ), .Y(n280) );
  BUFX2 U322 ( .A(\inst_spi_slave/n47 ), .Y(n281) );
  BUFX2 U323 ( .A(\inst_spi_slave/n49 ), .Y(n282) );
  BUFX2 U324 ( .A(\inst_spi_master/n47 ), .Y(n283) );
  BUFX2 U325 ( .A(\inst_spi_master/n49 ), .Y(n284) );
  BUFX2 U326 ( .A(n84), .Y(n285) );
  BUFX2 U327 ( .A(n78), .Y(n286) );
  BUFX2 U328 ( .A(n83), .Y(n287) );
  BUFX2 U329 ( .A(n77), .Y(n288) );
  BUFX2 U330 ( .A(\inst_spi_master/tr_done_dly1 ), .Y(n289) );
  INVX1 U331 ( .A(n85), .Y(n290) );
  INVX1 U332 ( .A(n79), .Y(n291) );
  BUFX2 U333 ( .A(n74), .Y(n292) );
  BUFX2 U334 ( .A(n71), .Y(n293) );
  BUFX2 U335 ( .A(n68), .Y(n294) );
  BUFX2 U336 ( .A(n65), .Y(n295) );
  BUFX2 U337 ( .A(n62), .Y(n296) );
  BUFX2 U338 ( .A(n53), .Y(n297) );
  INVX1 U339 ( .A(n560), .Y(n298) );
  OR2X1 U340 ( .A(n606), .B(n404), .Y(n560) );
  INVX1 U341 ( .A(n577), .Y(n299) );
  OR2X1 U342 ( .A(n572), .B(n408), .Y(n577) );
  BUFX2 U343 ( .A(\inst_spi_master/n57 ), .Y(n300) );
  BUFX2 U344 ( .A(data_finish_s), .Y(n301) );
  INVX1 U345 ( .A(data_finish_m), .Y(n302) );
  BUFX2 U346 ( .A(n75), .Y(n303) );
  BUFX2 U347 ( .A(n72), .Y(n304) );
  BUFX2 U348 ( .A(n69), .Y(n305) );
  BUFX2 U349 ( .A(n66), .Y(n306) );
  BUFX2 U350 ( .A(n63), .Y(n307) );
  BUFX2 U351 ( .A(n54), .Y(n308) );
  BUFX2 U352 ( .A(n611), .Y(n309) );
  BUFX2 U353 ( .A(\inst_spi_master/n40 ), .Y(n310) );
  BUFX2 U354 ( .A(\inst_spi_master/n58 ), .Y(n311) );
  AND2X1 U355 ( .A(n587), .B(n470), .Y(n558) );
  INVX1 U356 ( .A(n558), .Y(n312) );
  INVX1 U357 ( .A(\inst_spi_master/n1 ), .Y(n313) );
  AND2X1 U358 ( .A(n512), .B(n343), .Y(\inst_spi_master/n1 ) );
  INVX1 U359 ( .A(\inst_spi_master/n45 ), .Y(n314) );
  OR2X1 U360 ( .A(n549), .B(n512), .Y(\inst_spi_master/n45 ) );
  BUFX2 U361 ( .A(n76), .Y(n315) );
  BUFX2 U362 ( .A(n73), .Y(n316) );
  BUFX2 U363 ( .A(n70), .Y(n317) );
  BUFX2 U364 ( .A(n67), .Y(n318) );
  BUFX2 U365 ( .A(n64), .Y(n319) );
  BUFX2 U366 ( .A(n55), .Y(n320) );
  BUFX2 U367 ( .A(\inst_spi_master/n41 ), .Y(n321) );
  BUFX2 U368 ( .A(\inst_spi_master/n35 ), .Y(n322) );
  BUFX2 U369 ( .A(n613), .Y(n323) );
  INVX1 U370 ( .A(n180), .Y(n325) );
  INVX1 U371 ( .A(n216), .Y(n326) );
  INVX1 U372 ( .A(n582), .Y(n328) );
  INVX1 U373 ( .A(\inst_spi_master/n76 ), .Y(n329) );
  AND2X1 U374 ( .A(n469), .B(n491), .Y(\inst_spi_master/n76 ) );
  INVX1 U375 ( .A(\inst_spi_slave/n42 ), .Y(n330) );
  BUFX2 U376 ( .A(\inst_spi_slave/sck_dly1 ), .Y(n331) );
  INVX1 U377 ( .A(n218), .Y(n333) );
  INVX1 U378 ( .A(n181), .Y(n334) );
  INVX1 U379 ( .A(n217), .Y(n335) );
  INVX1 U380 ( .A(n609), .Y(n337) );
  INVX1 U381 ( .A(n556), .Y(n338) );
  AND2X1 U382 ( .A(n429), .B(n550), .Y(n556) );
  INVX1 U383 ( .A(n340), .Y(n339) );
  BUFX2 U384 ( .A(n738), .Y(n340) );
  INVX1 U385 ( .A(n342), .Y(n341) );
  BUFX2 U386 ( .A(mosi_m), .Y(n342) );
  BUFX2 U387 ( .A(\inst_spi_master/n5 ), .Y(n343) );
  INVX1 U388 ( .A(n90), .Y(n344) );
  OR2X1 U389 ( .A(n495), .B(sfraddr_r[1]), .Y(n90) );
  BUFX2 U390 ( .A(\inst_spi_slave/n72 ), .Y(n345) );
  BUFX2 U391 ( .A(miso_s), .Y(n346) );
  INVX1 U392 ( .A(n348), .Y(n347) );
  BUFX2 U393 ( .A(SPIBR[3]), .Y(n348) );
  INVX1 U394 ( .A(n350), .Y(n349) );
  BUFX2 U395 ( .A(SPIBR[7]), .Y(n350) );
  INVX1 U396 ( .A(n352), .Y(n351) );
  BUFX2 U397 ( .A(SPICR2[2]), .Y(n352) );
  INVX1 U398 ( .A(n354), .Y(n353) );
  BUFX2 U399 ( .A(SPICR2[3]), .Y(n354) );
  INVX1 U400 ( .A(n356), .Y(n355) );
  BUFX2 U401 ( .A(SPICR2[4]), .Y(n356) );
  INVX1 U402 ( .A(n358), .Y(n357) );
  BUFX2 U403 ( .A(SPICR2[5]), .Y(n358) );
  INVX1 U404 ( .A(n360), .Y(n359) );
  BUFX2 U405 ( .A(SPICR2[6]), .Y(n360) );
  INVX1 U406 ( .A(n362), .Y(n361) );
  BUFX2 U407 ( .A(SPICR2[7]), .Y(n362) );
  AND2X1 U408 ( .A(n550), .B(n433), .Y(\inst_spi_master/N18 ) );
  INVX1 U409 ( .A(\inst_spi_master/N18 ), .Y(n363) );
  INVX1 U410 ( .A(n567), .Y(n364) );
  OR2X1 U411 ( .A(n572), .B(n385), .Y(n567) );
  INVX1 U412 ( .A(\inst_spi_slave/n44 ), .Y(n365) );
  AND2X1 U413 ( .A(\inst_spi_slave/n52 ), .B(\inst_spi_slave/n53 ), .Y(
        \inst_spi_slave/n44 ) );
  INVX1 U414 ( .A(n367), .Y(n366) );
  BUFX2 U415 ( .A(SPICR1[0]), .Y(n367) );
  INVX1 U416 ( .A(n369), .Y(n368) );
  BUFX2 U417 ( .A(SPICR2[1]), .Y(n369) );
  INVX1 U418 ( .A(n371), .Y(n370) );
  BUFX2 U419 ( .A(SPICR1[3]), .Y(n371) );
  INVX1 U420 ( .A(n373), .Y(n372) );
  BUFX2 U421 ( .A(SPICR1[5]), .Y(n373) );
  INVX1 U422 ( .A(n375), .Y(n374) );
  BUFX2 U423 ( .A(SPICR1[7]), .Y(n375) );
  BUFX2 U424 ( .A(\inst_spi_master/n36 ), .Y(n376) );
  INVX1 U425 ( .A(\inst_spi_slave/n71 ), .Y(n377) );
  INVX1 U426 ( .A(n89), .Y(n378) );
  AND2X1 U427 ( .A(sfraddr_r[1]), .B(n495), .Y(n89) );
  INVX1 U428 ( .A(n88), .Y(n379) );
  BUFX2 U429 ( .A(n19), .Y(n380) );
  BUFX2 U430 ( .A(n31), .Y(n381) );
  AND2X1 U431 ( .A(n442), .B(n443), .Y(n596) );
  INVX1 U432 ( .A(n596), .Y(n382) );
  OR2X1 U433 ( .A(n402), .B(n442), .Y(n588) );
  INVX1 U434 ( .A(n588), .Y(n383) );
  BUFX2 U435 ( .A(\inst_spi_master/n56 ), .Y(n384) );
  INVX1 U436 ( .A(n576), .Y(n385) );
  AND2X1 U437 ( .A(n489), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n175 ), 
        .Y(n576) );
  BUFX2 U438 ( .A(\inst_spi_master/n42 ), .Y(n386) );
  BUFX2 U439 ( .A(n600), .Y(n387) );
  BUFX2 U440 ( .A(n566), .Y(n388) );
  BUFX2 U441 ( .A(n585), .Y(n389) );
  INVX1 U442 ( .A(n589), .Y(n390) );
  OR2X1 U443 ( .A(n410), .B(n574), .Y(n589) );
  INVX1 U444 ( .A(n82), .Y(n391) );
  INVX1 U445 ( .A(n602), .Y(n392) );
  OR2X1 U446 ( .A(n568), .B(n442), .Y(n602) );
  INVX1 U447 ( .A(\inst_spi_master/n7 ), .Y(n393) );
  INVX1 U448 ( .A(n604), .Y(n394) );
  OR2X1 U449 ( .A(n461), .B(n587), .Y(n604) );
  BUFX2 U450 ( .A(\inst_spi_master/n8 ), .Y(n395) );
  BUFX2 U451 ( .A(SPIDR2_s[7]), .Y(n396) );
  BUFX2 U452 ( .A(SPIDR2_m[7]), .Y(n397) );
  INVX1 U453 ( .A(SPC0), .Y(n398) );
  BUFX2 U454 ( .A(n616), .Y(SPC0) );
  INVX1 U455 ( .A(n401), .Y(n400) );
  BUFX2 U456 ( .A(SPICR1[6]), .Y(n401) );
  INVX1 U457 ( .A(n568), .Y(n402) );
  AND2X1 U458 ( .A(n489), .B(n463), .Y(n568) );
  INVX1 U459 ( .A(n606), .Y(n403) );
  AND2X1 U460 ( .A(n477), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n174 ), 
        .Y(n606) );
  INVX1 U461 ( .A(n574), .Y(n404) );
  AND2X1 U462 ( .A(n490), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n174 ), 
        .Y(n574) );
  BUFX2 U463 ( .A(\inst_spi_master/sck_edge_level ), .Y(n405) );
  INVX1 U464 ( .A(n407), .Y(n406) );
  BUFX2 U465 ( .A(sck_m), .Y(n407) );
  INVX1 U466 ( .A(n571), .Y(n408) );
  AND2X1 U467 ( .A(n490), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n175 ), 
        .Y(n571) );
  INVX1 U468 ( .A(\inst_spi_master/n44 ), .Y(n409) );
  INVX1 U469 ( .A(n573), .Y(n410) );
  AND2X1 U470 ( .A(n489), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n174 ), 
        .Y(n573) );
  BUFX2 U471 ( .A(SPIDR2_m[1]), .Y(n411) );
  BUFX2 U472 ( .A(SPIDR2_m[0]), .Y(n412) );
  BUFX2 U473 ( .A(SPIDR2_s[0]), .Y(n413) );
  BUFX2 U474 ( .A(SPIDR2_s[1]), .Y(n414) );
  BUFX2 U475 ( .A(SPIDR2_s[2]), .Y(n415) );
  BUFX2 U476 ( .A(SPIDR2_s[3]), .Y(n416) );
  BUFX2 U477 ( .A(SPIDR2_s[4]), .Y(n417) );
  BUFX2 U478 ( .A(SPIDR2_s[5]), .Y(n418) );
  BUFX2 U479 ( .A(SPIDR2_s[6]), .Y(n419) );
  BUFX2 U480 ( .A(SPIDR2_m[2]), .Y(n420) );
  BUFX2 U481 ( .A(SPIDR2_m[3]), .Y(n421) );
  BUFX2 U482 ( .A(SPIDR2_m[4]), .Y(n422) );
  BUFX2 U483 ( .A(SPIDR2_m[5]), .Y(n423) );
  BUFX2 U484 ( .A(SPIDR2_m[6]), .Y(n424) );
  INVX1 U485 ( .A(n426), .Y(n425) );
  BUFX2 U486 ( .A(SPIBR[5]), .Y(n426) );
  INVX1 U487 ( .A(n428), .Y(n427) );
  BUFX2 U488 ( .A(SPIBR[6]), .Y(n428) );
  BUFX2 U489 ( .A(\inst_spi_master/clk_cnt [7]), .Y(n429) );
  BUFX2 U490 ( .A(\inst_spi_slave/bit_count [2]), .Y(n430) );
  BUFX2 U491 ( .A(\inst_spi_master/bit_count [2]), .Y(n431) );
  BUFX2 U492 ( .A(\inst_spi_master/clk_cnt [5]), .Y(n432) );
  BUFX2 U493 ( .A(\inst_spi_master/clk_cnt [0]), .Y(n433) );
  BUFX2 U494 ( .A(\inst_spi_slave/sck_edge_cnt [1]), .Y(n434) );
  BUFX2 U495 ( .A(\inst_spi_master/sck_edge_cnt [1]), .Y(n435) );
  BUFX2 U496 ( .A(\inst_spi_slave/sck_edge_cnt [3]), .Y(n436) );
  BUFX2 U497 ( .A(\inst_spi_master/sck_edge_cnt [3]), .Y(n437) );
  BUFX2 U498 ( .A(\inst_spi_slave/sck_edge_cnt [2]), .Y(n438) );
  BUFX2 U499 ( .A(\inst_spi_master/sck_edge_cnt [2]), .Y(n439) );
  BUFX2 U500 ( .A(\inst_spi_master/clk_cnt [2]), .Y(n440) );
  BUFX2 U501 ( .A(\inst_spi_master/clk_cnt [3]), .Y(n441) );
  INVX1 U502 ( .A(n594), .Y(n442) );
  AND2X1 U503 ( .A(n490), .B(n463), .Y(n594) );
  INVX1 U504 ( .A(n601), .Y(n443) );
  AND2X1 U505 ( .A(n477), .B(n463), .Y(n601) );
  INVX1 U506 ( .A(n445), .Y(n444) );
  BUFX2 U507 ( .A(SPIDR1[0]), .Y(n445) );
  INVX1 U508 ( .A(n447), .Y(n446) );
  BUFX2 U509 ( .A(SPIDR1[2]), .Y(n447) );
  INVX1 U510 ( .A(n449), .Y(n448) );
  BUFX2 U511 ( .A(SPIDR1[4]), .Y(n449) );
  INVX1 U512 ( .A(n451), .Y(n450) );
  BUFX2 U513 ( .A(SPIDR1[6]), .Y(n451) );
  INVX1 U514 ( .A(n453), .Y(n452) );
  BUFX2 U515 ( .A(SPIDR1[1]), .Y(n453) );
  INVX1 U516 ( .A(n455), .Y(n454) );
  BUFX2 U517 ( .A(SPIDR1[3]), .Y(n455) );
  INVX1 U518 ( .A(n457), .Y(n456) );
  BUFX2 U519 ( .A(SPIDR1[5]), .Y(n457) );
  BUFX2 U520 ( .A(\inst_spi_master/clk_cnt [1]), .Y(n458) );
  BUFX2 U521 ( .A(\inst_spi_master/clk_cnt [4]), .Y(n459) );
  BUFX2 U522 ( .A(\inst_spi_master/clk_cnt [6]), .Y(n460) );
  INVX1 U523 ( .A(n586), .Y(n461) );
  AND2X1 U524 ( .A(n489), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n173 ), 
        .Y(n586) );
  BUFX2 U525 ( .A(\inst_spi_master/sck_edge_cnt [4]), .Y(n462) );
  INVX1 U526 ( .A(n464), .Y(n463) );
  BUFX2 U527 ( .A(SPIBR[4]), .Y(n464) );
  BUFX2 U528 ( .A(\inst_spi_slave/sck_edge_cnt [4]), .Y(n465) );
  INVX1 U529 ( .A(n467), .Y(n466) );
  BUFX2 U530 ( .A(\inst_spi_slave/sck_edge_cnt [0]), .Y(n467) );
  INVX1 U531 ( .A(n469), .Y(n468) );
  BUFX2 U532 ( .A(SPICR1[2]), .Y(n469) );
  AND2X1 U533 ( .A(n477), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n173 ), 
        .Y(n603) );
  INVX1 U534 ( .A(n603), .Y(n470) );
  INVX1 U535 ( .A(n472), .Y(n471) );
  BUFX2 U536 ( .A(\inst_spi_master/sck_edge_cnt [0]), .Y(n472) );
  INVX1 U537 ( .A(\inst_spi_slave/n65 ), .Y(n473) );
  INVX1 U538 ( .A(\inst_spi_master/n10 ), .Y(n474) );
  OR2X1 U539 ( .A(\inst_spi_master/n4 ), .B(\inst_spi_master/N15 ), .Y(
        \inst_spi_master/n10 ) );
  INVX1 U540 ( .A(\inst_spi_slave/n66 ), .Y(n475) );
  INVX1 U541 ( .A(n477), .Y(n476) );
  BUFX2 U542 ( .A(SPIBR[2]), .Y(n477) );
  BUFX2 U543 ( .A(\inst_spi_slave/bit_count [1]), .Y(n478) );
  BUFX2 U544 ( .A(\inst_spi_master/bit_count [1]), .Y(n479) );
  INVX1 U545 ( .A(n481), .Y(n480) );
  BUFX2 U546 ( .A(SPICR1[4]), .Y(n481) );
  BUFX2 U547 ( .A(SPIDR1[7]), .Y(n482) );
  BUFX2 U548 ( .A(\inst_spi_master/bit_count [0]), .Y(n483) );
  BUFX2 U549 ( .A(\inst_spi_slave/bit_count [0]), .Y(n484) );
  BUFX2 U550 ( .A(SPICR1[1]), .Y(n485) );
  INVX1 U551 ( .A(n58), .Y(n486) );
  INVX1 U552 ( .A(n61), .Y(n487) );
  INVX1 U553 ( .A(n59), .Y(n488) );
  INVX1 U554 ( .A(\inst_spi_master/n4 ), .Y(n512) );
  INVX1 U555 ( .A(n219), .Y(n511) );
  INVX1 U556 ( .A(\inst_spi_master/n25 ), .Y(n521) );
  INVX1 U557 ( .A(n485), .Y(n549) );
  INVX1 U558 ( .A(sfraddr_w[0]), .Y(n494) );
  INVX1 U559 ( .A(n346), .Y(n555) );
  INVX1 U560 ( .A(n482), .Y(n545) );
  INVX1 U561 ( .A(n490), .Y(n552) );
  INVX1 U562 ( .A(n489), .Y(n553) );
  INVX1 U563 ( .A(spidata_i[6]), .Y(n523) );
  INVX1 U564 ( .A(spidata_i[2]), .Y(n527) );
  INVX1 U565 ( .A(spidata_i[7]), .Y(n522) );
  INVX1 U566 ( .A(spidata_i[0]), .Y(n529) );
  INVX1 U567 ( .A(spidata_i[1]), .Y(n528) );
  INVX1 U568 ( .A(spidata_i[3]), .Y(n526) );
  INVX1 U569 ( .A(spidata_i[4]), .Y(n525) );
  INVX1 U570 ( .A(spidata_i[5]), .Y(n524) );
  INVX1 U571 ( .A(sfraddr_w[1]), .Y(n493) );
  INVX1 U572 ( .A(sfraddr_w[2]), .Y(n492) );
  INVX1 U573 ( .A(\inst_spi_slave/n40 ), .Y(n544) );
  INVX1 U574 ( .A(n191), .Y(n533) );
  INVX1 U575 ( .A(n192), .Y(n532) );
  INVX1 U576 ( .A(n193), .Y(n531) );
  INVX1 U577 ( .A(n194), .Y(n530) );
  INVX1 U578 ( .A(n190), .Y(n534) );
  INVX1 U579 ( .A(\inst_spi_slave/n63 ), .Y(n547) );
  INVX1 U580 ( .A(sfraddr_r[2]), .Y(n495) );
  INVX1 U581 ( .A(sfraddr_r[0]), .Y(n496) );
  INVX1 U582 ( .A(n185), .Y(n540) );
  INVX1 U583 ( .A(n187), .Y(n538) );
  INVX1 U584 ( .A(n189), .Y(n536) );
  INVX1 U585 ( .A(n186), .Y(n539) );
  INVX1 U586 ( .A(n183), .Y(n542) );
  INVX1 U587 ( .A(n184), .Y(n541) );
  INVX1 U588 ( .A(n188), .Y(n537) );
  INVX1 U589 ( .A(n182), .Y(n543) );
  INVX1 U590 ( .A(\inst_spi_slave/n52 ), .Y(n548) );
  INVX1 U591 ( .A(n201), .Y(n502) );
  INVX1 U592 ( .A(n203), .Y(n504) );
  INVX1 U593 ( .A(n204), .Y(n505) );
  INVX1 U594 ( .A(n200), .Y(n501) );
  INVX1 U595 ( .A(n202), .Y(n503) );
  INVX1 U596 ( .A(n198), .Y(n499) );
  INVX1 U597 ( .A(n199), .Y(n500) );
  INVX1 U598 ( .A(n197), .Y(n498) );
  AND2X1 U599 ( .A(n550), .B(n458), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n14 ) );
  AND2X1 U600 ( .A(n550), .B(n440), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n13 ) );
  AND2X1 U601 ( .A(n550), .B(n441), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n12 ) );
  AND2X1 U602 ( .A(n550), .B(n459), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n11 ) );
  AND2X1 U603 ( .A(n550), .B(n432), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n10 ) );
  AND2X1 U604 ( .A(n550), .B(n460), .Y(
        \inst_spi_master/add_88_aco_DP_OP_288_3930_2/n9 ) );
  INVX1 U605 ( .A(\inst_spi_master/N15 ), .Y(n550) );
  INVX1 U606 ( .A(\inst_spi_master/n118 ), .Y(n546) );
  INVX1 U607 ( .A(n205), .Y(n508) );
  INVX1 U608 ( .A(n207), .Y(n506) );
  INVX1 U609 ( .A(n206), .Y(n507) );
  INVX1 U610 ( .A(n195), .Y(n510) );
  INVX1 U611 ( .A(n196), .Y(n509) );
  INVX1 U612 ( .A(\inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .Y(n551) );
  AND2X1 U613 ( .A(n601), .B(n442), .Y(n579) );
  AND2X1 U614 ( .A(n477), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n175 ), 
        .Y(n572) );
  AND2X1 U615 ( .A(n490), .B(\inst_spi_master/add_65_DP_OP_289_508_1/n173 ), 
        .Y(n587) );
  BUFX2 U616 ( .A(SPIBR[0]), .Y(n489) );
  BUFX2 U617 ( .A(SPIBR[1]), .Y(n490) );
  INVX1 U618 ( .A(n343), .Y(n497) );
  INVX1 U619 ( .A(n211), .Y(n516) );
  INVX1 U620 ( .A(n213), .Y(n518) );
  INVX1 U621 ( .A(n214), .Y(n519) );
  INVX1 U622 ( .A(n209), .Y(n514) );
  INVX1 U623 ( .A(n212), .Y(n517) );
  INVX1 U624 ( .A(n210), .Y(n515) );
  INVX1 U625 ( .A(n208), .Y(n513) );
  INVX1 U626 ( .A(\inst_spi_master/n33 ), .Y(n520) );
  INVX1 U627 ( .A(n462), .Y(n554) );
  INVX1 U628 ( .A(ssn), .Y(intspi) );
  INVX1 U629 ( .A(sck), .Y(n94) );
  INVX1 U630 ( .A(mosi), .Y(n97) );
  INVX1 U631 ( .A(miso), .Y(n98) );
  INVX1 U632 ( .A(n215), .Y(n491) );
  XNOR2X1 U633 ( .A(\inst_spi_master/add_88_aco_DP_OP_288_3930_2/n1 ), .B(n338), .Y(\inst_spi_master/N25 ) );
  AOI22X1 U634 ( .A(n364), .B(n408), .C(n579), .D(n402), .Y(n557) );
  OAI21X1 U635 ( .A(n461), .B(n312), .C(n273), .Y(n559) );
  AOI21X1 U636 ( .A(n298), .B(n410), .C(n559), .Y(n566) );
  NAND3X1 U637 ( .A(n587), .B(n461), .C(n603), .Y(n563) );
  OAI21X1 U638 ( .A(n489), .B(n490), .C(
        \inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .Y(n590) );
  AOI22X1 U639 ( .A(n606), .B(n390), .C(n590), .D(n572), .Y(n561) );
  HAX1 U640 ( .A(n429), .B(n324), .YC(), .YS(n564) );
  AOI21X1 U641 ( .A(n459), .B(n388), .C(n564), .Y(n565) );
  OAI21X1 U642 ( .A(n459), .B(n388), .C(n278), .Y(n615) );
  OAI21X1 U643 ( .A(n489), .B(n490), .C(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .Y(n605) );
  AOI22X1 U644 ( .A(n601), .B(n392), .C(n603), .D(n394), .Y(n569) );
  OAI21X1 U645 ( .A(n408), .B(n567), .C(n274), .Y(n570) );
  AOI21X1 U646 ( .A(n605), .B(n606), .C(n570), .Y(n585) );
  NOR3X1 U647 ( .A(n404), .B(n606), .C(n410), .Y(n575) );
  AOI21X1 U648 ( .A(n299), .B(n385), .C(n575), .Y(n581) );
  OAI21X1 U649 ( .A(n489), .B(n490), .C(
        \inst_spi_master/add_65_DP_OP_289_508_1/n173 ), .Y(n578) );
  AOI22X1 U650 ( .A(n568), .B(n579), .C(n603), .D(n578), .Y(n580) );
  HAX1 U651 ( .A(n432), .B(n328), .YC(), .YS(n583) );
  AOI21X1 U652 ( .A(n460), .B(n389), .C(n583), .Y(n584) );
  OAI21X1 U653 ( .A(n460), .B(n389), .C(n279), .Y(n614) );
  NAND3X1 U654 ( .A(n587), .B(n470), .C(n461), .Y(n593) );
  AOI22X1 U655 ( .A(n390), .B(n403), .C(n383), .D(n443), .Y(n592) );
  NAND3X1 U656 ( .A(\inst_spi_master/add_65_DP_OP_289_508_1/n175 ), .B(n590), 
        .C(n476), .Y(n591) );
  XNOR2X1 U657 ( .A(n332), .B(n441), .Y(n612) );
  NOR3X1 U658 ( .A(n489), .B(n490), .C(n551), .Y(n595) );
  AOI22X1 U659 ( .A(n568), .B(n596), .C(n595), .D(n470), .Y(n600) );
  NOR3X1 U660 ( .A(n464), .B(n489), .C(n382), .Y(n597) );
  XNOR2X1 U661 ( .A(n433), .B(n597), .Y(n598) );
  OAI21X1 U662 ( .A(n458), .B(n387), .C(n598), .Y(n599) );
  AOI21X1 U663 ( .A(n458), .B(n387), .C(n599), .Y(n611) );
  AOI22X1 U664 ( .A(n394), .B(n470), .C(n392), .D(n443), .Y(n608) );
  NAND3X1 U665 ( .A(n403), .B(n605), .C(
        \inst_spi_master/add_65_DP_OP_289_508_1/n174 ), .Y(n607) );
  XNOR2X1 U666 ( .A(n337), .B(n440), .Y(n610) );
  NAND3X1 U667 ( .A(n612), .B(n309), .C(n610), .Y(n613) );
  NOR3X1 U668 ( .A(n615), .B(n614), .C(n323), .Y(\inst_spi_master/N15 ) );
  HAX1 U669 ( .A(\inst_spi_master/add_113/carry [4]), .B(n462), .YC(), .YS(
        \inst_spi_master/N34 ) );
  HAX1 U670 ( .A(\inst_spi_slave/add_80/carry [4]), .B(n465), .YC(), .YS(
        \inst_spi_slave/N23 ) );
  DFFSR rst_n_sync_reg ( .D(n714), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        rst_n_sync) );
  DFFSR \inst_spi_master/tr_done_dly1_reg  ( .D(n738), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/tr_done_dly1 ) );
  DFFSR \inst_spi_slave/tr_done_s_reg  ( .D(n269), .CLK(clk), .R(n215), .S(
        1'b1), .Q(data_finish_s) );
  DFFSR \inst_spi_slave/sck_dly1_reg  ( .D(sck_s), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_slave/sck_dly1 ) );
  DFFSR \inst_spi_master/tr_done_reg  ( .D(n270), .CLK(clk), .R(n215), .S(1'b1), .Q(\inst_spi_master/tr_done ) );
  DFFSR \inst_spi_slave/sck_edge_cnt_reg[4]  ( .D(n531), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_slave/sck_edge_cnt [4]) );
  DFFSR \inst_spi_slave/sck_edge_cnt_reg[3]  ( .D(n534), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_slave/sck_edge_cnt [3]) );
  DFFSR \inst_spi_slave/sck_edge_cnt_reg[2]  ( .D(n533), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_slave/sck_edge_cnt [2]) );
  DFFSR \inst_spi_slave/sck_edge_cnt_reg[1]  ( .D(n532), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_slave/sck_edge_cnt [1]) );
  DFFSR \inst_spi_slave/sck_edge_cnt_reg[0]  ( .D(n530), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_slave/sck_edge_cnt [0]) );
  DFFSR \inst_spi_slave/miso_reg  ( .D(n544), .CLK(clk), .R(n215), .S(1'b1), 
        .Q(miso_s) );
  DFFSR \SPIDR1_reg[7]  ( .D(n618), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[7]) );
  DFFSR \SPIDR1_reg[6]  ( .D(n621), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[6]) );
  DFFSR \SPIDR1_reg[5]  ( .D(n624), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[5]) );
  DFFSR \SPIDR1_reg[4]  ( .D(n627), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[4]) );
  DFFSR \SPIDR1_reg[3]  ( .D(n630), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[3]) );
  DFFSR \SPIDR1_reg[2]  ( .D(n633), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[2]) );
  DFFSR \SPIDR1_reg[1]  ( .D(n636), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[1]) );
  DFFSR \SPIDR1_reg[0]  ( .D(n639), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPIDR1[0]) );
  DFFSR \SPIBR_reg[7]  ( .D(n690), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[7])
         );
  DFFSR \SPIBR_reg[6]  ( .D(n693), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[6])
         );
  DFFSR \SPIBR_reg[5]  ( .D(n696), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[5])
         );
  DFFSR \SPIBR_reg[4]  ( .D(n699), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[4])
         );
  DFFSR \SPIBR_reg[3]  ( .D(n702), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[3])
         );
  DFFSR \SPIBR_reg[2]  ( .D(n705), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[2])
         );
  DFFSR \SPIBR_reg[1]  ( .D(n708), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[1])
         );
  DFFSR \SPIBR_reg[0]  ( .D(n711), .CLK(clk), .R(n215), .S(1'b1), .Q(SPIBR[0])
         );
  DFFSR \SPICR2_reg[7]  ( .D(n666), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[7]) );
  DFFSR \SPICR2_reg[6]  ( .D(n669), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[6]) );
  DFFSR \SPICR2_reg[5]  ( .D(n672), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[5]) );
  DFFSR \SPICR2_reg[4]  ( .D(n675), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[4]) );
  DFFSR \SPICR2_reg[3]  ( .D(n678), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[3]) );
  DFFSR \SPICR2_reg[2]  ( .D(n681), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[2]) );
  DFFSR \SPICR2_reg[1]  ( .D(n684), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR2[1]) );
  DFFSR \SPICR2_reg[0]  ( .D(n687), .CLK(clk), .R(n215), .S(1'b1), .Q(n616) );
  DFFSR \SPICR1_reg[7]  ( .D(n642), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[7]) );
  DFFSR \SPICR1_reg[6]  ( .D(n645), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[6]) );
  DFFSR \SPICR1_reg[5]  ( .D(n648), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[5]) );
  DFFSR \SPICR1_reg[4]  ( .D(n651), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[4]) );
  DFFSR \SPICR1_reg[3]  ( .D(n654), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[3]) );
  DFFSR \SPICR1_reg[2]  ( .D(n657), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[2]) );
  DFFSR \SPICR1_reg[1]  ( .D(n660), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[1]) );
  DFFSR \SPICR1_reg[0]  ( .D(n663), .CLK(clk), .R(n215), .S(1'b1), .Q(
        SPICR1[0]) );
  DFFSR \sfr_data_o_reg[7]  ( .D(n735), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[7]) );
  DFFSR \sfr_data_o_reg[6]  ( .D(n732), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[6]) );
  DFFSR \sfr_data_o_reg[5]  ( .D(n729), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[5]) );
  DFFSR \sfr_data_o_reg[4]  ( .D(n726), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[4]) );
  DFFSR \sfr_data_o_reg[3]  ( .D(n723), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[3]) );
  DFFSR \sfr_data_o_reg[2]  ( .D(n720), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[2]) );
  DFFSR \inst_spi_slave/data_r_s_reg[7]  ( .D(n543), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[7]) );
  DFFSR \inst_spi_slave/data_r_s_reg[6]  ( .D(n542), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[6]) );
  DFFSR \inst_spi_slave/data_r_s_reg[5]  ( .D(n541), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[5]) );
  DFFSR \inst_spi_slave/data_r_s_reg[4]  ( .D(n540), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[4]) );
  DFFSR \inst_spi_slave/data_r_s_reg[3]  ( .D(n539), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[3]) );
  DFFSR \inst_spi_slave/data_r_s_reg[2]  ( .D(n538), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[2]) );
  DFFSR \inst_spi_slave/data_r_s_reg[1]  ( .D(n537), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[1]) );
  DFFSR \inst_spi_slave/data_r_s_reg[0]  ( .D(n536), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_s[0]) );
  DFFSR \sfr_data_o_reg[1]  ( .D(n272), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[1]) );
  DFFSR \sfr_data_o_reg[0]  ( .D(n271), .CLK(clk), .R(n215), .S(1'b1), .Q(
        sfr_data_o[0]) );
  DFFSR \inst_spi_master/clk_cnt_reg[7]  ( .D(n498), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [7]) );
  DFFSR \inst_spi_master/clk_cnt_reg[6]  ( .D(n499), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [6]) );
  DFFSR \inst_spi_master/clk_cnt_reg[5]  ( .D(n500), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [5]) );
  DFFSR \inst_spi_master/clk_cnt_reg[4]  ( .D(n501), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [4]) );
  DFFSR \inst_spi_master/clk_cnt_reg[3]  ( .D(n502), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [3]) );
  DFFSR \inst_spi_master/clk_cnt_reg[2]  ( .D(n503), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [2]) );
  DFFSR \inst_spi_master/clk_cnt_reg[1]  ( .D(n504), .CLK(clk), .R(n215), .S(
        1'b1), .Q(\inst_spi_master/clk_cnt [1]) );
  DFFSR \inst_spi_master/sck_edge_level_reg  ( .D(n511), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_level ) );
  DFFSR \inst_spi_master/mosi_reg  ( .D(n717), .CLK(clk), .R(n215), .S(1'b1), 
        .Q(mosi_m) );
  DFFSR \inst_spi_master/data_r_m_reg[1]  ( .D(n520), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[1]) );
  DFFSR \inst_spi_master/data_r_m_reg[7]  ( .D(n518), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[7]) );
  DFFSR \inst_spi_master/data_r_m_reg[6]  ( .D(n517), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[6]) );
  DFFSR \inst_spi_master/data_r_m_reg[5]  ( .D(n516), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[5]) );
  DFFSR \inst_spi_master/data_r_m_reg[4]  ( .D(n515), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[4]) );
  DFFSR \inst_spi_master/data_r_m_reg[3]  ( .D(n514), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[3]) );
  DFFSR \inst_spi_master/data_r_m_reg[2]  ( .D(n513), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[2]) );
  DFFSR \inst_spi_master/data_r_m_reg[0]  ( .D(n519), .CLK(clk), .R(n215), .S(
        1'b1), .Q(SPIDR2_m[0]) );
  DFFSR \inst_spi_master/sck_edge_cnt_reg[0]  ( .D(n509), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_cnt [0]) );
  DFFSR \inst_spi_master/sck_edge_cnt_reg[4]  ( .D(n510), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_cnt [4]) );
  DFFSR \inst_spi_master/sck_edge_cnt_reg[3]  ( .D(n506), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_cnt [3]) );
  DFFSR \inst_spi_master/sck_edge_cnt_reg[2]  ( .D(n507), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_cnt [2]) );
  DFFSR \inst_spi_master/sck_edge_cnt_reg[1]  ( .D(n508), .CLK(clk), .R(n215), 
        .S(1'b1), .Q(\inst_spi_master/sck_edge_cnt [1]) );
  INVX1 U266 ( .A(n619), .Y(n617) );
  INVX1 U267 ( .A(n617), .Y(n618) );
  BUFX2 U268 ( .A(n174), .Y(n619) );
  INVX1 U269 ( .A(n622), .Y(n620) );
  INVX1 U270 ( .A(n620), .Y(n621) );
  BUFX2 U271 ( .A(n173), .Y(n622) );
  INVX1 U272 ( .A(n625), .Y(n623) );
  INVX1 U273 ( .A(n623), .Y(n624) );
  BUFX2 U274 ( .A(n172), .Y(n625) );
  INVX1 U275 ( .A(n628), .Y(n626) );
  INVX1 U276 ( .A(n626), .Y(n627) );
  BUFX2 U277 ( .A(n171), .Y(n628) );
  INVX1 U278 ( .A(n631), .Y(n629) );
  INVX1 U279 ( .A(n629), .Y(n630) );
  BUFX2 U280 ( .A(n170), .Y(n631) );
  INVX1 U281 ( .A(n634), .Y(n632) );
  INVX1 U282 ( .A(n632), .Y(n633) );
  BUFX2 U283 ( .A(n169), .Y(n634) );
  INVX1 U284 ( .A(n637), .Y(n635) );
  INVX1 U285 ( .A(n635), .Y(n636) );
  BUFX2 U286 ( .A(n168), .Y(n637) );
  INVX1 U287 ( .A(n640), .Y(n638) );
  INVX1 U288 ( .A(n638), .Y(n639) );
  BUFX2 U289 ( .A(n167), .Y(n640) );
  INVX1 U290 ( .A(n643), .Y(n641) );
  INVX1 U291 ( .A(n641), .Y(n642) );
  BUFX2 U292 ( .A(n166), .Y(n643) );
  INVX1 U293 ( .A(n646), .Y(n644) );
  INVX1 U294 ( .A(n644), .Y(n645) );
  BUFX2 U295 ( .A(n165), .Y(n646) );
  INVX1 U296 ( .A(n649), .Y(n647) );
  INVX1 U297 ( .A(n647), .Y(n648) );
  BUFX2 U298 ( .A(n164), .Y(n649) );
  INVX1 U299 ( .A(n652), .Y(n650) );
  INVX1 U300 ( .A(n650), .Y(n651) );
  BUFX2 U301 ( .A(n163), .Y(n652) );
  INVX1 U302 ( .A(n655), .Y(n653) );
  INVX1 U303 ( .A(n653), .Y(n654) );
  BUFX2 U304 ( .A(n162), .Y(n655) );
  INVX1 U305 ( .A(n658), .Y(n656) );
  INVX1 U671 ( .A(n656), .Y(n657) );
  BUFX2 U672 ( .A(n161), .Y(n658) );
  INVX1 U673 ( .A(n661), .Y(n659) );
  INVX1 U674 ( .A(n659), .Y(n660) );
  BUFX2 U675 ( .A(n160), .Y(n661) );
  INVX1 U676 ( .A(n664), .Y(n662) );
  INVX1 U677 ( .A(n662), .Y(n663) );
  BUFX2 U678 ( .A(n159), .Y(n664) );
  INVX1 U679 ( .A(n667), .Y(n665) );
  INVX1 U680 ( .A(n665), .Y(n666) );
  BUFX2 U681 ( .A(n158), .Y(n667) );
  INVX1 U682 ( .A(n670), .Y(n668) );
  INVX1 U683 ( .A(n668), .Y(n669) );
  BUFX2 U684 ( .A(n157), .Y(n670) );
  INVX1 U685 ( .A(n673), .Y(n671) );
  INVX1 U686 ( .A(n671), .Y(n672) );
  BUFX2 U687 ( .A(n156), .Y(n673) );
  INVX1 U688 ( .A(n676), .Y(n674) );
  INVX1 U689 ( .A(n674), .Y(n675) );
  BUFX2 U690 ( .A(n155), .Y(n676) );
  INVX1 U691 ( .A(n679), .Y(n677) );
  INVX1 U692 ( .A(n677), .Y(n678) );
  BUFX2 U693 ( .A(n154), .Y(n679) );
  INVX1 U694 ( .A(n682), .Y(n680) );
  INVX1 U695 ( .A(n680), .Y(n681) );
  BUFX2 U696 ( .A(n153), .Y(n682) );
  INVX1 U697 ( .A(n685), .Y(n683) );
  INVX1 U698 ( .A(n683), .Y(n684) );
  BUFX2 U699 ( .A(n152), .Y(n685) );
  INVX1 U700 ( .A(n688), .Y(n686) );
  INVX1 U701 ( .A(n686), .Y(n687) );
  BUFX2 U702 ( .A(n151), .Y(n688) );
  INVX1 U703 ( .A(n691), .Y(n689) );
  INVX1 U704 ( .A(n689), .Y(n690) );
  BUFX2 U705 ( .A(n150), .Y(n691) );
  INVX1 U706 ( .A(n694), .Y(n692) );
  INVX1 U707 ( .A(n692), .Y(n693) );
  BUFX2 U708 ( .A(n149), .Y(n694) );
  INVX1 U709 ( .A(n697), .Y(n695) );
  INVX1 U710 ( .A(n695), .Y(n696) );
  BUFX2 U711 ( .A(n148), .Y(n697) );
  INVX1 U712 ( .A(n700), .Y(n698) );
  INVX1 U713 ( .A(n698), .Y(n699) );
  BUFX2 U714 ( .A(n147), .Y(n700) );
  INVX1 U715 ( .A(n703), .Y(n701) );
  INVX1 U716 ( .A(n701), .Y(n702) );
  BUFX2 U717 ( .A(n146), .Y(n703) );
  INVX1 U718 ( .A(n706), .Y(n704) );
  INVX1 U719 ( .A(n704), .Y(n705) );
  BUFX2 U720 ( .A(n145), .Y(n706) );
  INVX1 U721 ( .A(n709), .Y(n707) );
  INVX1 U722 ( .A(n707), .Y(n708) );
  BUFX2 U723 ( .A(n144), .Y(n709) );
  INVX1 U724 ( .A(n712), .Y(n710) );
  INVX1 U725 ( .A(n710), .Y(n711) );
  BUFX2 U726 ( .A(n143), .Y(n712) );
  INVX1 U727 ( .A(n715), .Y(n713) );
  INVX1 U728 ( .A(n713), .Y(n714) );
  BUFX2 U729 ( .A(rst_n_sync_pre), .Y(n715) );
  INVX1 U730 ( .A(n718), .Y(n716) );
  INVX1 U731 ( .A(n716), .Y(n717) );
  BUFX2 U732 ( .A(\inst_spi_master/n111 ), .Y(n718) );
  INVX1 U733 ( .A(n721), .Y(n719) );
  INVX1 U734 ( .A(n719), .Y(n720) );
  BUFX2 U735 ( .A(N79), .Y(n721) );
  INVX1 U736 ( .A(n724), .Y(n722) );
  INVX1 U737 ( .A(n722), .Y(n723) );
  BUFX2 U738 ( .A(N80), .Y(n724) );
  INVX1 U739 ( .A(n727), .Y(n725) );
  INVX1 U740 ( .A(n725), .Y(n726) );
  BUFX2 U741 ( .A(N81), .Y(n727) );
  INVX1 U742 ( .A(n730), .Y(n728) );
  INVX1 U743 ( .A(n728), .Y(n729) );
  BUFX2 U744 ( .A(N82), .Y(n730) );
  INVX1 U745 ( .A(n733), .Y(n731) );
  INVX1 U746 ( .A(n731), .Y(n732) );
  BUFX2 U747 ( .A(N83), .Y(n733) );
  INVX1 U748 ( .A(n736), .Y(n734) );
  INVX1 U749 ( .A(n734), .Y(n735) );
  BUFX2 U750 ( .A(N84), .Y(n736) );
  INVX1 U751 ( .A(n739), .Y(n737) );
  INVX1 U752 ( .A(n737), .Y(n738) );
  BUFX2 U753 ( .A(\inst_spi_master/tr_done ), .Y(n739) );
endmodule

