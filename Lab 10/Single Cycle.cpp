//Register File Implementation: 32 registers each 32 bits wide, 1 write enable
//1 bit clock, write data 32 bits
module Register_File (A1, A2, A3, WD, WE, Clk, RD1, RD2);

	input [4:0]A1, A2, A3;
	input [31:0]WD;
	input [0:0]Clk, WE;

	output reg [31:0] RD1,RD2;

	reg[31:0] Registers [0:31];

	always @(posedge Clk)
	begin
		if(WE == 1) 
		begin
			Registers[A3] <= WD; //write data into register A3
		end
	end

	always@(posedge Clk)
	begin
		RD1 <= Registers [A1];
		RD2 <= Registers [A2];
	end
endmodule
