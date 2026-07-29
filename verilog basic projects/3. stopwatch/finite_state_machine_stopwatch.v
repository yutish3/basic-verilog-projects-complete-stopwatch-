module finite_state_machine_stopwatch (
    input wire clk,
    input wire rst,
    input wire start,
    input wire stop,
    output reg enable //it is used to enables the timer when stopwatch is active
);

localparam IDLE = 1'b0 ; // 1-bit wide binary number named IDLE with a value of 0
localparam RUN = 1'b1 ; // 1-bit wide binary number named RUN with a value of 1

reg state = IDLE; // register to hold the value of the state and makes it = to IDle

always @(posedge clk) begin //runs when clk starts

    if (rst) begin
        state <= IDLE;
    end

    else begin
        case (state)
        IDLE: begin
            if(start) state <= RUN; //changes to run state if state is IDLE
        end

        RUN: begin
            if (stop) state <= IDLE; //changes to IDLE if state is RUN
        end
        
        default: state <= IDLE;
        endcase
    end
end

always @(*) begin //used for changing the value of RUN
    if (state == RUN) begin
        enable = 1'b1;
    end
    else begin
        enable = 1'b0;
    end
end

endmodule

/* this whole program stopwatch with extra code to manages the state of the memory following a clock cycle and finite state machine to regulate the memory and clock
in test bench we use multiple button presses and here is what happens when we press the buttons
when button is pressed the module goes from IDLE to RUN and makes the enable register from 0 to 1
then it waits until clock ticks and gives the output
and the main stop watch function of it works when state is 0 
for ex the time jumps from 0 to 20ns in start because the state was 0
and on 20ns the button was pressed then it works normally until 60ns when state is back to 0
then again jumps to 80ns when the button is pressed and so on */