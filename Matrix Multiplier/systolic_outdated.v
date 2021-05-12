module invert(input wire i, output wire o1);
	assign o1 = !i;
endmodule

module and2(input wire i0, i1, output wire o2);
	assign o2 = i0 & i1;
endmodule

module or2(input wire i0, i1, output wire o3);
	assign o3 = i0 | i1;
endmodule

module xor2(input wire i0, i1, output wire o4);
	assign o4 = i0 ^ i1;
endmodule

module nand2(input wire i0, i1, output wire o5);
	wire t;
	and2 and2_0 (i0, i1, t);
	invert invert_0 (t, o5);
endmodule

//Module full adder.
module fulladder(input wire a, b, cin, output wire sum, cout);
wire [4:0] t;
    xor2 x0(a, b, t[0]);
    xor2 x1(t[0], cin, sum);

    and2 a0(a, b, t[1]);
    and2 a1(a, cin, t[2]);
    and2 a2(b, cin, t[3]);

    or2 o0(t[1], t[2], t[4]);
    or2 o1(t[3], t[4], cout);
endmodule

module halfadder(input wire a, b, output wire sum, cout);

    xor2 x0(a, b, sum);
    and2 x1(a, b, cout);

endmodule




module RippleCarryAdder(input wire [5:0] a, input wire [6:0]b, input wire cin, output wire [7:0] sum);

   	// Instantiate full adder modules here.
	wire [5:0] c;

	fulladder f1(a[0],b[0],cin,sum[0],c[0]);
	fulladder f2(a[1],b[1],c[0],sum[1],c[1]);
	fulladder f3(a[2],b[2],c[1],sum[2],c[2]);
	fulladder f4(a[3],b[3],c[2],sum[3],c[3]);
	fulladder f5(a[4],b[4],c[3],sum[4],c[4]);
    fulladder f6(a[5],b[5],c[4],sum[5],c[5]);
    halfadder h1(b[6],c[5],sum[6],sum[7]);

endmodule 


module CarrySaveAdder(input wire[5:0]a,input wire[5:0]b,input wire[5:0]c,output wire [5:0] sum, output wire [6:0] carry);
	
assign carry[0]=1'b0; //verify	
fulladder f1(a[0],b[0],c[0],sum[0],carry[1]);
fulladder f2(a[1],b[1],c[1],sum[1],carry[2]);
fulladder f3(a[2],b[2],c[2],sum[2],carry[3]);
fulladder f4(a[3],b[3],c[3],sum[3],carry[4]);
fulladder f5(a[4],b[4],c[4],sum[4],carry[5]);
fulladder f6(a[5],b[5],c[5],sum[5],carry[6]);

endmodule

/*

//older version deprecated xp

module wallaceAdder(input wire[5:0]a,input wire[5:0]b,input wire[5:0]c,output wire [7:0] product);

	wire [5:0] sum;
    wire [6:0] carry;
	
	CarrySaveAdder ca(a,b,c,sum,carry);
	RippleCarryAdder rca(sum,carry,0,product);	
endmodule
*/

module CarrySaveAdder7(input wire[5:0]a,input wire[5:0]b,input wire[6:0]c,output wire [6:0] sum, output wire [6:0] carry);
	
assign carry[0]=1'b0; //verify	
fulladder f1(a[0],b[0],c[0],sum[0],carry[1]);
fulladder f2(a[1],b[1],c[1],sum[1],carry[2]);
fulladder f3(a[2],b[2],c[2],sum[2],carry[3]);
fulladder f4(a[3],b[3],c[3],sum[3],carry[4]);
fulladder f5(a[4],b[4],c[4],sum[4],carry[5]);
fulladder f6(a[5],b[5],c[5],sum[5],carry[6]);
assign sum[6]=c[6];
//carry[7] if existed would be 0 

endmodule


module WallaceTree(input wire[5:0]p1,p2,p3,p4,output wire [6:0]sum,carry);

    wire [6:0]clvl1;
    wire [5:0]slvl1;
    //level 1
    CarrySaveAdder csa61(p1,p2,p3,slvl1,clvl1);
    CarrySaveAdder7 csa71(p4,slvl1,clvl1,sum,carry);

endmodule


