`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:44:34
// Design Name: 
// Module Name: Controller
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


module Controller(input logic switchEn, clk, reset, leftBtnDebounce, rightBtnDebounce, input logic [11:0] instructions, 
output logic D_rd, D_wr, isExternal,
output logic [1:0] ALUSel, output logic wr_en, output logic [3:0] D_addr, 
output logic [2:0] RF_addr1, RF_addr2, 
RF_waddr );//INSTRUCTIONS EMPTY :d

    logic loadCounter;

    always_ff @( posedge clk, posedge reset )
    if ( reset )
    begin
        ALUSel <= 0;
        D_rd <= 0;
        D_wr <= 0;
        isExternal <= 0; 
        wr_en <= 0; 
        D_addr <= 0;
        RF_addr1 <= 0;
        RF_addr2 <= 0;
        RF_waddr <= 0;
        loadCounter <= 0;   
    end
    else 
    begin
        if( (leftBtnDebounce & ~switchEn) | (rightBtnDebounce & switchEn) )
        begin           
            case( instructions[11:9] )
            3'b000:
            begin               
                ALUSel <= 0;
                D_rd <= 1;
                D_wr <= 0;
                isExternal <= 1; 
                wr_en <= 1;
                D_addr <= instructions[3:0];
                RF_waddr <= instructions[6:4];
                case ( loadCounter )
                0:
                begin
                RF_addr1 <= instructions[6:4];
                loadCounter <= 1;
                end
                1:
                begin
                RF_addr2 <= instructions[6:4];
                loadCounter <= 0;
                end
                endcase                 
            end
            3'b001:
            begin                
                ALUSel <= 0;
                D_rd <= 0;
                D_wr <= 1;
                isExternal <= 0; 
                wr_en <= 0; 
                D_addr <= instructions[3:0];
                RF_addr1 <= instructions[6:4];
                loadCounter <= 1;
            end
            3'b101:
            begin
                ALUSel <= 2'b01;
                D_rd <= 0;
                D_wr <= 0;
                isExternal <= 0; 
                wr_en <= 1;
                RF_addr1 <= instructions[2:0];
                RF_addr2 <= instructions[5:3];
                RF_waddr <= instructions[8:6];
                 
            end    
            3'b110:
            begin
                ALUSel <= 2'b10;
                D_rd <= 0;
                D_wr <= 0;
                isExternal <= 0; 
                wr_en <= 1;
                RF_addr1 <= instructions[2:0];
                RF_addr2 <= instructions[5:3];
                RF_waddr <= instructions[8:6]; 
            end
            endcase 
         end
         /**else
         begin
            ALUSel <= ALUSel;
            D_rd <= 0;
            D_wr <= 0;
            isExternal <= 0;//can be 0 as well 
            wr_en <= 0;  
         end*/
    end
                
endmodule 
