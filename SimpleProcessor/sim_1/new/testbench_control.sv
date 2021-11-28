`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 17:07:19
// Design Name: 
// Module Name: testbench_control
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


module testbench_control();
    logic clk, reset,leftBtnDebounce, rightBtnDebounce, wr_en;
    logic [2:0] opcode;
    logic isLoad, isStore, isAdd, isSubtract, D_rd, D_wr, isExternal, IR_ld, PC_ld;
    logic [1:0] ALUSel;
   
    Controller controller( clk, reset, leftBtnDebounce, rightBtnDebounce, opcode, isLoad, isStore, isAdd, isSubtract, D_rd, D_wr, isExternal, IR_ld, PC_ld, ALUSel, wr_en );
    
    initial 
        clk = 1;
    always 
        begin
        #10;               
        clk = ~clk;        
        end  
    
    initial begin
    reset = 1;
    #10; reset = 0;
    #30; 
    opcode = 3'b000;
    leftBtnDebounce = 1;
    #10; leftBtnDebounce = 0;
    #10;
    opcode = 3'b001;
    leftBtnDebounce = 1;
    #10; leftBtnDebounce = 0; 
    #10;
    opcode = 3'b101;
    leftBtnDebounce = 1;
    #10; leftBtnDebounce = 0;
    #10;
    opcode = 3'b110;
    leftBtnDebounce = 1;
    #10; leftBtnDebounce = 0;
    end 
endmodule
