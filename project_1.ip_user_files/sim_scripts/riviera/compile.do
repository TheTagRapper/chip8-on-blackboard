transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../../media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/rsb/busdef" "+incdir+../../../project_1.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"/media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"/media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../../../../../media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/rsb/busdef" "+incdir+../../../project_1.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"../../../project_1.srcs/sources_1/new/bin_counter.sv" \
"../../../project_1.srcs/sources_1/new/dual_counter.sv" \
"../../../project_1.srcs/sim_1/new/dual_counter_tb.sv" \

vlog -work xil_defaultlib \
"glbl.v"

