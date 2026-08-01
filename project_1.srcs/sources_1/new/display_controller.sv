`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2026 02:59:23 PM
// Design Name: 
// Module Name: display_controller
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


module display_controller(
        input logic clk,
        input logic [3:0] btn,
        
        output logic hdmi_clk_n, hdmi_clk_p, 
        output logic [2:0] hdmi_tx_n,
        output logic [2:0] hdmi_tx_p,
        
//        (* mark_debug = "true" , keep = "true" *)
//        output logic hdmi_out_en,
        
//        (* mark_debug = "true" , keep = "true" *)
//        input logic hdmi_hpd, // Detects when monitor is plugged in
        
        output logic [9:0] led
    );
    
    
    
//    assign hdmi_out_en = 1'b1;
    
    logic nReset;
    
    assign nReset = ~btn[0];
    
    logic clk_25MHZ;
    logic clk_125MHZ;
    
    logic locked;
    logic hsync, vsync, video_active;
    
    logic [9:0] px, py;
    
    clk_wiz_0 cw0 (.clk_in1(clk) , .clk_out1(clk_25MHZ), .locked(locked),
                   .clk_out2(clk_125MHZ), .reset(~nReset));
    
    
    vga_controller vga_c (.clk(clk_25MHZ), .nReset(nReset), .hsync(hsync), .vsync(vsync), .video_active(video_active), .px(px), .py(py));
    
    
    assign led[9:0] = {locked, hsync, vsync, video_active, 1'b0,  3'b0, 1'b0, 1'b0};
    
    logic [7:0] red, green, blue;
    

    
    
    hdmi_tx_0 hdmi_to_vga (
        .pix_clk(clk_25MHZ),
        .pix_clkx5(clk_125MHZ),
        .pix_clk_locked(locked),
        .rst(~nReset),
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(video_active),
        
        .aux0_din(4'b0),              
      .aux1_din(4'b0),              
      .aux2_din(4'b0),              
      .ade(1'b0),
      
      // Differential outputs
      .TMDS_CLK_P(hdmi_clk_p),          
      .TMDS_CLK_N(hdmi_clk_n),          
      .TMDS_DATA_P(hdmi_tx_p),         
      .TMDS_DATA_N(hdmi_tx_n)
    );
    
    
    
    // Now implmeneting an image
    
    logic [9:0] box_px, box_py; // Does top left
    logic [23:0] bg_color, box_color;
    
    assign bg_color = 24'hFFFFFF;
    assign box_color = 24'hEF23FE;
    
   
    always_comb
    begin
        if ( (px < box_px + 32) && (px > box_px) && (py < box_py + 32) && (py > box_py) ) {red, green, blue} = box_color;
        else {red, green, blue} = bg_color; 
    
    end
    
    logic [21:0] frame_divider;
    
    always_ff @(posedge clk_25MHZ or negedge nReset)
    begin
        if (~nReset) {box_px, box_py, frame_divider} <= 1;
       
        else if (box_px >= 608 || box_py >= 448) {box_px, box_py} = 1;
    
        else if ((frame_divider == 250000)) begin
            box_px <= box_px + 1;
            box_py <= box_py + 1;
            frame_divider <= 0;    
            end 
     
        else frame_divider <= frame_divider + 1;



    end
endmodule
