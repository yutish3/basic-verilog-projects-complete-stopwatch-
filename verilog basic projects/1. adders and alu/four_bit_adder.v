module four_bit_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire carry_in,
    output wire [3:0] sum,
    output wire carry_out
);

wire carry_1, carry_2, carry_3;

assign sum[0] = a[0] ^ b[0] ^ carry_in;
assign carry_1 = (a[0] & b[0]) | (b[0] & carry_in) | (a[0] & carry_in);

assign sum[1] = a[1] ^ b[1] ^ carry_1;
assign carry_2 = (a[1] & b[1]) | (b[1] & carry_1) | (a[1] & carry_1);

assign sum[2] = a[2] ^ b[2] ^ carry_2;
assign carry_3 = (a[2] & b[2]) | (b[2] & carry_2) | (a[2] & carry_2);

assign sum[3] = a[3] ^ b[3] ^ carry_3;
assign carry_out = (a[3] & b[3]) | (b[3] & carry_3) | (a[3] & carry_3);

endmodule

/* a 4 bit adder is 4 full adders combined and it can take 2 4 bit inputs ie (1111 = 8 + 4 + 2 + 1 = 15) and one carry in and combine all of them to give out its sum and carry out
to combine all 4 full adders i used 3 wires carry_1 , carry_2 and carry_3
also instead of making a new file each time i optimised i decided to do it in old file so i used input wire [3:0] a, to reduce the code size it automatically makes a0,a1,a2,a3 4bits for a input which reduced the code size by a massive extent next i will try to make it so instead of me having to write each full adder myself i like did i would replace it with few lines so it will take the code from the full adder i already wrote i will try but it prob wouldnt be that helpful
another thing i learned is that for display if i put %3d it will adjust automatically in the display and wouldnt make it so when the number is 1 or 10 it wouldnt move the whole line and make everything weird it will automatically make it fit in the same place
NOTE :- carry in is a single bit so it can only be 0 or 1 rest all others are decimals including carry out and both carry in and carry out are binaries but carry out is a 5th bit of sum so it can calculate when everything is maxed out because of that if carry out is 1 it means 16 not 1 so a = 15 , b = 15 , carry in = 1 then a + b + carryin = carry out = 1 and sum = 15 */