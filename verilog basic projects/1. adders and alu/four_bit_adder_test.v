`timescale 1ns/1ps

module four_bit_adder_test;

reg [3:0] a_test;
reg [3:0] b_test;
reg carry_in_test;

wire [3:0] sum_test;
wire carry_out_test;

four_bit_adder dut (
    .a(a_test),
    .b(b_test),
    .carry_in(carry_in_test),
    .sum(sum_test),
    .carry_out(carry_out_test)
);

initial begin
    $display("|  A  |  B  | C_IN  ==>  C_OUT | SUM |");

    a_test = 15; b_test = 15; carry_in_test = 1; #10; //example with max number it can calculate  15+15+1 = 16(1) + 15 [carry_in_test = 1 means 1 and carry_out_test = 1 means 16]
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);
    
    a_test = 10; b_test = 10; carry_in_test = 1; #10; //normal example
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 9; b_test = 6; carry_in_test = 1; #10; //example with sum = 0
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 5; b_test = 5; carry_in_test = 1; #10; //example with carry_out_test = 0
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 10; b_test = 10; carry_in_test = 0; #10; //example with carry_in_test = 1 and carry_out_test = 1
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 5; b_test = 5; carry_in_test = 0; #10; //example with both carry_in_test and carry_out_test = 0
    $display("| %3d | %3d |  %b    ==>    %b   |  %d |", a_test, b_test, carry_in_test, carry_out_test, sum_test);
    
    $finish;

end
 
endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o four_bit_adder four_bit_adder.v four_bit_adder_test.v" in terminal below

to run the compiled code run

"vvp four_bit_adder" */