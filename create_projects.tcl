set root [file normalize [file dirname [info script]]]
set circuits "$root/circuits"
set part "xc7s75fgga484-1"

create_project lab4_mult_4bit "$circuits/01_mult_4bit" -part $part -force
set_property target_language Verilog [current_project]
add_files -norecurse [list \
    "$circuits/01_mult_4bit/src/multiply_unsigned.v" \
    "$circuits/01_mult_4bit/src/mult_4bit.v"]
add_files -fileset constrs_1 -norecurse "$circuits/01_mult_4bit/constraints/lab4_mult_4bit.xdc"
add_files -fileset sim_1 -norecurse "$circuits/01_mult_4bit/sim/tb_design.v"
set_property top mult_4bit [get_filesets sources_1]
set_property top tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
set_property xsim.simulate.runtime all [get_filesets sim_1]
close_project

create_project lab4_bcd_to_binary "$circuits/02_bcd_to_binary" -part $part -force
set_property target_language Verilog [current_project]
add_files -norecurse [list \
    "$circuits/02_bcd_to_binary/src/bcd_to_binary.v" \
    "$circuits/02_bcd_to_binary/src/bcd_conv.v"]
add_files -fileset constrs_1 -norecurse "$circuits/02_bcd_to_binary/constraints/lab4_bcd_to_binary.xdc"
add_files -fileset sim_1 -norecurse "$circuits/02_bcd_to_binary/sim/tb_design.v"
set_property top bcd_conv [get_filesets sources_1]
set_property top tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
set_property xsim.simulate.runtime all [get_filesets sim_1]
close_project

puts "LAB4 Vivado projects created."
