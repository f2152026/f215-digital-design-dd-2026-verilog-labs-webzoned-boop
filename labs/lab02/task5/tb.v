// tb.v

module tb;

  reg  [3:0] a;
  reg  [3:0] b;
  reg           op;
  wire [3:0] result;

  alu DUT (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
  );

  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    
    a = 4'd5; b = 4'd3; op = 1'b0; 
    #10;
    
    
    op = 1'b1; 
    #10;
    
   
    a = 4'd8; b = 4'd2; op = 1'b1; 
    #10;
    
    
    #10;
    
    $finish;
  end

  initial
    $monitor($time, " a=%d b=%d op=%b | result=%d", a, b, op, result);

endmodule