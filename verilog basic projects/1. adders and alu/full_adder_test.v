`timescale 1ns/1ps

module full_adder_test;

reg a_test;
reg b_test;
reg carry_in_test;

wire sum_test;
wire carry_out_test;

full_adder dut (
    .a(a_test),
    .b(b_test),
    .carry_in(carry_in_test),
    .sum(sum_test),
    .carry_out(carry_out_test)
);

initial begin 
    $display("| A | B | C_IN | ==> | C_OUT | SUM |");

    a_test = 0; b_test = 0; carry_in_test = 0; #10; //at the end of each thing you add ";"
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 0; b_test = 0; carry_in_test = 1; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 0; b_test = 1; carry_in_test = 0; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 1; b_test = 0; carry_in_test = 0; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 1; b_test = 1; carry_in_test = 0; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 0; b_test = 1; carry_in_test = 1; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 1; b_test = 0; carry_in_test = 1; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    a_test = 1; b_test = 1; carry_in_test = 1; #10;
    $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o test_full_adder full_adder.v full_adder_test.v" in terminal below

to run the compiled code run

"vvp test_full_adder" */