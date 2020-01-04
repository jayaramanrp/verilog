//D-Flip Flop

module d_ff(input i_input,clk, reset_n,
            output reg o_output);

always @(posedge clk or negedge reset_n)
    begin
        if(!reset_n)
          o_output<=1'b0;
        else
          o_output<=i_input;
    end


endmodule