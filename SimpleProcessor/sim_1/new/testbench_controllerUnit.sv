`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 14:15:24
// Design Name: 
// Module Name: testbench_controllerUnit
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


module testbench_controllerUnit( );
    logic clk, reset, leftBtnDebounce, rightBtnDebounce, switchEn;
    logic [11:0] switch; 
    logic [3:0] D_addr; 
    logic D_rd, D_wr; 
    logic [2:0] RF_addr1, RF_addr2, RF_waddr; 
    logic [1:0] ALUSel;
    logic isExternal;
    logic wr_en;
    logic [2:0] PC_out; 
    Control_Unit controlUnitTest(
endmodule
