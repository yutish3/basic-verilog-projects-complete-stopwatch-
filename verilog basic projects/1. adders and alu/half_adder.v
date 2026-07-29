module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

assign sum = a^b;

assign carry = a&b;

endmodule


/* for 8 bit binary number order is 2^7(128), 2^6(64), 2^5(32), 2^4(16), 2^3(8), 2^2(4), 2^1(2), 2^0(1). for ex 11 = 3, 101 = 5, 1001 = 9.
and the main gates we use are AND gate (&) and XOR gate (^)
AND gate is 0 in all cases except 11 then its 1
XOR gate is 0 when input is 00 and 11 and is 1 when input is 10 and 01 */