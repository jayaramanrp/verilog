//Test bench for D_flipflop
module tb_dff;

reg clk;
reg reset_n;
reg i_input;
wire o_output;

//Instantiate DUT module
    d_ff dut_j (.clk(clk),
                .reset_n(reset_n),
                .i_input(i_input),
                .o_output(o_output)
		);

//clock generation 

initial 
    begin
        clk=1'b0;
        forever #5 clk=~clk;
    end

//Test case
    initial
      begin
        reset_n=1'b0; 
    #10 reset_n=1'b1; i_input=1'b1;
    #10 reset_n=1'b0;
    #10               i_input=1'b0;
    #10 reset_n=1'b1;
    #50 $finish;
       end

   initial  begin
   $monitor("Reset_n=%d Input=%d Output=%d",reset_n,i_input,o_output);
    end

endmodule //tb_dff