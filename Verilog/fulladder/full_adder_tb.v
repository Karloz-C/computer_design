`timescale 1ns / 1ps
`define DEBUG
//Testbench module
module full_adder_tb();
    
	//internal signals and registers
	reg signed [7:0]  a;
	reg signed [7:0]  b;
	wire signed [7:0]  s;
	wire  CF;
	wire  OF;
	reg  clk         = 1'b0;
	reg load;
    
    initial
    begin
		load=1'b1;
		a = 8'hff;
        b = 8'h22;
		#25
		load=1'b0;
		
		#300
		$finish;
    end
	
	
    // clock generator
    always  begin
		#5 clk = ~clk;
	end
	
	// instantiate design under test
    full_adder F(load,clk,a,b,1'b0,s,CF,OF);

	
//-------------------Debug stuff -------------------   
`ifdef DEBUG
always @(posedge clk)
begin
      $display( "time=",$time,"\t a= %d  b=%d  s=%d  CF=%x  OF=%x ",a,b,s,CF,OF);
end
`endif
endmodule
