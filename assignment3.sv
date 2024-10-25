/*
Check the behavior of D flipflop : 'dout must be zero if rst is active high, otherwise dout should follow din' . 
Insert your assert check in the RTL code given in the instructions tab. Submit your code with assertions.
*/
module dff
(
input din, clk, rst,
output reg dout  
);
  
  always@(posedge clk)
    begin
      if(rst)
        dout <= 1'b0;
      else
        dout <= din;
    end

    always@(*) begin
        if (!rst) begin
            a1: assert (dout == din)
                else $error("Assertion a1 failed!");
        end
    end
  
endmodule