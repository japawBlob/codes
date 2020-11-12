onerror {quit -f}
vlib work
vlog -work work VGA.vo
vlog -work work VGA.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.VGAgenerator_vlg_vec_tst
vcd file -direction VGA.msim.vcd
vcd add -internal VGAgenerator_vlg_vec_tst/*
vcd add -internal VGAgenerator_vlg_vec_tst/i1/*
add wave /*
run -all
