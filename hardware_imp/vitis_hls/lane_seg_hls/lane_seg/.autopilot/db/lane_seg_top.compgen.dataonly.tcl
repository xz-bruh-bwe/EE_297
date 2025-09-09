# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
image_r { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
out0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
ctrl { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
status_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
status_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 56
	offset_end 63
}
magic { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


