module SIMD_assertions(
		input clk,
		input rst,
		input [17:0] instruction_in,
		input [15:0] data_in,
		input [15:0] data_out,
		input [9:0] instruction_address,
		input [9:0] data_address,
	   	input data_R,
		input data_W,
		input done,
		input opcode,
		input CMD_addition,
		input CMD_substruction,
		input CMD_multiplication,
		input CMD_mul_accumulation,             
                input CMD_logic_shift_left,
                input CMD_logic_shift_right,
                input CMD_and,
                input CMD_or,
                input CMD_not,
                input CMD_loopjump,
                input CMD_setloop,
                input CMD_load,
                input CMD_store, 
		input CMD_set,
		input current_state,
		input STATE_IDLE,
		input STATE_IF,
		input STATE_ID,
		input STATE_EX,
		input STATE_MEM,
		input STATE_HALT,
		input rdata_en,
		input wdata_en
    );
	default clocking c0 @(posedge clk); endclocking

	// Functional properties
	data_R_positive: assert property (disable iff(rst) @c0 (data_R >= 0));
	data_W_positive: assert property (disable iff(rst) @c0 (data_W >= 0));
	data_in_positive: assert property (disable iff(rst) @c0 (data_in >= 0));
	data_out_positive: assert property (disable iff(rst) @c0  (data_out >= 0));
	data_address_positive: assert property (disable iff(rst) @c0 (data_address >= 0));
	instruction_in_positive: assert property (disable iff(rst) @c0 (instruction_in >= 0));
	instruction_address_positive: assert property (disable iff(rst) @c0 (instruction_address >= 0));
	opcode_range: assert property (disable iff(rst) @c0 (opcode >= 0 && opcode <= 63));
	addition: assert property (disable iff(rst) @c0 (CMD_addition <= (opcode <= 5)));
	substraction: assert property (disable iff(rst) @c0 (CMD_substruction <= (opcode <= 11)));
	multiplication: assert property (disable iff(rst) @c0 (CMD_multiplication <= (opcode <= 17)));
	mul_accumulation: assert property (disable iff(rst)@c0 (CMD_mul_accumulation <= (opcode <= 20)));
	logic_shift_left: assert property (disable iff(rst) @c0 (CMD_logic_shift_left <= (opcode <= 23)));
	logic_shift_right: assert property (disable iff(rst) @c0 (CMD_logic_shift_right <= (opcode <= 26)));
	and_check: assert property (disable iff(rst) @c0 (CMD_and <= (opcode <= 29)));
	or_check: assert property (disable iff(rst) @c0 (CMD_or <= (opcode <= 32)));
	not_check: assert property (disable iff(rst) @c0 (CMD_not <= (opcode <= 35)));
	loopjump: assert property (disable iff(rst) @c0 (CMD_loopjump <= (opcode <= 36)));
	setloop: assert property (disable iff(rst) @c0 (CMD_setloop <= (opcode <= 37)));
	load: assert property (disable iff(rst) @c0 (CMD_load <= (opcode <= 40)));
	store: assert property (disable iff(rst) @c0 (CMD_store <= (opcode <= 43)));
	set: assert property (disable iff(rst) @c0 (CMD_set <= (opcode <= 46)));   

	// Coverage properties
	data_in_data_out: cover property (disable iff(rst) @c0 (data_in |-> $past(data_out)));
	data_in_equals_data_out: cover property (disable iff(rst) @c0 (data_in == data_out));
	data_R_equals_data_W: cover property ( @c0 (data_R == data_W));
	final_state_not_done: cover property (@c0 (~done));
	data_not_at_output: cover property (@c0 (~data_out));
	read_not_enabled: cover property (@c0 (~rdata_en));
	write_not_enabled: cover property (@c0 (~wdata_en));

	// Fairness/Liveness properties
	idle_fairness: assert property (s_eventually (current_state == STATE_IDLE));
	if_fairness: assert property (s_eventually (current_state == STATE_IF));
	id_fairness: assert property (s_eventually (current_state == STATE_ID));
	ex_fairness: assert property (s_eventually (current_state == STATE_EX));
	mem_fairness: assert property (s_eventually (current_state == STATE_MEM));
	halt_fairness: assert property (s_eventually (current_state == STATE_HALT));

	// Safety properties
	current_state_safety: assert property (always (current_state));
endmodule
