`timescale 1ns/1ps

module bit_19_register_test;

reg clk_test;
reg [18:0] i_test;
wire [18:0] o_test;
reg rst_test;
reg we_test;

register #(.WIDTH(19)) dut (
    .clk(clk_test),
    .i(i_test),
    .o(o_test),
    .rst(rst_test),
    .we(we_test)
);

always begin
    #50 clk_test = ~clk_test; //change time gap between each data saved
end

initial begin
    $display("| Time | Clk | Rst | We ==> Input | Output |");

    $monitor("|%4t  | %b  | %b | %b ==> %7d | %7d |", $time, clk_test, rst_test, we_test, i_test, o_test);

    clk_test = 0;
    i_test = 0;
    we_test = 0;

    rst_test = 1; #100;
    rst_test = 0;

    #100 i_test = 300;
    #100 we_test = 1;
    #100 we_test = 0;
    #100 clk_test = 0;
    #100 i_test = 3000;
    #100 rst_test = 1;
    #200;

    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o bit_19_register bit_19_register.v bit_19_register_test.v" in terminal below

to run the compiled code run

"vvp bit_19_register " */

/* how to read the data 
time is time obv it shows data every 50 nanosecond  
when clk becomes 1 and input becomes changes at that same time or before it will copy paste value of input to output
if rst is enabeled it will reset the value of output to 0
also the value of input overwrites whenever its needed
also the value of output only changes if we is 1 when clk happens 
i think thats all for this ill add more if i felt smth is missing when i reread it again */
