`timescale 1ns/1ps

module half_adder_test;

reg a_test;
reg b_test;

wire sum_test;
wire carry_test;

half_adder dut (
    .a(a_test),
    .b(b_test),
    .sum(sum_test),
    .carry(carry_test)
);

initial begin

    $display("time - A - B - sum - carry");
    
    a_test = 0; b_test = 0; #10;
    $display("%4t - %b - %b - %b - %b", $time, a_test, b_test, sum_test, carry_test);

    a_test = 0; b_test = 1; #10;
    $display("%4t - %b - %b - %b - %b", $time, a_test, b_test, sum_test, carry_test);

    a_test = 1; b_test = 0; #10;
    $display("%4t - %b - %b - %b - %b", $time, a_test, b_test, sum_test, carry_test);

    a_test = 1; b_test = 1; #10;
    $display("%4t - %b - %b - %b - %b", $time, a_test, b_test, sum_test, carry_test);

    $finish;

end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o test_half_adder half_adder.v half_adder_test.v" in terminal below

to run the compiled code run

"vvp test_half_adder" */




