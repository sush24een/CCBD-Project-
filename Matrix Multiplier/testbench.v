module tb;
    reg[2:0] i_a00,i_a01,i_a02,i_a03,i_b00,i_b01,i_b02,i_b03,i_a10,i_a11,i_a12,i_a13,
    i_b10,i_b11,i_b12,i_b13,i_a20,i_a21,i_a22,i_a23,i_b20,i_b21,i_b22,i_b23,i_a30,
    i_a31,i_a32,i_a33,i_b30,i_b31,i_b32,i_b33;
    
    wire[7:0] o_res00,o_res01,o_res02,o_res03,o_res10,o_res11,o_res12,o_res13,
    o_res20,o_res21,o_res22,o_res23,o_res30,o_res31,o_res32,o_res33;

    //instatiate
    
    Parallel16MatrixMultiplier p16mm1(.a00(i_a00),.a01(i_a01),.a02(i_a02),.a03(i_a03),
    .b00(i_b00),.b01(i_b01),.b02(i_b02),.b03(i_b03),
    .a10(i_a10),.a11(i_a11),.a12(i_a12),.a13(i_a13),
    .b10(i_b10),.b11(i_b11),.b12(i_b12),.b13(i_b13),
    .a20(i_a20),.a21(i_a21),.a22(i_a22),.a23(i_a23),
    .b20(i_b20),.b21(i_b21),.b22(i_b22),.b23(i_b23),
    .a30(i_a30),.a31(i_a31),.a32(i_a32),.a33(i_a33),
    .b30(i_b30),.b31(i_b31),.b32(i_b32),.b33(i_b33),
    .res00(o_res00),.res01(o_res01),.res02(o_res02),.res03(o_res03),
    .res10(o_res10),.res11(o_res11),.res12(o_res12),.res13(o_res13),
    .res20(o_res20),.res21(o_res21),.res22(o_res22),.res23(o_res23),
    .res30(o_res30),.res31(o_res31),.res32(o_res32),.res33(o_res33));

    initial begin $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    end
