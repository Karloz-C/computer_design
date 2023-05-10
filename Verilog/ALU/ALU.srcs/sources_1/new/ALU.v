module adder(
input ia, //1 位二进制加数
input ib,//1 位二进制加数
input cin,//低位来的进位信号
output cout,//向高位的进位信号
output sum //1 位和数
);

assign cout=(ib && cin) || (ia && cin) || (ia && ib); //产生进位
assign sum=ia^ib^cin; //异或得到的三位加和

endmodule

module adder_4(
 input [3:0] a, //四位有符号数补码
 input [3:0] b,//四位有符号数补码
 input cin, //低位进位信号
 output cout,//进位信号
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
assign overflow=carryout[1]^carryout[2];
assign cout=carryout[3];

endmodule

module add_sub(
input [3:0] a,//四位有符号数补码
input [3:0] b,//四位有符号数补码
input cin,//低位来的进位信号
input operator,//决定加法还是减法
output [3:0] result,//运算结果补码形式
output ZF, //0 标志位, 运算结果为 0(全零)则置 1, 否则置 0
       CF, //进借位标志位,
       OF, //溢出标志位
       SF, //符号标志位，与 F 的最高位相同
       PF //奇偶标志位，F 有奇数个 1，则 PF=1，否则为 0
);
reg [3:0] nb;
wire [3:0] re;
wire tag[1:0];
wire co[1:0];
reg cftemp;
reg pftemp;
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
.overflow(tag[0]),
.cout(co[0])
);

adder_4 add(
.a  (re),
.b  (0),
.cin (cin==1?1'b1:1'b0),
.s(result),
.overflow(tag[1]),
.cout(co[1])
);

always@(*)
       cftemp=((a[3]&b[3])^result[3])^operator;
end

assign ZF=result==0?1:0;
assign CF=cftemp;
assign OF=tag[1]|tag[0];
assign SF=result[3];
assign PF=0^result[3]^result[2]^result[1]^result[0];

endmodule

module baseop(
input [3:0]a, //操作数 a
input [3:0]b, //操作数 b
input [2:0]aluc, //控制 alu 的操作
output [3:0]r, //运算结果
output ZF, //0 标志位, 运算结果为 0(全零)则置 1, 否则置 0
       CF, //进借位标志位,
       OF, //溢出标志位
       SF, //符号标志位，与 F 的最高位相同
       PF //奇偶标志位，F 有奇数个 1，则 PF=1，否则为 0
);

reg[3:0]tempres;

always@(*)
case(aluc)
3'b010:tempres=a&b;
3'b011:tempres=a|b;
3'b100:tempres=a^b;
3'b101:tempres=~(a|b);
endcase

assign r=tempres;
assign ZF=r==0?1:0;
assign CF=0;
assign OF=0;
assign SF=r[3];
assign PF=0^r[3]^r[2]^r[1]^r[0];
endmodule

/*
module slt(
input [3:0]a,
input [3:0]b,
output [3:0]c,
output flag
);

assign flag=c[3];

endmodule
*/

module alu(
	input[3:0]a,
	input[3:0]b,
	input[2:0]aluc,
	output reg [3:0]r,
	output reg ZF, //0 标志位, 运算结果为 0(全零)则置 1, 否则置 0
	output reg CF, //进借位标志位,
 	output reg OF, //溢出标志位
 	output reg SF, //符号标志位，与 F 的最高位相同
 	output reg PF  //奇偶标志位，F 有奇数个 1，则 PF=1，否则为 0
);
wire [3:0]r1;
wire [3:0]r2;
reg [3:0]temp;
wire [1:0]zf;
wire [1:0]cf;
wire [1:0]of;
wire [1:0]sf;
wire [1:0]pf;
reg [4:0]flag;

add_sub adder(
.a(a),//四位有符号数补码
.b(b),//四位有符号数补码
.cin(),//低位来的进位信号
.operator(aluc[0]^aluc[1]),//决定加法还是减法
.result(r1),//运算结果补码形式
.ZF(zf[1]), //0 标志位, 运算结果为 0(全零)则置 1, 否则置 0
.CF(cf[1]), //进借位标志位,
.OF(of[1]), //溢出标志位
.SF(sf[1]), //符号标志位，与 F 的最高位相同
.PF(pf[1])  //奇偶标志位，F 有奇数个 1，则 PF=1，否则为 0
);

baseop base(
.a(a), //操作数 a
.b(b), //操作数 b
.aluc(aluc), //控制 alu 的操作
.r(r2), //运算结果
.ZF(zf[0]), //0 标志位, 运算结果为 0(全零)则置 1, 否则置 0
.CF(cf[0]), //进借位标志位,
.OF(of[0]), //溢出标志位
.SF(sf[0]), //符号标志位，与 F 的最高位相同
.PF(pf[0])  //奇偶标志位，F 有奇数个 1，则 PF=1，否则为 0
);

always@(*)
case(aluc)
3'b000:begin
        temp=r1;
        flag[0]=zf[1];
        flag[1]=cf[1];
        flag[2]=of[1];
        flag[3]=sf[1];
        flag[4]=pf[1];
        end
3'b001:begin
        temp=r1;
        flag[0]=zf[1];
        flag[1]=cf[1];
        flag[2]=of[1];
        flag[3]=sf[1];
        flag[4]=pf[1];
        end
3'b010:
        begin
        temp=r2;
        flag[0]=zf[0];
        flag[1]=cf[0];
        flag[2]=of[0];
        flag[3]=sf[0];
        flag[4]=pf[0];
        end
3'b011:
        begin
        temp=r2;
        flag[0]=zf[0];
        flag[1]=cf[0];
        flag[2]=of[0];
        flag[3]=sf[0];
        flag[4]=pf[0];
        end
3'b100:
        begin
        temp=r2;
        flag[0]=zf[0];
        flag[1]=cf[0];
        flag[2]=of[0];
        flag[3]=sf[0];
        flag[4]=pf[0];
        end
3'b101:
        begin
        temp=r2;
        flag[0]=zf[0];
        flag[1]=cf[0];
        flag[2]=of[0];
        flag[3]=sf[0];
        flag[4]=pf[0];
        end
3'b110:
        temp=cf[1];
default:
;
endcase

always@(*)
begin
r=temp;
ZF=flag[0];
CF=flag[1];
OF=flag[2];
SF=flag[3];
PF=flag[4];
end

endmodule