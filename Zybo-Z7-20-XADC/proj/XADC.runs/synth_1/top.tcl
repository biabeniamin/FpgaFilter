# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/proj/XADC.cache/wt [current_project]
set_property parent.project_path D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/proj/XADC.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part_repo_paths C:/Xilinx/board_files [current_project]
set_property board_part digilentinc.com:zybo-z7-20:part0:1.0 [current_project]
set_property ip_repo_paths d:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/repo [current_project]
set_property ip_output_repo d:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/repo/cache [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/hdl/top.v
read_vhdl -library xil_defaultlib {
  D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/proj/XADC.srcs/sources_1/new/ClockDivider.vhd
  D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/proj/XADC.srcs/sources_1/new/dac.vhd
}
read_ip -quiet D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/ip/xadc_wiz_0/xadc_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/ip/xadc_wiz_0/xadc_wiz_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/ip/xadc_wiz_0/xadc_wiz_0.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/constraints/Zybo-Z7.xdc
set_property used_in_implementation false [get_files D:/Beni/Vhdl/FpgaFilter/Zybo-Z7-20-XADC/src/constraints/Zybo-Z7.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7z020clg400-1 -flatten_hierarchy none -directive RuntimeOptimized -fsm_extraction off


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
