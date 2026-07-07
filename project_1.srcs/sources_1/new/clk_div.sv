

module clk_div #(con = 1000)(
    input clk,
    input nReset,
    output reg clk_div
    );
    
localparam constantNumber = 10000;
reg [31:0] count;

always @ (posedge clk or negedge nReset)
begin
    if (nReset == 1'b0)
        count <= 32'b0;
    else if (count == constantNumber - 1)
        count <= 32'b0;
    else
        count <= count + 1;
end

always @ (posedge clk or negedge nReset)
begin
    if (nReset == 1'b0)
        clk_div <= 1'b0;
    else if (count == constantNumber - 1)
        clk_div <= ~clk_div;
    else
        clk_div <= clk_div;
end

endmodule

