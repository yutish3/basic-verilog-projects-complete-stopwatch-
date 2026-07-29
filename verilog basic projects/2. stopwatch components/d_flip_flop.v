module d_flip_flop (
    input wire clk,  //this is the clock signal its theory name is metroman or smth (Metronome)
    input wire d,  //data in
    output reg q  // data out (this is reg not wire because it has to save the value of q)
);

always @(posedge clk) begin //begines when clock signal goes from low to high (0 to 1 in our case)

    q <= d; //passes d input to q output

end 

endmodule

/*main use of d flip flop is to capture and store 1 bit of data with sync of a clock of the cpu
basically a fundamental building block for computer memory 
we chain these together in cpus */