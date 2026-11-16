set_attr lib_search_path ../lib/
set_attr hdl_search_path ../rtl/
set_attr library slow.lib
read_hdl eight_bit_shift_reg.v
elaborate
read_sdc ../constraints/eight_bit_shift_reg.sdc
synthesize -to_mapped -effort medium
write_hdl > eight_bit_shift_reg_netlist.v
write_sdc > eight_bit_shift_reg.sdc

