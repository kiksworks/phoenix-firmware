
# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 23.1 993 win32 2025.02.22.15:49:32
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     controller
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If controller is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "controller"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga_lite/23.1std/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_nios_0_cpu_rf_ram_b.mif ./
  file copy -force $QSYS_SIMDIR/submodules/FPSqrt/FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/submodules/FPSqrt/FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/submodules/FPSqrt/FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_instruction_rom_0.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_data_ram_1.hex ./
  file copy -force $QSYS_SIMDIR/submodules/controller_data_ram_0.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cyclone10lp_ver 
vmap       cyclone10lp_ver  ./libraries/cyclone10lp_ver 
ensure_lib                  ./libraries/altera          
vmap       altera           ./libraries/altera          
ensure_lib                  ./libraries/lpm             
vmap       lpm              ./libraries/lpm             
ensure_lib                  ./libraries/sgate           
vmap       sgate            ./libraries/sgate           
ensure_lib                  ./libraries/altera_mf       
vmap       altera_mf        ./libraries/altera_mf       
ensure_lib                  ./libraries/altera_lnsim    
vmap       altera_lnsim     ./libraries/altera_lnsim    
ensure_lib                  ./libraries/cyclone10lp     
vmap       cyclone10lp      ./libraries/cyclone10lp     
ensure_lib                                                                 ./libraries/error_adapter_0                                                
vmap       error_adapter_0                                                 ./libraries/error_adapter_0                                                
ensure_lib                                                                 ./libraries/rsp_mux                                                        
vmap       rsp_mux                                                         ./libraries/rsp_mux                                                        
ensure_lib                                                                 ./libraries/cmd_mux                                                        
vmap       cmd_mux                                                         ./libraries/cmd_mux                                                        
ensure_lib                                                                 ./libraries/cmd_demux                                                      
vmap       cmd_demux                                                       ./libraries/cmd_demux                                                      
ensure_lib                                                                 ./libraries/router_001                                                     
vmap       router_001                                                      ./libraries/router_001                                                     
ensure_lib                                                                 ./libraries/router                                                         
vmap       router                                                          ./libraries/router                                                         
ensure_lib                                                                 ./libraries/avalon_st_adapter_003                                          
vmap       avalon_st_adapter_003                                           ./libraries/avalon_st_adapter_003                                          
ensure_lib                                                                 ./libraries/rsp_demux                                                      
vmap       rsp_demux                                                       ./libraries/rsp_demux                                                      
ensure_lib                                                                 ./libraries/motor_controller_5_slave_burst_adapter                         
vmap       motor_controller_5_slave_burst_adapter                          ./libraries/motor_controller_5_slave_burst_adapter                         
ensure_lib                                                                 ./libraries/router_004                                                     
vmap       router_004                                                      ./libraries/router_004                                                     
ensure_lib                                                                 ./libraries/avalon_st_adapter_005                                          
vmap       avalon_st_adapter_005                                           ./libraries/avalon_st_adapter_005                                          
ensure_lib                                                                 ./libraries/msgdma_0_descriptor_slave_cmd_width_adapter                    
vmap       msgdma_0_descriptor_slave_cmd_width_adapter                     ./libraries/msgdma_0_descriptor_slave_cmd_width_adapter                    
ensure_lib                                                                 ./libraries/router_006                                                     
vmap       router_006                                                      ./libraries/router_006                                                     
ensure_lib                                                                 ./libraries/rsp_mux_001                                                    
vmap       rsp_mux_001                                                     ./libraries/rsp_mux_001                                                    
ensure_lib                                                                 ./libraries/cmd_mux_001                                                    
vmap       cmd_mux_001                                                     ./libraries/cmd_mux_001                                                    
ensure_lib                                                                 ./libraries/cmd_demux_001                                                  
vmap       cmd_demux_001                                                   ./libraries/cmd_demux_001                                                  
ensure_lib                                                                 ./libraries/router_007                                                     
vmap       router_007                                                      ./libraries/router_007                                                     
ensure_lib                                                                 ./libraries/router_003                                                     
vmap       router_003                                                      ./libraries/router_003                                                     
ensure_lib                                                                 ./libraries/router_002                                                     
vmap       router_002                                                      ./libraries/router_002                                                     
ensure_lib                                                                 ./libraries/avalon_st_adapter                                              
vmap       avalon_st_adapter                                               ./libraries/avalon_st_adapter                                              
ensure_lib                                                                 ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
vmap       spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter    ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
ensure_lib                                                                 ./libraries/mm_bridge_2_s0_agent_rsp_fifo                                  
vmap       mm_bridge_2_s0_agent_rsp_fifo                                   ./libraries/mm_bridge_2_s0_agent_rsp_fifo                                  
ensure_lib                                                                 ./libraries/mm_bridge_2_s0_agent                                           
vmap       mm_bridge_2_s0_agent                                            ./libraries/mm_bridge_2_s0_agent                                           
ensure_lib                                                                 ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent     
vmap       spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent      ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent     
ensure_lib                                                                 ./libraries/mm_bridge_2_s0_translator                                      
vmap       mm_bridge_2_s0_translator                                       ./libraries/mm_bridge_2_s0_translator                                      
ensure_lib                                                                 ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator
vmap       spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator ./libraries/spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator
ensure_lib                                                                 ./libraries/vic_vector                                                     
vmap       vic_vector                                                      ./libraries/vic_vector                                                     
ensure_lib                                                                 ./libraries/vic_priority                                                   
vmap       vic_priority                                                    ./libraries/vic_priority                                                   
ensure_lib                                                                 ./libraries/vic_csr                                                        
vmap       vic_csr                                                         ./libraries/vic_csr                                                        
ensure_lib                                                                 ./libraries/cpu                                                            
vmap       cpu                                                             ./libraries/cpu                                                            
ensure_lib                                                                 ./libraries/read_mstr_internal                                             
vmap       read_mstr_internal                                              ./libraries/read_mstr_internal                                             
ensure_lib                                                                 ./libraries/dispatcher_internal                                            
vmap       dispatcher_internal                                             ./libraries/dispatcher_internal                                            
ensure_lib                                                                 ./libraries/fpci_multi                                                     
vmap       fpci_multi                                                      ./libraries/fpci_multi                                                     
ensure_lib                                                                 ./libraries/fpci_combi                                                     
vmap       fpci_combi                                                      ./libraries/fpci_combi                                                     
ensure_lib                                                                 ./libraries/irq_mapper                                                     
vmap       irq_mapper                                                      ./libraries/irq_mapper                                                     
ensure_lib                                                                 ./libraries/mm_interconnect_6                                              
vmap       mm_interconnect_6                                               ./libraries/mm_interconnect_6                                              
ensure_lib                                                                 ./libraries/mm_interconnect_5                                              
vmap       mm_interconnect_5                                               ./libraries/mm_interconnect_5                                              
ensure_lib                                                                 ./libraries/mm_interconnect_4                                              
vmap       mm_interconnect_4                                               ./libraries/mm_interconnect_4                                              
ensure_lib                                                                 ./libraries/mm_interconnect_3                                              
vmap       mm_interconnect_3                                               ./libraries/mm_interconnect_3                                              
ensure_lib                                                                 ./libraries/mm_interconnect_2                                              
vmap       mm_interconnect_2                                               ./libraries/mm_interconnect_2                                              
ensure_lib                                                                 ./libraries/mm_interconnect_1                                              
vmap       mm_interconnect_1                                               ./libraries/mm_interconnect_1                                              
ensure_lib                                                                 ./libraries/mm_interconnect_0                                              
vmap       mm_interconnect_0                                               ./libraries/mm_interconnect_0                                              
ensure_lib                                                                 ./libraries/nios_0_custom_instruction_master_multi_xconnect                
vmap       nios_0_custom_instruction_master_multi_xconnect                 ./libraries/nios_0_custom_instruction_master_multi_xconnect                
ensure_lib                                                                 ./libraries/nios_0_custom_instruction_master_comb_slave_translator0        
vmap       nios_0_custom_instruction_master_comb_slave_translator0         ./libraries/nios_0_custom_instruction_master_comb_slave_translator0        
ensure_lib                                                                 ./libraries/nios_0_custom_instruction_master_comb_xconnect                 
vmap       nios_0_custom_instruction_master_comb_xconnect                  ./libraries/nios_0_custom_instruction_master_comb_xconnect                 
ensure_lib                                                                 ./libraries/nios_0_custom_instruction_master_translator                    
vmap       nios_0_custom_instruction_master_translator                     ./libraries/nios_0_custom_instruction_master_translator                    
ensure_lib                                                                 ./libraries/vic_0                                                          
vmap       vic_0                                                           ./libraries/vic_0                                                          
ensure_lib                                                                 ./libraries/vector_controller_master_0                                     
vmap       vector_controller_master_0                                      ./libraries/vector_controller_master_0                                     
ensure_lib                                                                 ./libraries/timer_0                                                        
vmap       timer_0                                                         ./libraries/timer_0                                                        
ensure_lib                                                                 ./libraries/sysid_qsys_0                                                   
vmap       sysid_qsys_0                                                    ./libraries/sysid_qsys_0                                                   
ensure_lib                                                                 ./libraries/st_packets_to_bytes_0                                          
vmap       st_packets_to_bytes_0                                           ./libraries/st_packets_to_bytes_0                                          
ensure_lib                                                                 ./libraries/spim_0                                                         
vmap       spim_0                                                          ./libraries/spim_0                                                         
ensure_lib                                                                 ./libraries/spi_slave_to_avalon_mm_master_bridge_0                         
vmap       spi_slave_to_avalon_mm_master_bridge_0                          ./libraries/spi_slave_to_avalon_mm_master_bridge_0                         
ensure_lib                                                                 ./libraries/reset_controller_0                                             
vmap       reset_controller_0                                              ./libraries/reset_controller_0                                             
ensure_lib                                                                 ./libraries/pio_2                                                          
vmap       pio_2                                                           ./libraries/pio_2                                                          
ensure_lib                                                                 ./libraries/pio_1                                                          
vmap       pio_1                                                           ./libraries/pio_1                                                          
ensure_lib                                                                 ./libraries/pio_0                                                          
vmap       pio_0                                                           ./libraries/pio_0                                                          
ensure_lib                                                                 ./libraries/performance_counter_0                                          
vmap       performance_counter_0                                           ./libraries/performance_counter_0                                          
ensure_lib                                                                 ./libraries/nios_0                                                         
vmap       nios_0                                                          ./libraries/nios_0                                                         
ensure_lib                                                                 ./libraries/msgdma_0                                                       
vmap       msgdma_0                                                        ./libraries/msgdma_0                                                       
ensure_lib                                                                 ./libraries/motor_controller_5                                             
vmap       motor_controller_5                                              ./libraries/motor_controller_5                                             
ensure_lib                                                                 ./libraries/mm_bridge_0                                                    
vmap       mm_bridge_0                                                     ./libraries/mm_bridge_0                                                    
ensure_lib                                                                 ./libraries/jtag_uart_0                                                    
vmap       jtag_uart_0                                                     ./libraries/jtag_uart_0                                                    
ensure_lib                                                                 ./libraries/instruction_rom_0                                              
vmap       instruction_rom_0                                               ./libraries/instruction_rom_0                                              
ensure_lib                                                                 ./libraries/imu_spim                                                       
vmap       imu_spim                                                        ./libraries/imu_spim                                                       
ensure_lib                                                                 ./libraries/i2c_master_0                                                   
vmap       i2c_master_0                                                    ./libraries/i2c_master_0                                                   
ensure_lib                                                                 ./libraries/fpu_0                                                          
vmap       fpu_0                                                           ./libraries/fpu_0                                                          
ensure_lib                                                                 ./libraries/float32to16_0                                                  
vmap       float32to16_0                                                   ./libraries/float32to16_0                                                  
ensure_lib                                                                 ./libraries/dc_fifo_0                                                      
vmap       dc_fifo_0                                                       ./libraries/dc_fifo_0                                                      
ensure_lib                                                                 ./libraries/data_ram_1                                                     
vmap       data_ram_1                                                      ./libraries/data_ram_1                                                     
ensure_lib                                                                 ./libraries/data_ram_0                                                     
vmap       data_ram_0                                                      ./libraries/data_ram_0                                                     
ensure_lib                                                                 ./libraries/avalon_st_uart_tx_0                                            
vmap       avalon_st_uart_tx_0                                             ./libraries/avalon_st_uart_tx_0                                            

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.v"              -work cyclone10lp_ver 
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.vhd"            -work cyclone10lp     
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_components.vhd"       -work cyclone10lp     
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_avalon_st_adapter_003_error_adapter_0.sv" -work error_adapter_0                                                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_avalon_st_adapter_005_error_adapter_0.sv" -work error_adapter_0                                                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                                                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4_rsp_mux.sv"                               -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4_cmd_mux.sv"                               -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4_cmd_demux.sv"                             -work cmd_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4_router_001.sv"                            -work router_001                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4_router.sv"                                -work router                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_avalon_st_adapter_003.v"                  -work avalon_st_adapter_003                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_rsp_mux.sv"                               -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_rsp_demux.sv"                             -work rsp_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_cmd_mux.sv"                               -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_cmd_demux.sv"                             -work cmd_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                        -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                 -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                   -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                    -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                        -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                        -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                     -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                    -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                    -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                      -work motor_controller_5_slave_burst_adapter                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_router_004.sv"                            -work router_004                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_router_001.sv"                            -work router_001                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3_router.sv"                                -work router                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_avalon_st_adapter_005.v"                  -work avalon_st_adapter_005                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                        -work msgdma_0_descriptor_slave_cmd_width_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                    -work msgdma_0_descriptor_slave_cmd_width_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                   -work msgdma_0_descriptor_slave_cmd_width_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_rsp_mux.sv"                               -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_rsp_demux.sv"                             -work rsp_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_cmd_mux.sv"                               -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_cmd_demux.sv"                             -work cmd_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_router_006.sv"                            -work router_006                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_router_001.sv"                            -work router_001                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2_router.sv"                                -work router                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_rsp_mux_001.sv"                           -work rsp_mux_001                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux_001                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_cmd_mux_001.sv"                           -work cmd_mux_001                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux_001                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_cmd_demux_001.sv"                         -work cmd_demux_001                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router_007.sv"                            -work router_007                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router_004.sv"                            -work router_004                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router_003.sv"                            -work router_003                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router_002.sv"                            -work router_002                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router_001.sv"                            -work router_001                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1_router.sv"                                -work router                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter                                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work rsp_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                           -work cmd_mux                                                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                      -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                       -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                               -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                      -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_router_001.sv"                            -work router_001                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0_router.sv"                                -work router                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                               -work mm_bridge_2_s0_agent_rsp_fifo                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                          -work mm_bridge_2_s0_agent                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                   -work mm_bridge_2_s0_agent                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                         -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                     -work mm_bridge_2_s0_translator                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                    -work spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_vic_vector.sv"                                                  -work vic_vector                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_vic_priority.sv"                                                -work vic_priority                                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_vic_compare2.sv"                                                -work vic_priority                                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_vic_compare4.sv"                                                -work vic_priority                                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_vic_csr.sv"                                                     -work vic_csr                                                        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu.v"                                               -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu_debug_slave_sysclk.v"                            -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu_debug_slave_tck.v"                               -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu_debug_slave_wrapper.v"                           -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu_mult_cell.v"                                     -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0_cpu_test_bench.v"                                    -work cpu                                                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/aldec/altera_nios2_gen2_rtl_module.sv"                                 -work cpu                                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_master.v"                                                         -work read_mstr_internal                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/MM_to_ST_Adapter.v"                                                    -work read_mstr_internal                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_burst_control.v"                                                  -work read_mstr_internal                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dispatcher.v"                                                          -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/descriptor_buffers.v"                                                  -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/csr_block.v"                                                           -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/response_block.v"                                                      -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/fifo_with_byteenables.v"                                               -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_signal_breakout.v"                                                -work dispatcher_internal                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/write_signal_breakout.v"                                               -work dispatcher_internal                                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/fpoint2_multi.vhd"                                                     -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/fpoint2_multi_datapath.vhd"                                            -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/fpoint2_multi_dspba_library_package.vhd"                               -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/fpoint2_multi_dspba_library.vhd"                                       -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPAddSub/FPAddSub.vhd"                                                 -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPDiv/FPDiv.vhd"                                                       -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPMult/FPMult.vhd"                                                     -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/IntToFloat/IntToFloat.vhd"                                             -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FloatToInt/FloatToInt.vhd"                                             -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPSqrt/FPSqrt_safe_path.vhd"                                           -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPSqrt/FPSqrt.vhd"                                                     -work fpci_multi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/fpoint2_combi.vhd"                                                     -work fpci_combi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPMinMaxFused/FPMinMaxFused.vhd"                                       -work fpci_combi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPCompareFused/FPCompareFused.vhd"                                     -work fpci_combi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPNeg_Abs/FPNeg.vhd"                                                   -work fpci_combi                                                     
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QSYS_SIMDIR/submodules/FPNeg_Abs/FPAbs.vhd"                                                   -work fpci_combi                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_irq_mapper.sv"                                              -work irq_mapper                                                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_6.v"                                        -work mm_interconnect_6                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_5.v"                                        -work mm_interconnect_5                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_4.v"                                        -work mm_interconnect_4                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_3.v"                                        -work mm_interconnect_3                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_2.v"                                        -work mm_interconnect_2                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_1.v"                                        -work mm_interconnect_1                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_mm_interconnect_0.v"                                        -work mm_interconnect_0                                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_nios_0_custom_instruction_master_multi_xconnect.sv"         -work nios_0_custom_instruction_master_multi_xconnect                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_customins_slave_translator.sv"                                  -work nios_0_custom_instruction_master_comb_slave_translator0        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/controller_nios_0_custom_instruction_master_comb_xconnect.sv"          -work nios_0_custom_instruction_master_comb_xconnect                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_customins_master_translator.v"                                  -work nios_0_custom_instruction_master_translator                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_vic_0.v"                                                    -work vic_0                                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/vector_controller_master.sv"                                           -work vector_controller_master_0                                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_timer_0.v"                                                  -work timer_0                                                        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_sysid_qsys_0.v"                                             -work sysid_qsys_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"                                   -work st_packets_to_bytes_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_spim_0.v"                                                   -work spim_0                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/SPISlaveToAvalonMasterBridge.v"                                        -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master_inst_for_spichain.v"                   -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets_inst_for_spichain.v"                 -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes_inst_for_spichain.v"                 -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/channel_adapter_btop_for_spichain.v"                                   -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/channel_adapter_ptob_for_spichain.v"                                   -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/spislave_inst_for_spichain.v"                                          -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"                                     -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"                                   -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"                                   -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/spiphyslave.v"                                                         -work spi_slave_to_avalon_mm_master_bridge_0                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                             -work reset_controller_0                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                           -work reset_controller_0                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_pio_2.v"                                                    -work pio_2                                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_pio_1.v"                                                    -work pio_1                                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_pio_0.v"                                                    -work pio_0                                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_performance_counter_0.v"                                    -work performance_counter_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_nios_0.v"                                                   -work nios_0                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_msgdma_0.v"                                                 -work msgdma_0                                                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/motor_controller.sv"                                                   -work motor_controller_5                                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                                             -work mm_bridge_0                                                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_jtag_uart_0.v"                                              -work jtag_uart_0                                                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_instruction_rom_0.v"                                        -work instruction_rom_0                                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/imu_spim.sv"                                                           -work imu_spim                                                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/i2c_master.sv"                                                         -work i2c_master_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_fpu_0.v"                                                    -work fpu_0                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/float32to16.sv"                                                        -work float32to16_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                               -work dc_fifo_0                                                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                   -work dc_fifo_0                                                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                       -work dc_fifo_0                                                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_data_ram_1.v"                                               -work data_ram_1                                                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/controller_data_ram_0.v"                                               -work data_ram_0                                                     
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_st_uart_tx.sv"                                                  -work avalon_st_uart_tx_0                                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/controller.v"                                                                                                                                          
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_003 -L rsp_demux -L motor_controller_5_slave_burst_adapter -L router_004 -L avalon_st_adapter_005 -L msgdma_0_descriptor_slave_cmd_width_adapter -L router_006 -L rsp_mux_001 -L cmd_mux_001 -L cmd_demux_001 -L router_007 -L router_003 -L router_002 -L avalon_st_adapter -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter -L mm_bridge_2_s0_agent_rsp_fifo -L mm_bridge_2_s0_agent -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent -L mm_bridge_2_s0_translator -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator -L vic_vector -L vic_priority -L vic_csr -L cpu -L read_mstr_internal -L dispatcher_internal -L fpci_multi -L fpci_combi -L irq_mapper -L mm_interconnect_6 -L mm_interconnect_5 -L mm_interconnect_4 -L mm_interconnect_3 -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L nios_0_custom_instruction_master_multi_xconnect -L nios_0_custom_instruction_master_comb_slave_translator0 -L nios_0_custom_instruction_master_comb_xconnect -L nios_0_custom_instruction_master_translator -L vic_0 -L vector_controller_master_0 -L timer_0 -L sysid_qsys_0 -L st_packets_to_bytes_0 -L spim_0 -L spi_slave_to_avalon_mm_master_bridge_0 -L reset_controller_0 -L pio_2 -L pio_1 -L pio_0 -L performance_counter_0 -L nios_0 -L msgdma_0 -L motor_controller_5 -L mm_bridge_0 -L jtag_uart_0 -L instruction_rom_0 -L imu_spim -L i2c_master_0 -L fpu_0 -L float32to16_0 -L dc_fifo_0 -L data_ram_1 -L data_ram_0 -L avalon_st_uart_tx_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_003 -L rsp_demux -L motor_controller_5_slave_burst_adapter -L router_004 -L avalon_st_adapter_005 -L msgdma_0_descriptor_slave_cmd_width_adapter -L router_006 -L rsp_mux_001 -L cmd_mux_001 -L cmd_demux_001 -L router_007 -L router_003 -L router_002 -L avalon_st_adapter -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_limiter -L mm_bridge_2_s0_agent_rsp_fifo -L mm_bridge_2_s0_agent -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_agent -L mm_bridge_2_s0_translator -L spi_slave_to_avalon_mm_master_bridge_0_avalon_master_translator -L vic_vector -L vic_priority -L vic_csr -L cpu -L read_mstr_internal -L dispatcher_internal -L fpci_multi -L fpci_combi -L irq_mapper -L mm_interconnect_6 -L mm_interconnect_5 -L mm_interconnect_4 -L mm_interconnect_3 -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L nios_0_custom_instruction_master_multi_xconnect -L nios_0_custom_instruction_master_comb_slave_translator0 -L nios_0_custom_instruction_master_comb_xconnect -L nios_0_custom_instruction_master_translator -L vic_0 -L vector_controller_master_0 -L timer_0 -L sysid_qsys_0 -L st_packets_to_bytes_0 -L spim_0 -L spi_slave_to_avalon_mm_master_bridge_0 -L reset_controller_0 -L pio_2 -L pio_1 -L pio_0 -L performance_counter_0 -L nios_0 -L msgdma_0 -L motor_controller_5 -L mm_bridge_0 -L jtag_uart_0 -L instruction_rom_0 -L imu_spim -L i2c_master_0 -L fpu_0 -L float32to16_0 -L dc_fifo_0 -L data_ram_1 -L data_ram_0 -L avalon_st_uart_tx_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
