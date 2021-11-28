`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 14:38:40
// Design Name: 
// Module Name: testbench_ROM
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


module testbench_ROM();
    logic [2:0] rda;
    logic [11:0] rdd;
    
    Instruction_Memory IM_testbench( rda, rdd );
    
    initial begin
    #5;
    rda = 3'b000;
    #5;
    rda = 3'b001;
    #5;
    rda = 3'b010;
    #5;
    rda = 3'b011;
    #5;
    rda = 3'b100;
    #5;
    rda = 3'b101;
    #5;
    rda = 3'b110;
    #5;
    rda = 3'b111;
    end
endmodule
