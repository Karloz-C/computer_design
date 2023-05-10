del *.vvp
REM pause 
iverilog -o full_adder.vvp full_adder.v full_adder_tb.v
vvp -n full_adder.vvp
gtkwave full_adder_tb.vcd

pause