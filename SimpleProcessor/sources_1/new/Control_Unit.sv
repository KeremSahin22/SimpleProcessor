`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:41:50
// Design Name: 
// Module Name: Control_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit( input logic clk, reset, leftBtnDebounce, rightBtnDebounce, switchEn, [11:0] switch, output logic [3:0] D_addr, 
output logic D_rd, D_wr, output logic [2:0] RF_addr1, RF_addr2, 
RF_waddr, output logic [1:0] ALUSel, output logic isExternal, output logic wr_en);
    
    logic [2:0] PC_out;
    logic loadCounter, IR_ld;
    logic [11:0] IM_ins, instructions;
    logic [2:0] PC_index;  
    assign IR_ld = 1;
    
    PC pc( clk, leftBtnDebounce, reset, PC_index );        
    Instruction_Memory ROM( PC_index, IM_ins );
    IR ins_reg( clk, IR_ld , reset, switchEn, switch, IM_ins, instructions );
    
    Controller controller( switchEn, clk, reset, leftBtnDebounce, rightBtnDebounce, instructions,
    D_rd, D_wr, isExternal, ALUSel, wr_en, D_addr, RF_addr1, RF_addr2, RF_waddr );
      
    /**logic IR_ld, PC_ld;    
    always_ff @( posedge clk, posedge reset )
    if ( reset )
    begin
    IR_ld <= 0;
    PC_ld <= 0;
    end
    else if ( leftBtnDebounce )
    begin
        IR_ld <= 1;
        PC_ld <= 1;
    end
    else if (rightBtnDebounce & switchEn)
    begin
        IR_ld <= 1;
        PC_ld <= 0;
    end
    else
    begin
        //IR_ld = 0;
        //PC_ld = 0; 
    end
    
    PC pc( clk , PC_ld , reset, PC_out );
    Instruction_Memory ROM( PC_out, IM_ins );
    
    always_comb
    begin
        case( switchEn )
        1: IR_ins = switch;
        0: IR_ins = IM_ins;
        endcase
    end 
          
    IR ins_reg( clk, IR_ld, reset, IR_ins, instructions ); */    
endmodule
