# Combo II-DLD S75 / xc7s75fgga484-1
# SW[7:4] -> a[3:0], SW[3:0] -> b[3:0], LED[7:0] <- m[7:0]

set_property PACKAGE_PIN Y1 [get_ports {a[3]}]
set_property PACKAGE_PIN W3 [get_ports {a[2]}]
set_property PACKAGE_PIN U2 [get_ports {a[1]}]
set_property PACKAGE_PIN T1 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[*]}]

set_property PACKAGE_PIN W4 [get_ports {b[3]}]
set_property PACKAGE_PIN W1 [get_ports {b[2]}]
set_property PACKAGE_PIN V4 [get_ports {b[1]}]
set_property PACKAGE_PIN U4 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[*]}]

set_property PACKAGE_PIN L4 [get_ports {m[7]}]
set_property PACKAGE_PIN M4 [get_ports {m[6]}]
set_property PACKAGE_PIN M2 [get_ports {m[5]}]
set_property PACKAGE_PIN N7 [get_ports {m[4]}]
set_property PACKAGE_PIN M7 [get_ports {m[3]}]
set_property PACKAGE_PIN M3 [get_ports {m[2]}]
set_property PACKAGE_PIN M1 [get_ports {m[1]}]
set_property PACKAGE_PIN N5 [get_ports {m[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m[*]}]
