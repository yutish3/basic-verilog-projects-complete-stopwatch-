module n_bit_adder #(parameter n = 19 ) (
    input wire [n-1 : 0] a,
    input wire [n-1 : 0] b,
    input wire cin,
    output wire [n-1 : 0] sum,
    output wire cout
);

assign {cout , sum} = a + b + cin; //i used behavioral verilog but typing out + forcing compiler to make all the gate connections for me

endmodule