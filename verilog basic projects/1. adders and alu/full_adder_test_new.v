`timescale 1ns/1ps

module full_adder_test_new;

reg a_test;
reg b_test;
reg carry_in_test;

wire sum_test;
wire carry_out_test;

integer i; //for increasing its value to write 2 lines test

full_adder dut (
    .a(a_test),
    .b(b_test),
    .carry_in(carry_in_test),
    .sum(sum_test),
    .carry_out(carry_out_test)
);

initial begin
    $display("| A | B | C_IN | ==> | C_OUT | SUM |");

    for (i = 0; i < 8; i = i + 1)begin
        {a_test, b_test, carry_in_test} = i; #10;

        $display("| %b | %b |  %b   | ==> |   %b   |  %b  |", a_test, b_test, carry_in_test, carry_out_test, sum_test);

    end

    $finish;

end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o test_full_adder_new full_adder.v full_adder_test_new.v" in terminal below

to run the compiled code run

"vvp test_full_adder_new" */