/*
    initial begin $monitor(i_a00,i_a01,i_a02,i_a03,i_b00,i_b01,i_b02,i_b03,i_a10,i_a11,i_a12,i_a13,
    i_b10,i_b11,i_b12,i_b13,i_a20,i_a21,i_a22,i_a23,i_b20,i_b21,i_b22,i_b23,i_a30,
    i_a31,i_a32,i_a33,i_b30,i_b31,i_b32,i_b33,o_res00,o_res01,o_res02,o_res03,o_res10,o_res11,o_res12,o_res13,
    o_res20,o_res21,o_res22,o_res23,o_res30,o_res31,o_res32,o_res33); //displays the content of the register
*/  
    initial begin $monitor("\n--------------------------\nA\t\tB\n",
    i_a00," ",i_a01," ",i_a02," ",i_a03," \t",i_b00," ",i_b01," ",i_b02," ",i_b03,"\n",i_a10," ",i_a11," ",i_a12," ",i_a13
    ," \t",i_b10," ",i_b11," ",i_b12," ",i_b13,"\n",i_a20," ",i_a21," ",i_a22," ",i_a23," \t",i_b20," ",i_b21," ",i_b22," ",i_b23,
    "\n",i_a30," ",i_a31," ",i_a32," ",i_a33," \t",i_b30," ",i_b31," ",i_b32," ",i_b33,"\n\nANSWER ->\n",o_res00," ",o_res01," ",o_res02," ",
    "",o_res03,"\n",o_res10," ",o_res11," ",o_res12," ",o_res13,"\n",o_res20," ",o_res21," ",o_res22," ",o_res23,"\n",o_res30," ",
    o_res31," ",o_res32," ",o_res33); //displays the content of the register
    /*

    */

    i_a00=3'b101;
    i_a01=3'b000;
    i_a02=3'b010;
    i_a03=3'b000;
    i_a10=3'b001;
    i_a11=3'b100;
    i_a12=3'b101;
    i_a13=3'b001;
    i_a20=3'b001;
    i_a21=3'b000;
    i_a22=3'b110;
    i_a23=3'b011;
    i_a30=3'b101;
    i_a31=3'b101;
    i_a32=3'b011;
    i_a33=3'b111;
    i_b00=3'b001;
    i_b01=3'b101;
    i_b02=3'b110;
    i_b03=3'b110;
    i_b10=3'b111;
    i_b11=3'b110;
    i_b12=3'b110;
    i_b13=3'b100;
    i_b20=3'b100;
    i_b21=3'b100;
    i_b22=3'b000;
    i_b23=3'b010;
    i_b30=3'b100;
    i_b31=3'b110;
    i_b32=3'b011;
    i_b33=3'b001;
    
    #10 //time nanosecs

    i_a00=3'b100;
    i_a01=3'b101;
    i_a02=3'b000;
    i_a03=3'b110;
    i_a10=3'b110;
    i_a11=3'b111;
    i_a12=3'b001;
    i_a13=3'b001;
    i_a20=3'b001;
    i_a21=3'b111;
    i_a22=3'b100;
    i_a23=3'b111;
    i_a30=3'b100;
    i_a31=3'b111;
    i_a32=3'b001;
    i_a33=3'b011;
    i_b00=3'b111;
    i_b01=3'b001;
    i_b02=3'b100;
    i_b03=3'b111;
    i_b10=3'b110;
    i_b11=3'b111;
    i_b12=3'b001;
    i_b13=3'b000;
    i_b20=3'b001;
    i_b21=3'b011;
    i_b22=3'b001;
    i_b23=3'b000;
    i_b30=3'b000;
    i_b31=3'b010;
    i_b32=3'b011;
    i_b33=3'b111;
    
    #10 //time nanosecs
    i_a00=3'b000;
    i_a01=3'b000;
    i_a02=3'b000;
    i_a03=3'b000;
    i_a10=3'b000;
    i_a11=3'b000;
    i_a12=3'b000;
    i_a13=3'b000;
    i_a20=3'b000;
    i_a21=3'b000;
    i_a22=3'b000;
    i_a23=3'b000;
    i_a30=3'b000;
    i_a31=3'b000;
    i_a32=3'b000;
    i_a33=3'b000;
    i_b00=3'b000;
    i_b01=3'b000;
    i_b02=3'b000;
    i_b03=3'b000;
    i_b10=3'b000;
    i_b11=3'b000;
    i_b12=3'b000;
    i_b13=3'b000;
    i_b20=3'b000;
    i_b21=3'b000;
    i_b22=3'b000;
    i_b23=3'b000;
    i_b30=3'b000;
    i_b31=3'b000;
    i_b32=3'b000;
    i_b33=3'b000;

    #10 //time nanosecs
    i_a00=3'b011;
    i_a01=3'b101;
    i_a02=3'b110;
    i_a03=3'b100;
    i_a10=3'b011;
    i_a11=3'b110;
    i_a12=3'b001;
    i_a13=3'b001;
    i_a20=3'b010;
    i_a21=3'b100;
    i_a22=3'b001;
    i_a23=3'b101;
    i_a30=3'b000;
    i_a31=3'b111;
    i_a32=3'b101;
    i_a33=3'b000;
    i_b00=3'b111;
    i_b01=3'b000;
    i_b02=3'b111;
    i_b03=3'b110;
    i_b10=3'b011;
    i_b11=3'b011;
    i_b12=3'b010;
    i_b13=3'b110;
    i_b20=3'b101;
    i_b21=3'b111;
    i_b22=3'b000;
    i_b23=3'b111;
    i_b30=3'b000;
    i_b31=3'b010;
    i_b32=3'b000;
    i_b33=3'b001;

    #10 //time nanosecs
    i_a00=3'b001;
    i_a01=3'b001;
    i_a02=3'b001;
    i_a03=3'b001;
    i_a10=3'b001;
    i_a11=3'b001;
    i_a12=3'b001;
    i_a13=3'b001;
    i_a20=3'b001;
    i_a21=3'b001;
    i_a22=3'b001;
    i_a23=3'b001;
    i_a30=3'b001;
    i_a31=3'b001;
    i_a32=3'b001;
    i_a33=3'b001;
    i_b00=3'b001;
    i_b01=3'b001;
    i_b02=3'b001;
    i_b03=3'b001;
    i_b10=3'b001;
    i_b11=3'b001;
    i_b12=3'b001;
    i_b13=3'b001;
    i_b20=3'b001;
    i_b21=3'b001;
    i_b22=3'b001;
    i_b23=3'b001;
    i_b30=3'b001;
    i_b31=3'b001;
    i_b32=3'b001;
    i_b33=3'b001;
    #10 //time nanosecs
    i_a00=3'b111;
    i_a01=3'b111;
    i_a02=3'b111;
    i_a03=3'b111;
    i_a10=3'b111;
    i_a11=3'b111;
    i_a12=3'b111;
    i_a13=3'b111;
    i_a20=3'b111;
    i_a21=3'b111;
    i_a22=3'b111;
    i_a23=3'b111;
    i_a30=3'b111;
    i_a31=3'b111;
    i_a32=3'b111;
    i_a33=3'b111;
    i_b00=3'b111;
    i_b01=3'b111;
    i_b02=3'b111;
    i_b03=3'b111;
    i_b10=3'b111;
    i_b11=3'b111;
    i_b12=3'b111;
    i_b13=3'b111;
    i_b20=3'b111;
    i_b21=3'b111;
    i_b22=3'b111;
    i_b23=3'b111;
    i_b30=3'b111;
    i_b31=3'b111;
    i_b32=3'b111;
    i_b33=3'b111;
        
    end
endmodule
