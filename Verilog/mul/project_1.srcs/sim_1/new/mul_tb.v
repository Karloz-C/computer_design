`timescale 1ns/1ps
module mul_test;
  reg [3:0] x;
  reg [3:0] y;
  wire [7:0] z;
mult u1(x,y,z);

initial
begin
   x=4'b0001; y=4'b0001;
end

always #0.001
begin
    y=y+1;
    if(y==4'b1111)
    begin
        x=x+1;
        y=4'b0001;
    end
$monitor("x=%d y=%d z=%d",
          $time,x,y,z);

    if(x==4'b1111&&y==4'b1111)
    begin
    $stop;
    end
end
endmodule