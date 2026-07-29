module full_adder (
    input wire a, //adding in input wires
    input wire b,
    input wire carry_in,
    output wire sum,
    output wire carry_out //adding in output wires (the last one doesnt need , at the end)
);

assign sum = a ^ b ^ carry_in; // "^" is XOR gate

assign carry_out = (a & b) | (carry_in & (a ^ b)); // "&" is AND gate and "|" is OR gate 

endmodule


/*simplified explanation is that they take in 3 inputs and give out 2 outputs so if all 3 inputs are 1 it will give 11(2+1 = 3) as output
sum = a ^ b ^ carry_in ( this line means a and b will be connected to a XOR gate and then whatever comes out of it will be connected to XOR gate with carry_in also connected to XOR gate
carry_out = (a & b) | (carry_in & (a ^ b)) ( here the "|" means OR gate and its first connection is a and b going through an AND gate and second connection is carry_in going through AND gate with a and b going through XOR gate */