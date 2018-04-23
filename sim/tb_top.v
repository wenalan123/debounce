/************************************************************************
 * Author        : Wen Chunyang
 * Email         : 1494640955@qq.com
 * Create time   : 2018-04-15 15:45
 * Last modified : 2018-04-15 15:45
 * Filename      : tb_top.v
 * Description   : 
 * *********************************************************************/
`timescale		1ns/1ns 

module	tb_top;

//=====================================================================\
// ********** Define Parameter and Internal Signals *************
//=====================================================================/
reg                             clk                             ;       
reg                             rst_n                           ;       
reg                             key_in                          ;
wire                            key_out                         ; 


//======================================================================
// ***************      Main    Code    ****************
//======================================================================
always  #5      clk    =       ~clk;


initial begin
	clk		<=		1'b1;
	rst_n	<=		1'b0;
    key_in  <=      1'b1;
	#100
	rst_n	<=		1'b1;
    #100

    key_in  <=      1'b0;
    #3000
    key_in  <=      1'b1;
    #1000

    key_in  <=      1'b0;
    #1000
    key_in  <=      1'b1;
end


//例化
debounce    debounce_inst(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        //key
        .key_in                 (key_in                 ),
        .key_out                (key_out                )
);

defparam    debounce_inst.TIME_20MS     =       200             ;//低电平保持>=2000ns，则认为他按下了 

endmodule
