//test bench for memory controller

module tb_mem;

//parameter DATA_WIDTH=8,ADDR_WIDTH=16;
reg clk;
reg reset_n;
reg rd_wr;
reg rd_wr_valid;
reg [16-1:0]addr;
reg [8-1:0]wr_data; 
wire [8-1:0]rd_data;

//Instantiate of DUT
mem_dut dut_j (.clk(clk),
              .reset_n(reset_n),
              .rd_wr(rd_wr),
              .rd_wr_valid(rd_wr_valid),
              .addr(addr),
              .wr_data(wr_data),
              .rd_data(rd_data));

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
        #10 reset_n=1'b1;   rd_wr_valid=1'b1;   rd_wr=1'b0; 
        #10                                                     addr=8'd20; wr_data=8'd2;
        #10                                     rd_wr=1'b1;  
        #10                                     rd_wr=1'b0;
        #10                                                     addr=8'd22; wr_data=8'd4;
        #10                                     rd_wr=1'b1;  

        #50 $finish;
        end


endmodule
