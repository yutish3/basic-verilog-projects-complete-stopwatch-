`timescale 1ns/1ps

module clock_divider_test;

reg clk_test;
wire clk_1hz_test;

clock_divider #(.LIMIT(4)) dut (
    .clk(clk_test),
    .clk_1hz(clk_1hz_test)
);

always begin
    #5 clk_test = ~clk_test; //cloks every 5 nanoseconds
end

initial begin
    clk_test = 0;
    
    $display("| TIME | Fast clock | 1HZ Clock (slow one) |");

    $monitor("| %4t | %b | %b |", $time, clk_test, clk_1hz_test);
    #200;

    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o clock_divider clock_divider.v clock_divider_test.v" in terminal below

to run the compiled code run

"vvp clock_divider" */

/* how to read the result 
in main code we wrote the limit to be 4 so when fast clock does the cycle of 0 to 1 and 1 to 0 4 times 1hz clock slows it down
so it turns on from 35000nm to 70000 
with this we can conclude it took and stored all the data and then outputed it at once with equal interval that being 1 data bits */