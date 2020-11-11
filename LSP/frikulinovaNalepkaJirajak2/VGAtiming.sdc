## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

## DATE    "Sat May 02 13:38:38 2015"
## SPS2015.sdc and DE2.sdc are identical files. 
## The file is here under 2 names only for compatibily with older projects. 
## In newer projects, you should use SPS2015.sdc

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

#create_clock -name {CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLK}]
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
#create_clock -name {CLOCK_27} -period 37.000 -waveform { 0.000 18.500 } [get_ports {CLOCK_27}]
create_generated_clock -name VGA_CLK -source [get_ports {CLOCK_50}] -divide_by 2 [get_ports {VGA_CLK}]
#create_generated_clock -name VGA_VS -source [get_ports {CLOCK_50}] -divide_by 420000 [get_ports {VGA_VS}]
derive_pll_clocks


#**************************************************************
# Create Generated Clock
#**************************************************************


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_ports {KEY[0]}] -to [all_registers]

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

