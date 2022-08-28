`timescale 1ns/10ps
// prints out the state values
//
module dut(intf.idut ix);

logic [3:0] old_state;

default clocking @(posedge(ix.clk));

endclocking

always @(posedge(ix.clk)) begin
  $display(ix.state);
end

always @ (ix.state) begin
  case(ix.state) 
    1: begin
        assert (old_state == 0 || old_state == 3 || old_state == 5) 
        else begin
          $display("Error: Legal transition to state 0 can only occur from old_state 0, 3, or 5");
        end
      end
  endcase

  old_state = ix.state;
end


endmodule
