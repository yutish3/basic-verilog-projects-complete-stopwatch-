module clock_divider #(parameter LIMIT = 2500) (
    input wire clk,
    output reg clk_1hz = 0
);

reg [31:0] count = 0; //32 bit lanes for count (this is used for 32 bit wide internal memory register)

always @(posedge clk) begin
    if (count == LIMIT - 1) begin
        count <= 0;
        clk_1hz <= ~clk_1hz;
    end
    else begin
        count <= count + 1;
    end
end

endmodule

/*main use of this is to reduce high frequency input clock signal down to lower frequench output signal 
*/