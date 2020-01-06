//Memory controller- simple read and write 

module mem_dut(input clk,
           input reset_n,
           input rd_wr,
           input rd_wr_valid,
           input [8-1:0]addr,
           input [8-1:0]wr_data, 
           output reg [8-1:0]rd_data);


//memory declaration 
reg [8-1:0] mem [0:255];

always @(posedge clk or negedge reset_n)
    begin:main_block
        if(!reset_n)
            rd_data<=0;
        else
            begin:else_main
                if(rd_wr_valid)   
                  begin:valid
                    if(rd_wr)  //read operation 
                      rd_data<=mem[addr];
                    else       //write operation
                      mem[addr]<=wr_data;                      
                  end //valid
                else   //rd_wr_valid
                   rd_data<=0;
            end //else_main

            
    end //main_block
endmodule
