/*
Check the design intent: 'y must equal the sum of a and b'. Insert your assert check inside the RTL code.
*/
module and2

(

input [3:0] a,b,

output [3:0] y

);

assign y = a && b;



///////////Add your code here
always@(*) begin
    a1: assert (y == a + b)
        else $error("Assertion a1 failed!");
end
/////////End your code here



endmodule