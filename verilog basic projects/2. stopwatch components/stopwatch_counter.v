module stopwatch_counter (
    input wire clk,
    input wire rst,
    input wire enable,
    output reg [7:0] count //8-bit register (max limit upto 255)
);

always @(posedge clk) begin
    if (rst) begin
        count <= 0;
    end else if (enable) begin
        count <= count + 1;
    end
end

endmodule