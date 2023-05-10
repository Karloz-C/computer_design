module DIVU(
input [3:0]dividend, //被除数
input [3:0]divisor, //除数
output reg [3:0]q, //商
output reg [3:0]r //余数
);

reg[3:0] tempa;
reg[3:0] tempb;
reg[7:0] temp_a;
reg[7:0] temp_b;

integer i;

always @(dividend or divisor)
begin
    tempa <= dividend;
    tempb <= divisor;
end

always @(tempa or tempb)
begin
    temp_a = {4'b0000,tempa};
    temp_b = {tempb,4'b0000};
    for(i = 0; i < 4; i = i + 1)
        begin
            temp_a = temp_a << 1;
            if(temp_a[7:4] >= tempb)
                temp_a = temp_a - temp_b + 1'b1;//商加1，存在低四位，且随temp_a左移，最终余数在高四位
            else
				temp_a = temp_a;
        end

    q <= temp_a[3:0];
    r <= temp_a[7:4];
end

endmodule

module signed_div(
    input [3:0]dividend, //被除数
    input [3:0]divisor, //除数
    output reg [3:0]q, //商
    output reg [3:0]r //余数
);

reg[3:0] tempa;
reg[3:0] tempb;
reg[7:0] temp_a;
reg[7:0] temp_b;
reg[3:0] tq,tr;

integer i;

always @(dividend or divisor)
begin
    if(dividend[3])tempa<=(~dividend)+1;
    else tempa<=dividend;
    if (divisor[3])tempb<=(~divisor)+1;
    else tempb<=divisor;
end

always @(tempa or tempb)
begin
    temp_a = {4'b0000,tempa};
    temp_b = {tempb,4'b0000};
    for(i = 0; i < 4; i = i + 1)
        begin
            temp_a = temp_a << 1;
            if(temp_a[7:4] >= tempb)
                temp_a = temp_a - temp_b + 1'b1;//商加1，存在低四位，且随temp_a左移，最终余数在高四位
            else
				temp_a = temp_a;
        end

    tq <= temp_a[3:0];
    tr <= temp_a[7:4];
end

always @(tq or tr) begin
    if(dividend[3]^divisor[3])assign q=~(tq-1);
    else assign q=tq;
    if(dividend[3])assign r=~(tr-1);
    else assign r=tr;
end

endmodule