module Add4_6bit(input wire[5:0]p1,p2,p3,p4, output wire[7:0]result);


    wire[6:0] sum,carry;
    WallaceTree wt(p1,p2,p3,p4,sum,carry);
    TempRippleCarry7 trc71(sum,carry,result);       //to be replace by a fast adder(suggested carry lookahead or parallel prefix to reduce time)

endmodule

/*
module TempRippleCarry6(input wire[5:0] prod1,prod2,output wire[6:0] result);

    wire [5:0] c;
    halfadder h1(prod1[0],prod2[0],result[0],c[0]);
    fulladder f1(prod1[1],prod2[1],c[0],result[1],c[1]);
    fulladder f2(prod1[2],prod2[2],c[1],result[2],c[2]);
    fulladder f3(prod1[3],prod2[3],c[2],result[3],c[3]);
    fulladder f4(prod1[4],prod2[4],c[3],result[4],c[4]);
    fulladder f5(prod1[5],prod2[5],c[4],result[5],result[6]);

endmodule
*/

module TempRippleCarry7(input wire[6:0] prod1,prod2,output wire[7:0] result);

    wire [5:0] c;
    halfadder h1(prod1[0],prod2[0],result[0],c[0]);
    fulladder f1(prod1[1],prod2[1],c[0],result[1],c[1]);
    fulladder f2(prod1[2],prod2[2],c[1],result[2],c[2]);
    fulladder f3(prod1[3],prod2[3],c[2],result[3],c[3]);
    fulladder f4(prod1[4],prod2[4],c[3],result[4],c[4]);
    fulladder f5(prod1[5],prod2[5],c[4],result[5],c[5]);
    fulladder f6(prod1[6],prod2[6],c[5],result[6],result[7]);

endmodule



module Multiplyer(input wire[2:0]x,y,output wire[5:0] product);

    wire [9:0] andouts;
    wire [9:0] lvl2outs;
    wire [9:0] lvl3outs;
    wire [9:0] lvl4outs;
    wire oroutlvl1;
    
    //Product[0]
    and2 a1(x[0],y[0],product[0]); //r0

    //Product[1]
    and2 a2(x[0],y[1],andouts[0]);  //a1
    and2 a3(x[1],y[0],andouts[1]);  //b0
    xor2 x1(andouts[0],andouts[1],product[1]); //r1

    //Product[2]
    and2 lvl2a1(andouts[0],andouts[1],lvl2outs[0]); //Q
    and2 a4(x[0],y[2],andouts[2]); //a2
    xor2 x2(lvl2outs[0],andouts[2],lvl3outs[0]); //n0
    and2 a5(x[1],y[1],andouts[3]);  //b1
    and2 a6(x[2],y[0],andouts[4]); //c0
    xor2 x3(andouts[3],andouts[4],lvl2outs[1]); //m1
    xor2 x4(lvl2outs[1],lvl3outs[0],product[2]); //r2

    //Product[3]

    or2 o1(andouts[2],andouts[3],lvl2outs[2]); //m0
    and2 lvl3a1(lvl2outs[2],andouts[4],lvl3outs[1]); //n1
    and2 a7(x[1],y[2],andouts[5]); //b2
    and2 a8(x[2],y[1],andouts[6]); //c1   
    or2 lvl2o1(andouts[5],andouts[1],lvl2outs[3]); //m2
    and2 lvl3a2(lvl2outs[3],andouts[0],lvl3outs[2]); //n2
    or2 lvl4o1(lvl3outs[1],lvl3outs[2],lvl4outs[0]); //p2
    xor2 x5(andouts[5],andouts[6],lvl2outs[4]); //m3
    xor2 x7(lvl4outs[0],lvl4outs[1],product[3]); //r3
    xor2 x6(lvl3outs[3],lvl2outs[4],lvl4outs[1]); //s0
  
    //Product[4] and Product[5]
    and2 a9(x[2],y[2],andouts[7]);  //c2
    and2 a10(x[0],x[1],andouts[8]); //x0x1
    //or2 o2(x[1],y[1],oroutlvl1);    //y1orx1
    or2 o2(andouts[4],andouts[0],oroutlvl1); //new or
    and2 lvl2a2(product[0],andouts[7],lvl2outs[5]); //m4
    and2 lvl3a3(andouts[3],lvl2outs[5],lvl3outs[3]); //z1
    //or2 lvl2o2(andouts[2],andouts[4],lvl2outs[6]);  //m5 = a2 or c0
    or2 lvl2o2(andouts[7],andouts[4],lvl2outs[6]); //new m5
    and2 lvl3a4(lvl2outs[6],andouts[3],lvl3outs[4]); //n3
    xor2 x8(lvl3outs[3],andouts[7],lvl4outs[2]); //s1
    or2 lvl2o3(andouts[0],andouts[8],lvl2outs[7]); //m6
    or2 lvl3o1(lvl2outs[7],andouts[3],lvl3outs[5]); //n4
    and2 lvl2a3(y[0],andouts[7],lvl2outs[8]); //m7
    and2 lvl2a4(andouts[7],andouts[3],lvl2outs[9]); //m8
    //and2 lvl3a5(oroutlvl1,lvl2outs[5],lvl3outs[6]); //n5
    and2 lvl3a5(oroutlvl1,andouts[5],lvl3outs[6]); //n5
    
    or2 lvl4o2(lvl3outs[6],lvl3outs[4],lvl4outs[3]); //z2
    and2 lvl4a1(lvl2outs[8],lvl3outs[5],lvl4outs[4]); //s2

    xor2 xr4(lvl4outs[2],lvl4outs[3],product[4]);
    or2 or5(lvl4outs[4],lvl2outs[9],product[5]);



