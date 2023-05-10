module adder(
input ia,
input ib,
input cin,
output cout,
output sum
);

assign cout=(ia & ib) | (cin & (ia | ib));
assign sum=ia^ib^cin;

endmodule

module adder_4(
 input [3:0] a,
 input [3:0] b,
 input cin,
 output cout,
 output [3:0] s,
 output overflow

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
assign cout=carryout[3];

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

module adder_8(
 input [7:0] a,
 input [7:0] b,
 output [7:0] s
);
wire [7:0]sh,sl;
wire cotemp;

alu adder1 (
.a(a[3:0]),
.b(b[3:0]),
.aluc(0),
.cin(0),
.r(sl),
.ZF(),
.CF(cotemp),
.OF(),
.SF(),
.PF()
);
alu adder2(
.a(a[7:4]),
.b(b[7:4]),
.aluc(0),
.cin(cotemp),
.r(sh),
.ZF(),
.CF(),
.OF(),
.SF(),
.PF()
);

assign s[3:0]=sl;
assign s[7:4]=sh;

endmodule

module mult(
 input [3:0] a,
 input [3:0] b,
 output [7:0] s
);

wire [3:0] ta0,ta1,ta2;
wire [3:0] ra;
wire [6:0] s1,s2;

assign ta0=a&{4{b[0]}};
assign ta1=a&{4{b[1]}};
assign ta2=a&{4{b[2]}};

alu reverse(
.a((~a)),
.b(1),
.aluc(0),
.cin(0),
.r(ra),
.ZF(),
.CF(),
.OF(),
.SF(),
.PF()
);

//assign ra=(~ta)+1;
adder_8 add1(
.a({{3{a[3]&b[0]}}, ta0}),
.b({{2{a[3]&b[1]}}, ta1, {1'b0}}),
.s(s1[6:0])
);

adder_8 add2(
.a({{1{a[3]&b[2]}}, ta2,{2'b00}}),
.b({ra&{4{b[3]}},{3'b000}}),
.s(s2[6:0])
);

adder_8 add3(
.a(s1),
.b(s2),
.s(s[6:0])
);

assign s[7]=a[3]^b[3];

endmodule