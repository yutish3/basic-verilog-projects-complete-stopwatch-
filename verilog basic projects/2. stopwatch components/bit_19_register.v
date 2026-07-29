//i cant name file as 19 bit as the file name cant be started with a number
module register #(parameter WIDTH = 19) ( // parameter makes it a n_bit_register
    input wire clk, //clock signal of input wire
    input wire [WIDTH-1 : 0] i,
    output reg [WIDTH-1 : 0] o,
    input wire rst, //to reset memory
    input wire we //to enable or disable overwrite
);

always @(posedge clk) begin 
    
    if (rst == 1) begin
        o <= 0;
    end

    else if (we == 1) begin
        o <= i;
    end
    
end

endmodule

/* the main use of this is that it stores the input data into output when we is 1 (write enabeled) and clk (clock signal) turns 1
it is like the most basic stripped down version of how cpu stores data 
in most cpu these days they have different collections of register files kinda like arrays of register files or smth (idk how they work ngl just yet ) */