module switch_adapter(
input logic clk,
input logic en,
input logic addr,
input logic lddr,
input logic [15:0] ldsr,
output logic [15:0] rd
);


logic dr;
logic sr;

always_ff @(posedge clk)
begin
	dr <= lddr;
	
	if(lddr != dr)
		sr <= 1;
	
	if(!ldsr && addr && en)
		sr <= 0;
end

assign rd = {15'b0, (addr ? sr : dr)};

endmodule