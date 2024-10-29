//Write assertion to verify following behavior 'req must be followed by ack'.
//Evaluate the property on positive edge of the clock. Only Implication Operators and Boolean Operators are allowed.

module tb;
  
  reg clk = 0;
  
 
  reg req = 0;
  reg ack = 0;
  
  task req_stimuli(); 
   #10;
   req = 1;
   #10;
   req = 0;
   #10;
   req = 1;
   #10;
   req = 0;
   #10;
   req = 1;
   #10;
   req = 0; 
   endtask
  
  
 task ack_stimuli(); 
   #10;
   ack = 1;
   #10;
   ack = 1;
   #10;
   ack = 0;
   #10;
   ack = 1;
   #10;
   ack = 0;
   #10;
 endtask


initial
begin
fork
req_stimuli();
ack_stimuli();
join
end

  
  
  always #5 clk = ~clk;
  
 
  A1 : assert property (@(posedge clk) req |=> ack) $info(" Success @ %0t", $time); else $error("Failure @ %0t", $time);
  
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
    $assertvacuousoff(0);
    #80;
    $finish();
  end

endmodule