endmodule




module MulAddCell(input wire[2:0] a0,a1,a2,a3,b0,b1,b2,b3,output wire[7:0] result);

    wire[5:0] prod1,prod2,prod3,prod4;
    //wire[6:0] sumres1,sumres2;

    Multiplyer m1(a0,b0,prod1);
    Multiplyer m2(a1,b1,prod2);
    Multiplyer m3(a2,b2,prod3);
    Multiplyer m4(a3,b3,prod4);
    //the below logic needs to be altered to add the 4 products per cell into wallace tree version for efficiency 
    //wallaceAdder wa(prod1,prod2,prod3,product);
    /*
    TempRippleCarry6 trc1(prod1,prod2,sumres1);
    TempRippleCarry6 trc2(prod3,prod4,sumres2);
    TempRippleCarry7 trc3(sumres1,sumres2,result);
    */
    Add4_6bit a46b(prod1,prod2,prod3,prod4,result);


endmodule

module Parallel16MatrixMultiplier(input wire[2:0]a00,a01,a02,a03,b00,b01,b02,b03,a10,a11,a12,a13,
b10,b11,b12,b13,a20,a21,a22,a23,b20,b21,b22,b23,a30,a31,a32,a33,b30,b31,b32,b33, 
output wire[7:0] res00,res01,res02,res03,res10,res11,res12,res13,res20,res21,res22,res23,res30,res31,res32,res33);

    //row1
    MulAddCell ma00(a00,a01,a02,a03,b00,b10,b20,b30,res00);
    MulAddCell ma01(a00,a01,a02,a03,b01,b11,b21,b31,res01);
    MulAddCell ma02(a00,a01,a02,a03,b02,b12,b22,b32,res02);
    MulAddCell ma03(a00,a01,a02,a03,b03,b13,b23,b33,res03);

    //row2
    MulAddCell ma10(a10,a11,a12,a13,b00,b10,b20,b30,res10);
    MulAddCell ma11(a10,a11,a12,a13,b01,b11,b21,b31,res11);
    MulAddCell ma12(a10,a11,a12,a13,b02,b12,b22,b32,res12);
    MulAddCell ma13(a10,a11,a12,a13,b03,b13,b23,b33,res13);

    //row3
    MulAddCell ma20(a20,a21,a22,a23,b00,b10,b20,b30,res20);
    MulAddCell ma21(a20,a21,a22,a23,b01,b11,b21,b31,res21);
    MulAddCell ma22(a20,a21,a22,a23,b02,b12,b22,b32,res22);
    MulAddCell ma23(a20,a21,a22,a23,b03,b13,b23,b33,res23);

    //row4
    MulAddCell ma30(a30,a31,a32,a33,b00,b10,b20,b30,res30);
    MulAddCell ma31(a30,a31,a32,a33,b01,b11,b21,b31,res31);
    MulAddCell ma32(a30,a31,a32,a33,b02,b12,b22,b32,res32);
    MulAddCell ma33(a30,a31,a32,a33,b03,b13,b23,b33,res33);    
    


endmodule







