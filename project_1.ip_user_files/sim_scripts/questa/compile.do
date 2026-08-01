vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" \
"/media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93  \
"/media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" \
"../../../project_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../project_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
"../../../project_1.gen/sources_1/ip/hdmi_tx_0/hdl/encode.v" \
"../../../project_1.gen/sources_1/ip/hdmi_tx_0/hdl/serdes_10_to_1.v" \
"../../../project_1.gen/sources_1/ip/hdmi_tx_0/hdl/srldelay.v" \
"../../../project_1.gen/sources_1/ip/hdmi_tx_0/hdl/hdmi_tx_v1_0.v" \
"../../../project_1.gen/sources_1/ip/hdmi_tx_0/sim/hdmi_tx_0.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv "+incdir+../../../../../../../../media/pyra/88d368f5-2c7d-43f4-90cd-458b64c9c5111/Vivado/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" \
"../../../project_1.srcs/sources_1/new/clock_div.sv" \
"../../../project_1.srcs/sources_1/new/dual_counter.sv" \
"../../../project_1.srcs/sources_1/new/bin_counter.sv" \
"../../../project_1.srcs/sources_1/new/clk_div.sv" \
"../../../project_1.srcs/sources_1/new/matrix_decoder.sv" \
"../../../project_1.srcs/sources_1/new/matrix_to_sevenseg.sv" \
"../../../project_1.srcs/sources_1/new/sevenseg_decoder.sv" \
"../../../project_1.srcs/sources_1/new/testingPMODC.sv" \
"../../../project_1.srcs/sources_1/new/vga_controller.sv" \
"../../../project_1.srcs/sources_1/new/display_controller.sv" \
"../../../project_1.srcs/sim_1/new/matrix_decoder_tb.sv" \
"../../../project_1.srcs/sim_1/new/matrix_to_sevenseg_tb.sv" \
"../../../project_1.srcs/sim_1/new/bin_counter_tb.sv" \
"../../../project_1.srcs/sim_1/new/dual_counter_tb.sv" \

vlog -work xil_defaultlib \
"glbl.v"

