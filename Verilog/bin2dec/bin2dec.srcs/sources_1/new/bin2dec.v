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
    input clk,          //ʱ��
    input [7:0] n,
    output reg [7:0] led_id,
    output reg [6:0] out_led
    );
parameter CLK_COUNT = 249999;//ʱ�Ӽ�������
reg [31:0] count;//����
reg [1:0] id,flag=0;//id0~3��Ӧ�����ĸ�����ܣ�flag��ǲ����Ƿ��ʾ����

    //8λ2���ƣ�ʮ��������3λ
    wire [7:0] n1;    //��λ
    wire [7:0] n2;    //ʮλ
    wire [7:0] n3;    //��λ
/*  ��Ϊ�޷�����
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
    
always @ (posedge clk)//ʱ��������
begin //����ʱ���źſ����л���ʾ�������
    if (count == CLK_COUNT)
    begin
        count <= 0;
        id <= (id + 1);//�л�
    end
    else
        count <= count+1;
    end
    always @ (id)
    begin        
    if (id == 0) 
            begin           
                led_id <= 8'b1111_0111;//����˵���
                if(flag==1)
                out_led<=7'b1111110;//����
                else out_led<=7'b1111111;//����ʾ
            end
    else if (id == 1)//������������ʾ�߼���ͬ
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
