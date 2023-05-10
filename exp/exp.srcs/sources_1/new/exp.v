module adder(
input ia, //1 位二进制加数
input ib,//1 位二进制加数
input cin,//低位来的进位信号
output cout,//向高位的进位信号
output sum //1 位和数
);

assign cout=(ib && cin) || (ia && cin) || (ia && ib);
assign sum=ia^ib^cin;

endmodule

module adder_4(
 input [3:0] a, //四位有符号数补码
 input [3:0] b,//四位有符号数补码
 input cin, //低位进位信号
 output [3:0] s,//四位和数补码形式
 output overflow //溢出标志
);
wire[3:0] carryout;

adder adder0(
.ia  (a[0]),
.ib  (b[0]),
.cin (cin==1?1'b1:1'b0),
.cout  (carryout[0]),
.sum  (s[0])
);
adder adder1(
.ia  (a[1]),
.ib  (b[1]),
.cin (carryout[0]),
.cout  (carryout[1]),
.sum  (s[1])
);
adder adder2(
.ia  (a[2]),
.ib  (b[2]),
.cin (carryout[1]),
.cout  (carryout[2]),
.sum  (s[2])
);
adder adder3(
.ia  (a[3]),
.ib  (b[3]),
.cin (carryout[2]),
.cout  (carryout[3]),
.sum  (s[3])
);
assign overflow=carryout[2]^carryout[3];

endmodule

module add_sub(
input [3:0] a,//四位有符号数补码
input [3:0] b,//四位有符号数补码
input cin,//低位来的进位信号
input operator,//决定加法还是减法
output [3:0] result,//运算结果补码形式
output overflow //溢出标志
);
reg [3:0] nb;
wire [3:0] ss;
wire [3:0] n;
wire flag;
wire [3:0] re;
wire of;
wire tag[1:0];
assign flag=operator;
//assign b=(operator==1?~b:b);
//这里认为0是加法
always@(*)
begin
    nb=operator==1?~b:b;
end

begin
adder_4 reverse(
.a  (a),
.b  (nb),
.cin (operator==1?1'b1:1'b0),
.s(re),
.overflow(tag[0])
);

adder_4 add(
.a  (re),
.b  (0),
.cin (cin==1?1'b1:1'b0),
.s(result),
.overflow(tag[1])
);
assign overflow=tag[1]|tag[0];
end
endmodule

/*
module adder_16(
    input [15:0] a, 
    input [15:0] b,
    output [15:0]sum 
);
wire [15:0]carryout;

adder adder_u(
    .ia  (a[0]),
    .ib  (b[0]),
    .cin (0),
    .cout  (carryout[0]),
    .sum  (sum[0])
);
 genvar i;
 generate
    for(i=1;i<=15;i=i+1)begin:adder_gen
    adder u_adder(
        .ia  (a[i]),
        .ib  (b[i]),
        .cin (carryout[i-1]),
        .cout  (carryout[i]),
        .sum  (sum[i])
    );
    end
    endgenerate
    
    
    
endmodule

module MULT(
 input [7:0] a, //被乘数 a
 input [7:0] b,//乘数 b
 output [15:0] z //乘积输出 z
);
reg[15:0] n0,n1,n2,n3,n4,n5,n6,n7;
wire[15:0] add01,add23,add45,add67,add0123,add4567;


always@(*)
begin


n7=b[7]?{1'b0,a,7'b0}:16'b0;
n6=b[6]?{2'b0,a,6'b0}:16'b0;
n5=b[5]?{3'b0,a,5'b0}:16'b0;
n4=b[4]?{4'b0,a,4'b0}:16'b0;
n3=b[3]?{5'b0,a,3'b0}:16'b0;
n2=b[2]?{6'b0,a,2'b0}:16'b0;
n1=b[1]?{7'b0,a,1'b0}:16'b0;
n0=b[0]?{8'b0,a}:16'b0;

end

adder_16 add_01(
    .a (n0),
    .b (n1),
    .sum (add01)
);
adder_16 add_23(
    .a (n2),
    .b (n3),
    .sum (add23)
);
adder_16 add_45(
    .a (n4),
    .b (n5),
    .sum (add45)
);
adder_16 add_67(
    .a (n6),
    .b (n7),
    .sum (add67)
);
adder_16 add_0123(
    .a (add01),
    .b (add23),
    .sum (add0123)
);
adder_16 add_4567(
    .a (add45),
    .b (add67),
    .sum (add4567)
);
adder_16 add_01234567(
    .a (add0123),
    .b (add4567),
    .sum (z)
);

endmodule
*/

module main(
input [3:0] a,
input [3:0] b,
input in,
input op,
output [15:0] led_id
);
wire [15:0] s1;
wire n;
add_sub addersub(
.a  (a),
.b  (b),
.cin (in==1?1'b1:1'b0),
.operator(op),
.result(s1),
.overflow(n)
);
assign led_id=n;
endmodule
