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
wire [3:0]g,p;
wire [4:1]c;

assign p[0]=a[0]^b[0],
       p[1]=a[1]^b[1],
       p[2]=a[2]^b[2],
       p[3]=a[3]^b[3];

assign g[0]=a[0]&b[0],
       g[1]=a[1]&b[1],
       g[2]=a[2]&b[2],
       g[3]=a[3]&b[3];

assign c[1]=g[0]|(p[0]&cin),
       c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin),
       c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin),
       c[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);

assign s[0]=p[0]^cin,
       s[1]=p[1]^c[1],
       s[2]=p[2]^c[2],
       s[3]=p[3]^c[3];

assign overflow=c[4];
assign cout=c[4];

endmodule

module adder_16(
input [15:0] a, //四位有符号数补码
input [15:0] b,//四位有符号数补码
input cin, //低位进位信号
output cout,//进位信号
output [15:0] s,//四位和数补码形式
output overflow //溢出标志
);

wire c3,c7,c11,c15;

adder_4 a1(a[3:0],b[3:0],cin,s[3:0],c3);
adder_4 a2(a[7:4],b[7:4],c3,s[7:4],c7);
adder_4 a3(a[11:8],b[11:8],c7,s[11:8],c11);
adder_4 a4(a[15:12],b[15:12],c11,s[15:12],c15);

assign cout=c15;

endmodule

module add_sub(
input [3:0] a,
input [3:0] b,
input cin,
input operator,
output [3:0] result,
output ZF,
       CF,
       OF,
       SF,
       PF
);
reg [3:0] nb;
wire [3:0] re;
wire tag[1:0];
wire co[1:0];

adder_4 add1(
.a  (a),
.b  (b^{4{operator}}),
.cin (operator),
.s(re),
.overflow(tag[0]),
.cout(co[0])
);

adder_4 add2(
.a  (re),
.b  (0),
.cin (cin),
.s(result),
.overflow(tag[1]),
.cout(co[1])
);

assign ZF=~|result;
assign CF=(co[0]|co[1])^operator;
assign OF=tag[1]|tag[0];
assign SF=result[3];
assign PF=^result;

endmodule

module baseop(
input [3:0]a,
input [3:0]b,
input [2:0]aluc,
output [3:0]r,
output ZF,
       CF,
       OF,
       SF,
       PF
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
assign ZF=~|r;
assign CF=0;
assign OF=0;
assign SF=r[3];
assign PF=^r;
endmodule

module alu(
	input[3:0]a,
	input[3:0]b,
	input[2:0]aluc,
	input cin,
	output reg [3:0]r,
	output reg ZF,
	output reg CF,
 	output reg OF,
 	output reg SF,
 	output reg PF
);
wire [3:0] r1,r2;
reg [3:0]temp;
wire [1:0]zf,cf,of,sf,pf;
reg [4:0]flag;

add_sub adder(
.a(a),
.b(b),
.cin(cin),
.operator(aluc[0]^aluc[1]),
.result(r1),
.ZF(zf[1]),
.CF(cf[1]),
.OF(of[1]),
.SF(sf[1]),
.PF(pf[1])
);

baseop base(
.a(a),
.b(b),
.aluc(aluc),
.r(r2),
.ZF(zf[0]),
.CF(cf[0]),
.OF(of[0]),
.SF(sf[0]),
.PF(pf[0])
);

always@(*)
case(aluc)
3'b000,3'b001:begin
        temp=r1;
        flag[0]=zf[1];
        flag[1]=cf[1];
        flag[2]=of[1];
        flag[3]=sf[1];
        flag[4]=pf[1];
        end
3'b010,3'b011,3'b100,3'b101:begin
        temp=r2;
        flag[0]=zf[0];
        flag[1]=cf[0];
        flag[2]=of[0];
        flag[3]=sf[0];
        flag[4]=pf[0];
        end
3'b110:
        temp=cf[1];
default:;
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

module PCadder(
    input [15:0] pc,
    output [15:0] pc_o
);

adder_16 pcadder(pc,2,0,pc_o);

endmodule


module InstructionMemory(
    input [15:0] Addr,
    output [15:0]instruction
);
reg[31:0]Rom[15:0];
assign instruction=Rom[Addr[5:1]];
endmodule

module pc_MUX(
    input [15:0] Addr1,Addr2,
    input select,
    output pcaddr
);
assign pcaddr=select==0?Addr1:Addr2;
endmodule

module control(
    input [15:0] Inst,
    output reg [4:0] aluc,
    output reg [1:0] regAddr1,
    output reg [1:0] regAddr2,
    output reg [1:0] memreg,
    output reg wena,
    output reg rena,
    output reg [3:0] data
);
always @( *) begin
    case(Inst[7:6])
    2'b00,2'b01:begin
        aluc={1'b1,Inst[7:4]};
        regAddr1=Inst[3:2];
        regAddr2=Inst[1:0];
        wena=0;rena=0;
    end
    2'b10:begin
        aluc[4]=0;
        wena=1;rena=0;
        memreg=Inst[5:4];
        data=Inst[3:0];
    end
    2'b11:begin
        if(Inst[5]==0)begin
            aluc={1'b1,Inst[7:4]};
            regAddr1=Inst[3:2];
            regAddr2=Inst[1:0];
            wena=0;rena=0;
        end
        else begin
            aluc[4]=0;
            wena=0;rena=1;
            memreg=Inst[1:0];
        end
    end
    endcase
end
endmodule









module TOP (
    input[3:0]a,
	input[3:0]b,
    input cin,
    output reg out,
	output reg [3:0]r
);

endmodule