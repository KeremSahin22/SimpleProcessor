`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 14:58:11
// Design Name: 
// Module Name: testbench_controlUnit
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


module testbench_controlUnit();
    
    logic clk, reset, switchEn;
    logic [11:0] switch;
    logic [3:0] D_addr; 
    logic [2:0] RF_addr1, RF_addr2, RF_waddr;
    logic [1:0] ALUSel; 
    logic IR_ld, PC_ld, isLoad, isStore, isAdd, isSubtract;
    logic D_rd, D_wr, isExternal, wr_en, leftBtnDebounce, rightBtnDebounce;
    
    assign switchEn = 0;
                                                                                               
    Control_Unit controlUnit( clk, reset, leftBtnDebounce, rightBtnDebounce, switchEn, switch, D_addr, D_rd,D_wr,RF_addr1, RF_addr2, RF_waddr, ALUSel, isExternal, wr_en,IR_ld, PC_ld, isLoad, isStore, isAdd, isSubtract ); 
    
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
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0; 
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
        leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0; 
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
    leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
     leftBtnDebounce = 1;
    #20; leftBtnDebounce = 0;
    #20;
    end 
       
endmodule
