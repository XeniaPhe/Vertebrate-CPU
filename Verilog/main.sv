module main(
input logic clk,
input logic btn_left,
input logic btn_right,
output logic [3:0] seven_segment_gnds,
output logic [6:0] seven_segment_display
);

logic [15:0] RAM [2047:0];

logic [15:0] cpu_data_in;
logic [15:0] cpu_data_out;
logic [11:0] address;
logic MEMLD;
logic INT;
logic INTACK;

logic [15:0] btn_left_out;
logic [15:0] btn_right_out;
logic [15:0] seven_segment_out;
logic [2:0] INTV;

logic btn_left_en;
logic btn_right_en;
logic seven_segment_en;

logic IRQ0;
logic [6:0] always_zero = 0;

cpu CPU(clk,cpu_data_in,cpu_data_out,address[10:0],MEMLD,INT,INTACK);

interrupt_controller(INT, INTACK, INTV, IRQ0, always_zero[0], always_zero[1],
always_zero[2], always_zero[3], always_zero[4], always_zero[5], always_zero[6]);

switch_adapter sal(clk, btn_left_en, address[0], btn_left, cpu_data_out, btn_left_out);

switch_adapter_for_interrupt sar(clk, btn_right, IRQ0, btn_right_out);

seven_segment_adapter_4 ssa_4(clk, seven_segment_en, address[0], cpu_data_out, seven_segment_out, seven_segment_gnds, seven_segment_display);


always_ff @(posedge clk)
begin
	if(MEMLD)
		RAM[address] <= cpu_data_out;
end

assign btn_left_en = (MEMLD && address[11:1] == 11'b01111111100);
assign seven_segment_en = (MEMLD && address[11:1] == 11'b01111111101);
assign btn_right_en = (MEMLD && address == 12'b011111111100);

always_comb
begin
	if(INTACK)
		cpu_data_in = {13'b0,INTV};
	else if(btn_left_en)
		cpu_data_in = btn_left_out;
	else if(btn_right_en)
		cpu_data_in = btn_right_out;
	else if(seven_segment_en)
		cpu_data_in = seven_segment_out;
	else
		cpu_data_in = RAM[address];
end

initial
begin
    $readmemh("../Assembler/Program.txt", RAM);
end
	
endmodule