module adder(
input ia, //1 λ�����Ƽ���
input ib,//1 λ�����Ƽ���
input cin,//��λ���Ľ�λ�ź�
output cout,//���λ�Ľ�λ�ź�
output sum //1 λ����
);

assign cout=(ib && cin) || (ia && cin) || (ia && ib); //������λ
assign sum=ia^ib^cin; //���õ�����λ�Ӻ�

endmodule

module adder_4(
 input [3:0] a, //��λ�з���������
 input [3:0] b,//��λ�з���������
 input cin, //��λ��λ�ź�
 output cout,//��λ�ź�
 output [3:0] s,//��λ����������ʽ
 output overflow //�����־

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
input [3:0] a,//��λ�з���������
input [3:0] b,//��λ�з���������
input cin,//��λ���Ľ�λ�ź�
input operator,//�����ӷ����Ǽ���
output [3:0] result,//������������ʽ
output ZF, //0 ��־λ, ������Ϊ 0(ȫ��)���� 1, ������ 0
       CF, //����λ��־λ,
       OF, //�����־λ
       SF, //���ű�־λ���� F �����λ��ͬ
       PF //��ż��־λ��F �������� 1���� PF=1������Ϊ 0
);
reg [3:0] nb;
wire [3:0] re;
wire tag[1:0];
wire co[1:0];
reg cftemp;
reg pftemp;
//������Ϊ0�Ǽӷ�
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
input [3:0]a, //������ a
input [3:0]b, //������ b
input [2:0]aluc, //���� alu �Ĳ���
output [3:0]r, //������
output ZF, //0 ��־λ, ������Ϊ 0(ȫ��)���� 1, ������ 0
       CF, //����λ��־λ,
       OF, //�����־λ
       SF, //���ű�־λ���� F �����λ��ͬ
       PF //��ż��־λ��F �������� 1���� PF=1������Ϊ 0
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
	output reg ZF, //0 ��־λ, ������Ϊ 0(ȫ��)���� 1, ������ 0
	output reg CF, //����λ��־λ,
 	output reg OF, //�����־λ
 	output reg SF, //���ű�־λ���� F �����λ��ͬ
 	output reg PF  //��ż��־λ��F �������� 1���� PF=1������Ϊ 0
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
.a(a),//��λ�з���������
.b(b),//��λ�з���������
.cin(),//��λ���Ľ�λ�ź�
.operator(aluc[0]^aluc[1]),//�����ӷ����Ǽ���
.result(r1),//������������ʽ
.ZF(zf[1]), //0 ��־λ, ������Ϊ 0(ȫ��)���� 1, ������ 0
.CF(cf[1]), //����λ��־λ,
.OF(of[1]), //�����־λ
.SF(sf[1]), //���ű�־λ���� F �����λ��ͬ
.PF(pf[1])  //��ż��־λ��F �������� 1���� PF=1������Ϊ 0
);

baseop base(
.a(a), //������ a
.b(b), //������ b
.aluc(aluc), //���� alu �Ĳ���
.r(r2), //������
.ZF(zf[0]), //0 ��־λ, ������Ϊ 0(ȫ��)���� 1, ������ 0
.CF(cf[0]), //����λ��־λ,
.OF(of[0]), //�����־λ
.SF(sf[0]), //���ű�־λ���� F �����λ��ͬ
.PF(pf[0])  //��ż��־λ��F �������� 1���� PF=1������Ϊ 0
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