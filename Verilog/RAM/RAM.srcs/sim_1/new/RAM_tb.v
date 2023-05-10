`timescale  1ns / 1ps

module tb_RAM;

// RAM Parameters
parameter PERIOD  = 10;

// RAM Inputs
reg   clk                                  = 0 ;
reg   wena                                 = 0 ;
reg   [4:0]  addr                          = 0 ;
reg   [7:0]  data_in                       = 0 ;

// RAM Outputs
wire  [7:0]  data_out                      ;

RAM ram(clk,wena,addr,data_in,data_out);

initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    addr=5'b00000;
    data_in=8'b0000_0001;
end

always @(posedge clk ) begin
    wena=~wena;
    if(wena)begin
        data_in=data_in+1;
        addr=addr+1;
    end
    if(addr==5'b11111&&wena==1)
    $finish;
end

endmodule