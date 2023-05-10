`timescale 1ns / 1ps

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


module adder_8(
 input [7:0] a,
 input [7:0] b,
 input cin,
 output cout,
 output [7:0] s,
 output overflow
);
wire[7:0] carryout;

adder adder0(
.ia  (a[0]),
.ib  (b[0]),
.cin (cin),
.cout  (carryout[0]),
.sum  (s[0])
);

genvar i;
generate
for(i=1; i<8; i=i+1) begin: adder_gen
adder adder_gen(
.ia  (a[i]),
.ib  (b[i]),
.cin (carryout[i-1]),
.cout  (carryout[i]),
.sum  (s[i])
);
end
endgenerate

assign overflow=carryout[6]^carryout[7];
/*有符号加法溢出，发生在同号数相加时符号位不正确时
若同为正，符号位为0，c[7]一定为0
此时若有来自c[6]的进位，则s[7]即和的符号位为1，发生错误；
反之，符号位同为1，c[7]=1，s[7]=1⊕1⊕c[6]
显然若c[6]=0，则s[7]=0，符号错误；
易知上述两种情况均是c[7]^c[6]=1
*/
assign cout=carryout[7];

endmodule


module add_sub(
input [7:0] a,
input [7:0] b,
input cin,
input operator,
output [7:0] result,
output ZF,
       CF,
       OF,
       SF,
       PF
);

wire [7:0] re;
wire tag[1:0];
wire co[1:0];

adder_8 add1(
.a  (a),
.b  (b^{8{operator}}),//b或~b
.cin (operator),//若为减法，取反后要加1
.s(re),
.overflow(tag[0]),
.cout(co[0])
);

adder_8 add2(//单独处理进位
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
assign SF=result[7];
assign PF=~(^result);

endmodule


module baseop(
input [7:0]a,
input [7:0]b,
input [2:0]aluc,
output [7:0]r,
output ZF,
       CF,
       OF,
       SF,
       PF
);

reg[7:0]tempres;

always@(*)
    case(aluc)
    3'b100:tempres=a&b;
    3'b101:tempres=a|b;
    3'b110:tempres=a^b;
    3'b111:tempres=~(a|b);
    endcase

assign r=tempres;
assign ZF=~|r;
assign CF=0;
assign OF=0;
assign SF=r[7];
assign PF=~(^r);

endmodule


module mult(
 input [3:0] a,
 input [3:0] b,
 output [7:0] s,
 output ZF,
        CF,
        OF,
        SF,
        PF
);

wire [3:0] ta0,ta1,ta2;
wire [3:0] ra;
wire [6:0] s1,s2;

assign ta0=a&{4{b[0]}};
assign ta1=a&{4{b[1]}};
assign ta2=a&{4{b[2]}};
//ra=(~a)+1=(-a)
add_sub adderr(
.a((~a)),
.b(1),
.cin(0),
.operator(0),
.result(ra),
.ZF(),
.CF(),
.OF(),
.SF(),
.PF()
);

adder_8 add1(
.a({{3{a[3]&b[0]}}, ta0}),
.b({{2{a[3]&b[1]}}, ta1, {1'b0}}),
.cin(0),
.cout(),
.s(s1[6:0]),
.overflow()
);

adder_8 add2(
.a({{1{a[3]&b[2]}}, ta2,{2'b00}}),
.b({ra&{4{b[3]}},{3'b000}}),
.cin(0),
.cout(),
.s(s2[6:0]),
.overflow()
);

adder_8 add3(
.a(s1),
.b(s2),
.cin(0),
.cout(),
.s(s[6:0]),
.overflow()
);

assign s[7]=(a[3]^b[3])&~(a==4'b0)&~(b==4'b0);

assign ZF=~|s;
assign CF=1'b0;
assign OF=1'b0;
assign SF=s[7];
assign PF=~(^s);

endmodule


module ALU(
 input[7:0]a,
 input[7:0]b,
 input[3:0]aluc,
 input cin,
 output reg [7:0]r,
 output reg ZF,
 output reg CF,
 output reg OF,
 output reg SF,
 output reg PF
);

wire [7:0] r1,r2;
wire [7:0]r3;
reg [7:0]temp;
wire [2:0]zf,cf,of,sf,pf;
reg [4:0]flag;

add_sub adder(
.a(a),
.b((aluc[0]^aluc[2])==1?1'b1:b),
.cin(cin),
.operator(aluc[1]),
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
.aluc(aluc[2:0]),
.r(r2[7:0]),
.ZF(zf[0]),
.CF(cf[0]),
.OF(of[0]),
.SF(sf[0]),
.PF(pf[0])
);

mult Mult(
.a(a),
.b(b),
.s(r3),
.ZF(zf[2]),
.CF(cf[2]),
.OF(of[2]),
.SF(sf[2]),
.PF(pf[2])
);

always@(*)
case(aluc)
4'b0000,4'b0001,4'b0010,4'b0011:begin
    temp=r1;
    flag[0]=zf[1];
    flag[1]=cf[1];
    flag[2]=of[1];
    flag[3]=sf[1];
    flag[4]=pf[1];
    end
4'b0100,4'b0101,4'b0110:begin
    temp=r2;
    flag[0]=zf[0];
    flag[1]=cf[0];
    flag[2]=of[0];
    flag[3]=sf[0];
    flag[4]=pf[0];
    end
4'b0111:
        temp=sf[1]^of[1];
4'b1100:begin
    temp=r3;
    flag[0]=zf[2];
    flag[1]=cf[2];
    flag[2]=of[2];
    flag[3]=sf[2];
    flag[4]=pf[2];
    end
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

module Control(
 input [7:0] Inst,
 output [1:0] ALUSrcA,
 output [1:0] ALUSrcB,//reg2loc
 output DBDataSrc,//结果来自alu或输入
 output RegWre,
 output read,
 output [1:0] RegDst,//写寄存器地址
 output [3:0] ALUop,
 output [3:0] DataIn
);

assign ALUSrcA=Inst[3:2];
assign ALUSrcB=Inst[1:0];
assign read=(Inst[7:2]==6'b111100)?1:0;
assign DBDataSrc=(Inst[7:6]==2'b10)?1:0;
assign RegWre=(Inst[7:2]==6'b111100)?0:1;
assign RegDst=(Inst[7:6]==2'b10)?Inst[5:4]:2;//为1 地址来自指令Inst[5:4]，否则默认为r2
assign ALUop=Inst[7:4];
assign DataIn=Inst[3:0];

endmodule

module PC(clk,rstn,Addr);
input clk,rstn;
output [7:0] Addr;
reg [7:0] Addr;
wire [7:0] pcadd1;
initial begin
        Addr=-1;
end

adder_8 pcadd(
.a(Addr),
.b(1),
.cin(0),
.cout(),
.s(pcadd1),
.overflow()
);

always @(posedge clk or negedge rstn) begin
        if(!rstn)Addr=0;
        else Addr=pcadd1;
end

endmodule

module regfile(
        input clk,RegWre,DBDataSrc,
        input[1:0]addr1,addr2,RegDst,
        input [7:0] DatafromALU,
        input [3:0] DatafromInput,
        output [7:0] Data1,Data2,
        output [7:0]r0,r1,r2
);

reg [7:0] register[4:0];
reg [7:0] d1,d2;
initial begin
        register[0]<=0;
        register[1]<=0;
        register[2]<=0;
        register[3]<=0;
end

assign Data1=register[addr1];
assign Data2=register[addr2];

always @(posedge clk)begin
        if(RegWre)register[RegDst]=(DBDataSrc==1)?{{4{DatafromInput[3]}},DatafromInput}:DatafromALU;
        else register[RegDst]=register[RegDst];
end

assign r0=register[0];
assign r1=register[1];
assign r2=register[2];

endmodule

module InstMemory(
        input [7:0] pc,
        output [7:0] Inst
);

reg [7:0] mem[31:0];
reg [7:0] ins;

integer i;
initial begin
        for (i = 0; i < 32; i = i+1) mem[i] = 0;
        mem[1]=8'b10000010;
        mem[2]=8'b10011000;
        mem[3]=8'b11000001;
        mem[4]=8'b00111000;
        mem[5]=8'b01011000;
        mem[6]=8'b00000110;
        mem[7]=8'b11110010;

end
always @(pc)begin
        ins=mem[pc];
end
assign Inst=ins;

endmodule

module CPU(
 input clk,rstn,
 output  ZF,
 output  CF,
 output  OF,
 output  SF,
 output  PF,
 output [7:0]result,
 output [7:0]PCaddr,
 output [7:0]data1,
 output [7:0]data2,
 output [7:0]inst,
 output [7:0]r,
 output [7:0]r0,
 output [7:0]r1,
 output [7:0]r2
);

wire DBDataSrc,read,RegWre;
wire [7:0]Inst;
wire [1:0]ALUSrcA,ALUSrcB,RegDst;
wire [3:0]ALUop;
wire [7:0]Data1,Data2;
wire [7:0]ALUresult;
wire [3:0]DataIn;
reg [7:0]res=0;

ALU alu(Data1,Data2,ALUop,0,ALUresult,ZF,CF,OF,SF,PF);
PC pcmux(clk,rstn,PCaddr);
Control con(Inst,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,read,RegDst,ALUop,DataIn);
InstMemory Ins(PCaddr,Inst);
regfile register(clk,RegWre,DBDataSrc,ALUSrcA,ALUSrcB,RegDst,ALUresult,DataIn,Data1,Data2,r0,r1,r2);

always @(posedge clk)begin
        if(read)res=Data2;
        else begin
            if(DBDataSrc==1)res=0;
            else res=ALUresult;
        end
end

assign result=res;
assign data1=Data1;
assign data2=Data2;
assign inst=Inst;
assign DataSrc=DBDataSrc;
assign r=ALUresult;
assign op=RegDst;

endmodule