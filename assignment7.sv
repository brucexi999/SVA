/*
Whenever a assert and b deassert then c must hold true in the next clock tick. 
Evaluate the property on positive edge of the clock. Only Implication Operators and Boolean Operators are allowed. 
*/
module tb;
  reg a = 0, b = 1, c = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 1;
    #10;
    a = 0;
    #10;
    a = 1; 
    #10;
    a = 0;
    #10;
    a = 1;
  end
  
  initial begin
    b = 0;
    #10;
    b = 1;
    #10;
    b = 0; 
    #10;
    b = 1;
    #10;
    a = 0;
  end
  
    initial begin
    c = 0;
    #13;
    c = 1;
    #10;
    c = 0; 
    #11;
    c = 1;
    #10;
    c = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end

    A1 : assert property (@(posedge clk) a && !b |=> c) $info(" Success @ %0t", $time); else $error("Failure @ %0t", $time);
endmodule