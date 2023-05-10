`timescale 1ns/1ps
module mul_test;
  reg [7:0] x;
  reg [7:0] y;
  wire [15:0] z;
MULT u1(x,y,z);

initial
begin
   x=8'b0000_0001; y=8'b0000_0001;
end

always #0.001
begin
    y=y+1;
    if(y==8'b1111_1111)
    begin
        x=x+1;
        y=8'b0000_0001;
    end
$monitor("x=%d y=%d z=%d",
          $time,x,y,z,);

    if(x==8'b1111_1111&&y==8'b1111_1111)
    begin
    $stop;
    end
end
endmodule