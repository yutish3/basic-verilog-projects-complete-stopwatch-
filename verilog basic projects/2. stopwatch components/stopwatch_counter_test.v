`timescale 1ns/1ps

module stopwatch_counter_test;

reg clk_test;
reg rst_test;
reg enable_test;
wire [7:0] cout_test;

stopwatch_counter dut (
    .clk(clk_test),
    .rst(rst_test),
    .enable(enable_test),
    .count(count_test)
);

always begin
    #5 clk_test = ~clk_test; //generates clock data
end

initial begin
    $display("| Time | Rst | EN ==> Count |");

    clk_test = 0;
    rst_test = 0;
    enable_test = 0;

    $monitor("| %4t | %b | %b ==> %3d |", $time, rst_test, enable_test, count_test,);

    #10 enable_test = 1;
    #30 enable_test = 0;
    #20 enable_test = 1;
    #10 rst_test = 1;
    #20 rst_test = 0;

    #20 $finish;

end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o stopwatch_counter stopwatch_counter.v stopwatch_counter_test.v" in terminal below

to run the compiled code run

"vvp stopwatch_counter" */