`timescale 1ns/1ps

module d_flip_flop_test;

reg clk_test;
reg d_test;
wire q_test; //wire for this here because we only need output we dont need to modify it

d_flip_flop dut (
    .clk(clk_test),
    .d(d_test),
    .q(q_test)
);

always begin //always runs in background
    #20 clk_test = ~clk_test; //~ = bitwise NOT operator (it makes 0 into 1 and 1 into 0)
end

initial begin 
    $display("| Time | Clk | D ==> Q |");

    clk_test = 0;
    d_test = 0;

    $monitor("| %4t | %b | %b ==> %b |", $time, clk_test, d_test, q_test); //displays only when any value changes 

    #20 d_test = 1;
    #40 d_test = 1; //changes d to 1 after 12 nanosec
    #60 d_test = 0; //changes d to 0 after 10 nanosec
    #80 d_test = 0; //changes d to 0 after 8 nanosec

   #20; //runs for 20 more nanosec
    $finish;
end

endmodule

/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o d_flip_flop d_flip_flop.v d_flip_flop_test.v" in terminal below

to run the compiled code run

"vvp d_flip_flop " */


/* first run and i got x as the value of q and i cant seem to understand why 
i did some digging and x means unknown and z means disconnected
i asked gemini about this one the problem was i set begin to 67 nanosecond and 12+10+8+20 = 50 so program ends before anything happens
second error i encountered is all values of q being 0 and this one was easy to figure out
d changes at 80ns but bitwise NOT operator only runs at 67ns so i will change the values to produce consecutive results

now result is a little complex to understand 
the tick speed is 20ns and every 20ns the value of clk changes from 0 to 1 (gate open) and then 1 to 0 (gate close)
d is the data incomming it affects q only when the the gate is open, d can be change even if the gate is closed
if the gate is closed it will retain the value of both d and q

another thing to be noted which i realised late is that #20 d_test = 1; they only happen once but they are compunding
#20 happens at 20ns 
#40 happens 40ns after 20ns so 60ns/60000ps in the time
and it compounds over time this is why d turns 0 at 120ns

you can fiddle around with the code a bit to test out different things */


