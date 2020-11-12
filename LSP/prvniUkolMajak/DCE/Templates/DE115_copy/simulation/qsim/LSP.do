onerror {quit -f}
vlib work
vlog -work work LSP.vo
vlog -work work LSP.vt
vsim -novopt -c -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver work.majakEA_vlg_vec_tst
vcd file -direction LSP.msim.vcd
vcd add -internal majakEA_vlg_vec_tst/*
vcd add -internal majakEA_vlg_vec_tst/i1/*
add wave /*
run -all
