//if signal a asserts, then signal c should assert within 1 to 5 clock cycles, 
//followed by signal b becoming high. signal ce should remain high for entire duration of this sequence.
module tb;
  reg a = 0, b = 0, c = 0,ce = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    #20;
    a = 1; 
    #10;
    a = 0;
   end
  
  initial begin
    #49;
    b = 1;
    #10;
    b = 0;
  end
  
    initial begin 
    #40;
    c = 1;
    #10;
    c = 0;
  end
  
  initial begin
    #15;
    ce = 1;
    #60;
    ce = 0;
    
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
 
  property p_a_to_c_then_b;
    @(posedge clk)
    a |-> (ce throughout (##[1:5] c ##1 b));
  endproperty

  assert property (p_a_to_c_then_b)
    else $fatal("Assertion failed @ %0t", $time);
 endmodule