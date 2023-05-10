`timescale 1ns / 1ps
//////////////////////////////////////////////////////////
////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/15 17:10:25
// Design Name: 
// Module Name: bin2dec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////
////////////////////////
module bin2dec (
    input clk,          //时钟
    input [7:0] n,
    output reg [7:0] led_id,
    output reg [6:0] out_led
    );
parameter CLK_COUNT = 249999;//时钟计数上限
reg [31:0] count;//计数
reg [1:0] id,flag=0;//id0~3对应左到右四个数码管，flag标记补码是否表示负数

    //8位2进制，十进制至多3位
    wire [7:0] n1;    //百位
    wire [7:0] n2;    //十位
    wire [7:0] n3;    //个位
/*  改为无符号数
    always @(*)begin
    assign n=number;
    if(number>127)n=256-number;
    flag1=1;
    end
    assign number=256-number;
*/
    assign n1 = n / 100 % 10;
    assign n2 = n / 10 % 10;
    assign n3 = n % 10;
    
always @ (posedge clk)//时钟上升沿
begin //根据时钟信号控制切换显示的数码管
    if (count == CLK_COUNT)
    begin
        count <= 0;
        id <= (id + 1);//切换
    end
    else
        count <= count+1;
    end
    always @ (id)
    begin        
    if (id == 0) 
            begin           
                led_id <= 8'b1111_0111;//最左端灯亮
                if(flag==1)
                out_led<=7'b1111110;//负号
                else out_led<=7'b1111111;//不显示
            end
    else if (id == 1)//其余三个管显示逻辑相同
    begin
        led_id <= 8'b1111_1011;
        begin
            case(n1)
                4'b0000: out_led <= 7'b0000001;    //0
                4'b0001: out_led <= 7'b1001111;    //1
                4'b0010: out_led <= 7'b0010010;    //2
                4'b0011: out_led <= 7'b0000110;    //3
                4'b0100: out_led <= 7'b1001100;    //4
                4'b0101: out_led <= 7'b0100100;    //5
                4'b0110: out_led <= 7'b0100000;    //6
                4'b0111: out_led <= 7'b0001111;    //7
                4'b1000: out_led <= 7'b0000000;    //8
                4'b1001: out_led <= 7'b0000100;    //9
            endcase
        end 
    end
    else if (id == 2)
    begin
        led_id <= 8'b1111_1101;
        begin
            case(n2)
                4'b0000: out_led <= 7'b0000001;    //0
                4'b0001: out_led <= 7'b1001111;    //1
                4'b0010: out_led <= 7'b0010010;    //2
                4'b0011: out_led <= 7'b0000110;    //3
                4'b0100: out_led <= 7'b1001100;    //4
                4'b0101: out_led <= 7'b0100100;    //5
                4'b0110: out_led <= 7'b0100000;    //6
                4'b0111: out_led <= 7'b0001111;    //7
                4'b1000: out_led <= 7'b0000000;    //8
                4'b1001: out_led <= 7'b0000100;    //9
            endcase
        end
    end
    else if (id == 3)
    begin
        led_id <= 8'b1111_1110;
    begin
        case(n3)
            4'b0000: out_led <= 7'b0000001;    //0
            4'b0001: out_led <= 7'b1001111;    //1
            4'b0010: out_led <= 7'b0010010;    //2
            4'b0011: out_led <= 7'b0000110;    //3
            4'b0100: out_led <= 7'b1001100;    //4
            4'b0101: out_led <= 7'b0100100;    //5
            4'b0110: out_led <= 7'b0100000;    //6
            4'b0111: out_led <= 7'b0001111;    //7
            4'b1000: out_led <= 7'b0000000;    //8
            4'b1001: out_led <= 7'b0000100;    //9
        endcase
    end
    end 
end

endmodule
