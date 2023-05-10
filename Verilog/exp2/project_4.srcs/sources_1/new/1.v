  7 module   BinaryToBCD(CLOCK_50, HEX3, HEX2, HEX1, HEX0);
  8 
  9 input   CLOCK_50;
 10 output  [7:0] HEX3, HEX2, HEX1, HEX0;
 11 
 12 wire      [9:0] TestData;
 13 wire     [15:0]  ResultData;
 14 assign  TestData = 10'd1001;
 15     //Binary to BCD    
 16     Binary2BCD  ConvertData(CLOCK_50, TestData, ResultData);
 17     //Display
 18     Seg7    H1(ResultData[ 3 :  0], HEX0);
 19     Seg7    H2(ResultData[ 7 :  4], HEX1);
 20     Seg7    H3(ResultData[11 :  8], HEX2);
 21     Seg7    H4(ResultData[15 : 12], HEX3);
 22 
 23 endmodule
 24 
 25 //Convert Data by left + 3
 26 module   Binary2BCD(inClk, inData, outData);
 27 input   inClk;
 28 input   [9:0] inData;
 29 output  [15:0]outData;
 30 
 31 
 32 reg     [3:0]count10 = 9;
 33 reg     [15:0]ShiftReg;
 34 
 35 
 36     always@(posedge inClk)
 37     begin
 38         if(count10 >= 0 && count10 <= 9)
 39         begin
 40             count10 <= count10 - 1'b1;      
 41         end
 42         else
 43             count10 <= 4'd15;
 44     end
 45 
 46     always @(posedge inClk)
 47     begin
 48         //for(i = 9; i >= 0; i = i - 1)
 49         if(count10 >= 0 && count10 <= 9)
 50         begin
 51             // shift left 
 52             ShiftReg = (ShiftReg << 1);
 53             ShiftReg[0] = inData[count10];
 54             //adjust by add 3
 55             if(ShiftReg[15:12] > 4)
 56                 ShiftReg[15:12] = ShiftReg[15:12] + 2'd3;
 57             else
 58                 ShiftReg[15:12] = ShiftReg[15:12];
 59             
 60             if(ShiftReg[11:8] > 4)
 61                 ShiftReg[11:8] = ShiftReg[11:8] + 2'd3;
 62             else
 63                 ShiftReg[11:8] = ShiftReg[11:8];            
 64         
 65             if(ShiftReg[7:4] > 4)
 66                 ShiftReg[7:4] = ShiftReg[7:4] + 2'd3;
 67             else
 68                 ShiftReg[7:4] = ShiftReg[7:4];
 69         
 70             if(ShiftReg[3:0] > 4)
 71                 ShiftReg[3:0] = ShiftReg[3:0] + 2'd3;
 72             else
 73                 ShiftReg[3:0] = ShiftReg[3:0];        
 74         
 75                         
 76         end
 77         else
 78             ShiftReg = ShiftReg;
 79     end
 80 
 81         assign outData = ShiftReg;
 82         
 83 endmodule    
 84 
 85 //Display on 7seg
 86 module  Seg7(inData, outData);
 87 input   [3:0]inData;
 88 output  [7:0]outData;
 89 //reg    [3:0]inData;
 90 reg     [7:0]outData;
 91     always@(inData)
 92     begin    
 93     case(inData)     
 94         4'd0: outData = 8'b1100_0000;
 95         4'd1: outData = 8'b1111_1001;
 96         4'd2: outData = 8'b1010_0100;
 97         4'd3: outData = 8'b1011_0000;
 98         4'd4: outData = 8'b1001_1001;
 99         4'd5: outData = 8'b1001_0010;
100         4'd6: outData = 8'b1000_0010;
101         4'd7: outData = 8'b1111_1000;
102         4'd8: outData = 8'b1000_0000;
103         4'd9: outData = 8'b1001_0000;
104         default: outData = 8'b1111_1111;
105      endcase
106      end 
107 endmodule