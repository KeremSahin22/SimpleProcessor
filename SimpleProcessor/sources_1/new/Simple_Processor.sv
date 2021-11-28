`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:35:59
// Design Name: 
// Module Name: Simple_Processor
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


module Simple_Processor(input logic clk, reset, leftBtn, rightBtn, switchEn, [11:0] switch, output [6:0]seg, logic dp,output [3:0] an);
    
    logic [3:0] D_addr, DataMemRead, rdd1;
    logic [2:0] RF_addr1, RF_addr2, RF_waddr;
    logic [1:0] ALUSel; 
    logic D_rd, D_wr, isExternal, wr_en, leftBtnDebounce, rightBtnDebounce;

    debouncer intstruc_mem_bounce( clk, leftBtn, leftBtnDebounce );
    debouncer switch_bounce( clk, rightBtn, rightBtnDebounce );
     
    Control_Unit controlUnit( clk, reset, leftBtnDebounce, rightBtnDebounce, switchEn, switch, D_addr, D_rd,D_wr,RF_addr1, RF_addr2, RF_waddr, ALUSel, isExternal, wr_en );    
    Data_memory dataMemory( D_rd, D_wr, clk, reset, D_addr, rdd1 , DataMemRead );                                                                                            
    datapathmodule datapath( DataMemRead, RF_addr1, RF_addr2, RF_waddr, isExternal, clk, wr_en, reset, ALUSel, seg, dp, an, rdd1);
    
endmodule
