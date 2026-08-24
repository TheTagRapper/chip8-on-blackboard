`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2026 06:23:23 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(

        // Increment
        input logic ALU_Increment, KPU_Increment,
        input logic enable_increment,
        input logic increment_source, // (0 - ALU | 1 - KPU)
        
        // New Address
        input logic [15:0] stack_address, register_address,
        input logic enable_address_replace,
        input logic address_source, // 
        
        input logic clk,
        input logic nReset,
        output logic [15:0]  Output_Address
      );
      
      logic increment_signal;
      
      logic [15:0] address;
      
      assign increment_signal = (enable_increment ? ( (increment_source) ?  KPU_Increment : ALU_Increment ) : 0);
      
      
      
      always_ff @(posedge increment_signal or posedge clk or negedge nReset)
        begin
            if (!nReset) address <= 12'h200;
            else if (enable_address_replace) address <= (address_source ? stack_address : register_address);
            else address <= address + 2;
        end
      
      assign Output_Address = address;
      
endmodule
