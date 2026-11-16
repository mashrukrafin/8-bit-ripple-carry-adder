//1. Top Module: Eight bit shift register

module eight_bit_shift_reg(Y, S, rst, CLK, X, shift_R, shift_L);
input [1:0] S;
input rst, CLK;
input [7:0] X;
input shift_R, shift_L;
output [7:0]Y;

integer i,k;

wire [3:0] D_in7;
wire [3:0] D_in6;
wire [3:0] D_in5;
wire [3:0] D_in4;
wire [3:0] D_in3;
wire [3:0] D_in2;
wire [3:0] D_in1;
wire [3:0] D_in0;


assign D_in7 = {X[7], Y[6], shift_R, Y[7]};
assign D_in6 = {X[6], Y[5], Y[7], Y[6]};
assign D_in5 = {X[5], Y[4], Y[6], Y[5]};
assign D_in4 = {X[4], Y[3], Y[5], Y[4]};
assign D_in3 = {X[3], Y[2], Y[4], Y[3]};
assign D_in2 = {X[2], Y[1], Y[3], Y[2]};
assign D_in1 = {X[1], Y[0], Y[2], Y[1]};
assign D_in0 = {X[0], shift_L, Y[1], Y[0]};


one_bit_register reg7(Y[7], S, rst, CLK, D_in7);
one_bit_register reg6(Y[6], S, rst, CLK, D_in6);
one_bit_register reg5(Y[5], S, rst, CLK, D_in5);
one_bit_register reg4(Y[4], S, rst, CLK, D_in4);
one_bit_register reg3(Y[3], S, rst, CLK, D_in3);
one_bit_register reg2(Y[2], S, rst, CLK, D_in2);
one_bit_register reg1(Y[1], S, rst, CLK, D_in1);
one_bit_register reg0(Y[0], S, rst, CLK, D_in0);

endmodule


//2. Second Module: One bit shift register
module one_bit_register(Y, S, rst, CLK, X);

input [1:0] S;
input rst, CLK;
input [3:0] X;
output Y;

wire D;
wire [3:0] D_in;

assign D_in = {X[3:1], Y};

four_to_one_mux raf1(D, D_in, S);
D_F_F mash1(Y, CLK, rst, D);

endmodule


//3. Third Module: D Flip flop
module D_F_F(Q, CLK, rst, D);
input CLK,D, rst;
output reg Q;

always @ (posedge CLK or negedge rst) begin
 if ( rst==0 )
    Q <= 0;
else
    Q <= D;
    end
endmodule


//4. Fourth Module: Four to one MUX
module four_to_one_mux(Y, D, S);
 input [3:0] D;
 input [1:0] S;
 output reg Y;
 integer i,j;
 reg [3:0] temp;

 always @(*) begin
 for (i=0; i<4; i=i+1) begin
      if(S==i)
      Y=D[i];
      end
     end
endmodule









