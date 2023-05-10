`timescale 1ns / 1ps
`define DEBUG
module add_1(ia,ib,cin,cout,sum);
    input ia;
    input ib;
    input cin;
    output cout;
    output sum;

    assign sum=ia^ib^cin;
    assign cout=(ia&ib)|((ia|ib)&cin);

endmodule

module full_adder (load,clk,a,b,cin,s,CF,OF);
//---------input, output----------
    parameter ADDER_LENGTH=8;
	input load;
	input clk;
	// input rst;
    input [ADDER_LENGTH-1:0]a;   //operand a
    input [ADDER_LENGTH-1:0]b;   //operand b
    input cin;
    output reg [ADDER_LENGTH-1:0] s;    //sum
    output CF;                      //carry flag
    output OF;                      //overflow flag

//---------wires, registers----------

	wire ia,ib,ocout,odat;
	reg icin;
	reg [ADDER_LENGTH-1:0] tempa;
	reg [ADDER_LENGTH-1:0] tempb;
	reg [ADDER_LENGTH-1:0] tempresult;
	reg [ADDER_LENGTH-1:0] EXTRACT = {{ADDER_LENGTH-1{1'b0}},1'b1};

//---------combinational processes----------
	assign OF=a[ADDER_LENGTH-1] == b[ADDER_LENGTH-1]?
				(a[ADDER_LENGTH-1] == s[ADDER_LENGTH-1]?0:1)
				:0;
	assign CF=ocout;
	assign ia=tempa[0];
	assign ib=tempb[0];

//---------instantiations--------------------
// instantiate ADDER_LENGTH add_1 for full_adder
//add_1 FirstBit  (a[0],b[0],cin,icin,s[0]);
add_1 FullAdder (ia,ib,icin,ocout,odat);

	always@(posedge clk)
	if(load)
		begin
			tempa<=a;
			tempb<=b;
			icin<=cin;
			tempresult<=0;
			s<={ADDER_LENGTH{1'b0}};
			EXTRACT<= {{ADDER_LENGTH-1{1'b0}},1'b1};
		end
	else
		begin
			tempa <= {1'b0,tempa[ADDER_LENGTH-1:1]};
			tempb <= {1'b0,tempb[ADDER_LENGTH-1:1]};
			icin<=ocout;
			tempresult<= {ADDER_LENGTH{odat}} & EXTRACT;
			s <= s|tempresult;
			EXTRACT <= EXTRACT<<1;
		end

	reg [3:0]cnt=4'b0;
	always@(posedge clk)
		cnt <= cnt+1;

`ifdef DEBUG
always @(posedge clk)
begin
	$display( "time=",$time,   "\t tempa= %b  tempb=%b load=%d",tempa,tempb,load);
	$display( "time=",$time,   "\t ia= %x  ib=%x  icin=%d odat=%d ",ia,ib,icin,odat);
    $display( "time=",$time,   "\t cnt= %d  EXTRACT=%b {ADDER_LENGTH{odat}}=%b, tempresult=%b s=%b \n",cnt,EXTRACT,{ADDER_LENGTH{odat}},tempresult,s);
end
`endif

endmodule

// module add_sub(clk,a,b,cin,operator,result,CF,OF);
    // parameter LENGTH = 8;
	// input clk;
    // input [LENGTH-1:0] a;
    // input [LENGTH-1:0] b;
    // input cin;
    // input operator; //operator = 0 execute adder; operator = 1 execute subtracter
    // output [LENGTH-1:0]result;
    // output CF;  //carry flag
    // output OF;  //overflow flag

	// // compute 2's complement
    // wire [LENGTH-1:0] complement;
    // full_adder compute_complement ( .clk(clk), .a(b^{LENGTH{1'b1}}), .b({{(LENGTH-1){1'b0}},1'b1}), .cin(1'b0), .s(complement), .CF(),  .OF());

	// // real computation
    // wire [LENGTH-1:0] addend = operator == 1 ? complement : b;
    // full_adder computation ( .clk(clk), .a(a), .b(complement), .cin(1'b0), .s(result), .CF(CF), .OF(OF));

// endmodule


