`timescale 1ns / 1ps

module RAM(
input clk, // 输入时钟
input wena, // 低电平表示读数据，高电平表示写数据 用开关 SW1 表示
input [4:0] addr, // 用开关 SW2-SW6 表示 5 位的地址
input [7:0] data_in, // 用开关 SW7-SW14 表示输入的 8 位二进制数据
output [7:0] data_out // 输出数据 输出在 LED 灯上或数码管上
);
reg [7:0] mymem [31:0]; // 定义 32 个 8 位存储器（mymem[i]表示第 i 个存储器）

reg [7:0] tempdata;
always @(posedge clk) begin
    if(wena)mymem[addr]<=data_in;
    else tempdata<=mymem[addr];
end

assign data_out=wena?8'bz:tempdata;

endmodule