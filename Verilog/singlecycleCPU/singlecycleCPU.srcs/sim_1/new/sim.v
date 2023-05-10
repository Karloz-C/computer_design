module SingleCircleCPUTest;

    // Inputs
    reg CLK;
    reg Reset;

    // Outputs
    wire [7:0] result;
    wire [7:0] pc;
    wire [7:0]data1;
    wire [7:0]data2;
    wire [7:0]inst;
    wire [7:0]ALUresult;
    wire [7:0] r0,r1,r2;
    wire ZF,CF,OF,SF,PF;

    // Instantiate the Unit Under Test (UUT)
    CPU uut(
    .clk(CLK),
    .rstn(Reset),
    .ZF(ZF),
    .CF(CF),
    .OF(OF),
    .SF(SF),
    .PF(PF),
    .result(result),
    .PCaddr(pc),
    .data1(data1),
    .data2(data2),
    .inst(inst),
    .r(ALUresult),
    .r0(r0),
    .r1(r1),
    .r2(r2)
    );

    initial begin
        // Initialize Inputs
        CLK = 0;
        Reset = 0;
        #5; // 刚开始设置pc为0
            CLK = 1;
        #5;
            Reset = 1;
        forever #5 begin // 产生时钟信号
            CLK = !CLK;
        end
    end

endmodule