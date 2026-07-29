
the projects go from most basic project to a stopwatch with memory , clock cycle and finite state machine

how the different projects are connected

1 it starts with adders which are half adder then full adder to 4 bit , 19bit , n_bit and then a full arithmatic logical unit which can add , subtract , and a lot more

2 then we move on to stop watch components which are

&bullet;19 bit register

&bullet;clock divider

&bullet;d flip flop

&bullet;stopwatch

3 then the final project combines everything i learned so far to make a stopwatch which calculates , stores and a finite state machine which synchronizes the clock cycles and memory 

<img width="1158" height="654" alt="image" src="https://github.com/user-attachments/assets/b917faca-26e4-4c9f-bdc2-228a30a6f1f1" />


now here is every project name , purpose , result and diagram

&#9679; 1.1 Half_adder :- it is used as a basic single bit binary addition

&#9679; 1.2 Full_adder :- it can do addition of 3 bits

&#9679; 1.3 4_bit_adder :- adder for 4 bits

&#9679; 1.4 19/n_bit_adder :- adder for 19/n bits and it uses behacioral verilog in this one

&#9679; 1.5 n_bit_alu :- alu for n bits it can

&bullet; if input wire is 000 it adds

&bullet; if input wire is 000 it subtracts

&bullet; if input wire is 000 it performs bitwise of AND gate

&bullet; if input wire is 000 it performs bitwise of OR gate

&bullet; if input wire is 000 it performs bitwise of XOR gate

&bullet; if input wire is 101 it shifts input a to the left by 1 position (multiplying by 2)

&bullet; if input wire is 110 it shifts input a to the right by 1 position (divides by 2)

&bullet; sets result to 0 in case of unexpected code


&#9679; 2.1 19 bit register :- it stores the input data into output (most basic stripped down version of how cpu stores data)

&#9679; 2.2 Clock divider :- main use of this is to reduce high frequency input clock signal down to lower frequench output signal 

&#9679; 2.3 D flip flop :- main use of d flip flop is to capture and store 1 bit of data with sync of a clock of the cpu

&#9679; 2.4 stopwatch counter :- simple 8 bit stopwatch counter


&#9679; 3 finite state machine stopwatch (it combines all the things we made this far in 1 and 2) :- this is a stopwatch which calculates , stores and a finite state machine which synchronizes the clock cycles and memory 


