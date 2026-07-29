`timescale 1ns/1ps

module n_bit_adder_test;

reg [18:0] a_test;
reg [18:0] b_test;
reg cin_test;

wire [18:0] sum_test;
wire cout_test;

n_bit_adder dut (
    .a(a_test),
    .b(b_test),
    .cin(cin_test),
    .sum(sum_test),
    .cout(cout_test)
);

initial begin
    $display("|    A   |    B   | Cin  ==> Cout |   Sum  |");

    a_test = 500; b_test = 500; cin_test = 0; #10;
    $display("| %6d | %6d |  %b   ==>   %b  | %6d |", a_test, b_test, cin_test, cout_test, sum_test);

    a_test = 500; b_test = 500; cin_test = 1; #10;
    $display("| %6d | %6d |  %b   ==>   %b  | %6d |", a_test, b_test, cin_test, cout_test, sum_test);

    a_test = 500000; b_test = 30000; cin_test = 0; #10;
    $display("| %6d | %6d |  %b   ==>   %b  | %6d |", a_test, b_test, cin_test, cout_test, sum_test);

    a_test = 524287; b_test = 0; cin_test = 1; #10; // 524287 is max capacity of 19 bit so it overflows into cout
    $display("| %6d | %6d |  %b   ==>   %b  | %6d |", a_test, b_test, cin_test, cout_test, sum_test);

    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o nbit_test n_bit_adder.v n_bit_adder_test.v" in terminal below

to run the compiled code run

"vvp nbit_test"


basic understanding is cin is the overflow bit for input and cout is overflow bit of output 
also the reason why the last example has 0 as sum is because we maxxed out the 19bit limit and it overflowed into cout making sum 0 and cout 1
cool fact this error also happened in an old civilization game giving us the nuclear gandhi memes */