`timescale 1ns/1ps

module n_bit_alu_test;

reg [18:0] a_test;
reg [18:0] b_test;
reg [2:0] alu_control_test;

wire [18:0] result_test;
wire zero_test;

n_bit_alu dut (
    .a(a_test),
    .b(b_test),
    .alu_control(alu_control_test),
    .result(result_test),
    .zero (zero_test)
);

initial begin 
    $display("| Code | A | B  ==> Result | Zero flag |");

    a_test = 12; b_test = 10;

    alu_control_test = 3'b000; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b001; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b010; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b011; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b100; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b101; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    alu_control_test = 3'b110; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);


    a_test = 15; b_test = 15;
    alu_control_test = 3'b001; #10;
    $display("| %b  |%2d |%2d  ==> %3d    |     %b     |", alu_control_test, a_test, b_test, result_test, zero_test);

    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o n_bit_alu_test n_bit_alu.v n_bit_alu_test.v" in terminal below

to run the compiled code run

"vvp n_bit_alu_test" */