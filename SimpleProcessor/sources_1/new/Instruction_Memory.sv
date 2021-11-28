`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:43:34
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory( input logic [2:0] rda, output logic [11:0] rdd);

    /**always_comb
        case ( rda )
        1: rdd = 12'b000_00_100_1000; //load rf[4} as  4
        2: rdd = 12'b000_00_011_0011; //load rf[3] as 1
        3: rdd = 12'b101_010_011_100; //rf[2] = rf[3] + rf[4]
        3: rdd = 12'b101011010000; //sum of rf[2] and rf[0] -> 6 + 2 -> rf[3] = 8
        4: rdd = 12'b110100011010; //subtract rf[3] and rf[2] -> rf[4] = 2 
        5: rdd = 12'b001001000101; //store rf[4] -> d[5]
        6: rdd = 12'b000001100101; //load rf[5] as d[5](2)
        7: rdd = 12'b101110101001; //rf[6] = rf[5] + rf[1]
        default: rdd = 12'b000_00_100_1000;
        endcase*/
        
        always_comb
        case ( rda )
        0: rdd = 12'b000_00_001_0010; //load rf[1} as  2
        1: rdd = 12'b000_00_000_0110; //load rf[0] as 6
        2: rdd = 12'b101_010_000_001; //sum of rf[1] and rf[0] -> rf[2] = 8
        3: rdd = 12'b101_011_001_010; //sum of rf[2] and rf[1] -> rf[3] = 10
        4: rdd = 12'b110_100_000_011; //subtract rf[3] and rf[0] -> rf[4] = 4
        5: rdd = 12'b001_00_001_0101; //store d[5] = 2
        6: rdd = 12'b000_00_110_0101; //load rf[6] as d[5](2)
        7: rdd = 12'b101_111_001_110; //rf[7] = rf[6] + rf[1] = 6
        endcase
             
endmodule 
