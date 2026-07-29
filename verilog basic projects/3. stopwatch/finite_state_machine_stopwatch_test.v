`timescale 1ns/1ps

module finite_state_machine_stopwatch_test; //bruh such a long name

reg clk_test;
reg rst_test;
reg start_test;
reg stop_test;
wire enable_test;

reg [63:0] state_text; // 64 bits specifically because it has 8 bytes enuf for the word RUNNING

integer stopwatch_time; //kinda self explanatory integer which will show stopwatch timer

finite_state_machine_stopwatch dut (
    .clk(clk_test),
    .rst(rst_test),
    .start(start_test),
    .stop(stop_test),
    .enable(enable_test)
);

always begin
    #5 clk_test = ~clk_test;
end

always @(*) begin
    if (dut.state == 1'b0)
    state_text = "IDLE";
    else
    state_text = "RUNNING";
end

always @(posedge clk_test) begin
    if (rst_test) begin
        stopwatch_time <= 0;
    end
    else if (enable_test === 1'b1) begin
        stopwatch_time <= stopwatch_time + 10;
    end
end

initial begin

    stopwatch_time = 0;

    $timeformat( -9, 0, "ns", 7);
    $display("| Time    | Reset | Start | Stop  ==>     State | Enable | Stopwatch_timer |");

    clk_test = 0;
    rst_test = 0;
    start_test = 0;
    stop_test = 0;

    $monitor("| %t | %b     | %b     | %b     ==>  %s | %b      | %2d ns           |", $time, rst_test, start_test, stop_test, state_text, enable_test, stopwatch_time);

    #20 start_test = 1; #10 start_test = 0; //pressess and releases start
    #20 stop_test = 1; #10 stop_test = 0; //pressess and releases stop
    #20 start_test = 1; #10 start_test = 0; //pressess and releases start again
    #20 rst_test = 1; #10 rst_test = 0; //pressess and releases reset

    #20 $finish;
end

endmodule 

/*i dont think there is much to explain in this testbench
i was thingking of making a v2 for it with simpler way to read result but i decided to adjust this one into easier to read*/


/* FOR REVIEWER:- to recompile with different results change the values and type

"iverilog -o finite_state_machine_stopwatch finite_state_machine_stopwatch.v finite_state_machine_stopwatch_test.v" in terminal below

to run the compiled code run

"vvp finite_state_machine_stopwatch " */