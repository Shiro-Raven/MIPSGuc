module MIPS(
    input CLK
);

// --- IF Stage --- //
wire [31:0] MUX_OPT_0;
wire [31:0] MUX_OPT_1;
wire MEM_WRITE;
wire [31:0] IF_ID_NEXT_INS_ADR;
wire [31:0] IF_ID_CUR_INS;

IF_Stage IF_Stage_Module(
    CLK,
    MUX_OPT_0,
    MUX_OPT_1,
    MEM_WRITE,
    IF_ID_NEXT_INS_ADR,
    IF_ID_CUR_INS
);
// --- IF Stage --- //

// --- ID Stage --- //
wire [5:0] delay_write_register;
wire [31:0] delay_write_data;
wire delay_in_RegWrite;
wire [1:0] delay_in_load_mode;
wire [31:0] register_input;
wire [4:0] ID_EX_instr_bits_15_11;
wire [4:0] ID_EX_instr_bits_20_16;
wire [31:0] ID_EX_extended_bits;
wire [31:0] ID_EX_read_data1;
wire [31:0] ID_EX_read_data2;
wire [31:0] ID_EX_new_pc_value;
wire ID_EX_RegDst;
wire ID_EX_RegWrite;
wire ID_EX_ALUSrc;
wire ID_EX_MemWrite;
wire ID_EX_MemRead;
wire ID_EX_MemToReg;
wire ID_EX_Branch;
wire [1:0] ID_EX_load_mode;
wire [2:0] ID_EX_ALUOp;

ID_Stage ID_Stage_Module(
    CLK,
    delay_write_register,
    delay_write_data,
    delay_in_RegWrite,
    delay_in_load_mode,
    IF_ID_CUR_INS,
    IF_ID_NEXT_INS_ADR,
    register_input,
    ID_EX_instr_bits_15_11,
    ID_EX_instr_bits_20_16,
    ID_EX_extended_bits,
    ID_EX_read_data1,
    ID_EX_read_data2,
    ID_EX_new_pc_value,
    ID_EX_RegDst,
    ID_EX_RegWrite,
    ID_EX_ALUSrc,
    ID_EX_MemWrite,
    ID_EX_MemRead,
    ID_EX_MemToReg,
    ID_EX_Branch,
    ID_EX_load_mode,
    ID_EX_ALUOp
);
// --- ID Stage --- //

// --- EX Stage --- //
wire EX_MEM_zero_out;
wire EX_MEM_RegWrite_out;
wire EX_MEM_MemWrite_out;
wire EX_MEM_MemRead_out;
wire EX_MEM_MemToReg_out;
wire [1:0] EX_MEM_load_mode_out;
wire [4:0] EX_MEM_writebackDestination_out;
wire [31:0] EX_MEM_aluResult_out;
wire [31:0] EX_MEM_rt_out;
wire [31:0] EX_MEM_pc_out;
wire EX_MEM_branch_out;

EX_Stage EX_Stage_Module(
    CLK,
    ID_EX_RegDst,
    ID_EX_RegWrite,
    ID_EX_ALUSrc,
    ID_EX_MemWrite,
    ID_EX_MemRead,
    ID_EX_MemToReg,
    ID_EX_ALUOp,
    ID_EX_instr_bits_15_11,
    ID_EX_instr_bits_20_16,
    ID_EX_extended_bits,
    ID_EX_read_data1,
    ID_EX_read_data2,
    ID_EX_new_pc_value,
    ID_EX_load_mode,
    ID_EX_Branch,
    EX_MEM_zero_out,
    EX_MEM_RegWrite_out,
    EX_MEM_MemWrite_out,
    EX_MEM_MemRead_out,
    EX_MEM_MemToReg_out,
    EX_MEM_load_mode_out,
    EX_MEM_writebackDestination_out,
    EX_MEM_aluResult_out,
    EX_MEM_rt_out,
    EX_MEM_pc_out,
    EX_MEM_branch_out
);
// --- EX Stage --- //

endmodule