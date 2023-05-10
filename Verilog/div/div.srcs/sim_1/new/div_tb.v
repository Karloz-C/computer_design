`timescale 1ns/1ps
module mul_test;
  reg [3:0] x;
  reg [3:0] y;
  wire [3:0] q;
  wire [3:0] r;
signed_div div(x,y,q,r);

initial
begin
   x=4'b0001; y=4'b0001;
end

always #0.001
begin
    y=y+1;
    if(y==4'b0000)
    begin
        x=x+1;
        y=4'b0001;
    end
$monitor("x=%d y=%d q=%d r=%d",
          $time,x,y,q,r);

    if(x==4'b1111&&y==4'b1111)
    begin
    $stop;
    end
end
endmodule