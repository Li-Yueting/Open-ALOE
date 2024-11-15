# in magic, alway draw a box and use key "s" to select 
# the exact inst before running this proc function 
proc extract_sc {inst_name output_folder} {
    select clear
    append inst_name "_flat"
    flatten $inst_name
    load $inst_name
    # save $inst_name
    box -1000 -1000 1000 1000
    select cell
    set box_pos [box position]    
    set llx [lindex $box_pos 0]    
    set lly [lindex $box_pos 1]    
    move origin right [expr $llx/2-60]  
    move origin bottom [expr -$lly/2-30]
    puts "Now the origin is:"    
    box
    # Property add here 
    property LEFclass CORE 
    property LEFsite unitasc
    
    if {$inst_name=={pmos_1_flat}} {
        property FIXED_BBOX {0 0 926 1880} ;#686+240 to avoid drc
        # GATE
        findlabel GATE
        port GATE make "nsew"
        port class inout
        port use signal 
        # SOURCE
        findlabel SOURCE
        port SOURCE make "nsew"
        port class inout 
        port use signal 
        # DRAIN
        findlabel DRAIN
        port DRAIN make "nsew"
        port class inout 
        port use signal 
        # # VPB
        # findlabel VPB
        # port make
        # port class inout
        # port use power  
        # VPWR
        findlabel VPWR
        port VPWR make "nsew"
        port class bidirectional
        port use power
        # VGND
        findlabel VGND
        port VGND make "nsew"
        port class bidirectional
        port use ground
        # set mag_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.mag] 
        # set lef_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.lef]
        cd $output_folder
        cd ./mag
        save sky130_asc_pfet_01v8_lvt_1.mag
        cd ../gds
        gds write sky130_asc_pfet_01v8_lvt_1.gds
        cd ../lef
        lef write sky130_asc_pfet_01v8_lvt_1.lef
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pfet_01v8_lvt_1.spice
    } elseif {$inst_name=={pmos_6_flat}} {
        property FIXED_BBOX {0 0 3395 1880} ;#2975+240 to avoid drc 
        # GATE
        findlabel GATE
        port GATE make "nsew"
        port class inout
        port use signal 
        # SOURCE
        findlabel SOURCE
        port SOURCE make "nsew"
        port class inout 
        port use signal 
        # DRAIN
        findlabel DRAIN
        port DRAIN make "nsew"
        port class inout 
        port use signal 
        # # VPB
        # findlabel VPB
        # port make
        # port class inout
        # port use power  
        # VPWR
        findlabel VPWR
        port VPWR make "nsew"
        port class bidirectional
        port use power
        # VGND
        findlabel VGND
        port VGND make "nsew"
        port class bidirectional
        port use ground
        # set mag_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.mag] 
        # set lef_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.lef]
        cd $output_folder
        cd ./mag
        save sky130_asc_pfet_01v8_lvt_6.mag
        cd ../lef
        lef write sky130_asc_pfet_01v8_lvt_6.lef
        cd ../gds
        gds write sky130_asc_pfet_01v8_lvt_6.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pfet_01v8_lvt_6.spice
        # puts "mag_file: $mag_file"
        # puts "lef_file: $lef_file"
        # save $mag_file
        # lef write $lef_file
    } elseif {$inst_name=={pmos_9_flat}} {
        property FIXED_BBOX {0 0 4770 1880} ;#4350+240 to avoid drc
        # GATE
        findlabel GATE
        port GATE make "nsew"
        port class inout
        port use signal 
        # SOURCE
        findlabel SOURCE
        port SOURCE make "nsew"
        port class inout 
        port use signal 
        # DRAIN
        findlabel DRAIN
        port DRAIN make "nsew"
        port class inout 
        port use signal 
        # # VPB
        # findlabel VPB
        # port make
        # port class inout
        # port use power  
        # VPWR
        findlabel VPWR
        port VPWR make "nsew"
        port class bidirectional
        port use power
        # VGND
        findlabel VGND
        port VGND make "nsew"
        port class bidirectional
        port use ground
        # set mag_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.mag] 
        # set lef_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.lef]
        cd $output_folder
        cd ./mag
        save sky130_asc_pfet_01v8_lvt_9.mag
        cd ../lef
        lef write sky130_asc_pfet_01v8_lvt_9.lef
        cd ../gds
        gds write sky130_asc_pfet_01v8_lvt_9.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pfet_01v8_lvt_9.spice
        # puts "mag_file: $mag_file"
        # puts "lef_file: $lef_file"
        # save $mag_file
        # lef write $lef_file
    } elseif {$inst_name=={pmos_12_flat}} {
        property FIXED_BBOX {0 0 5963 1880} ;#5723+240 to avoid drc
        # GATE
        findlabel GATE
        port GATE make "nsew"
        port class inout
        port use signal 
        # SOURCE
        findlabel SOURCE
        port SOURCE make "nsew"
        port class inout 
        port use signal 
        # DRAIN
        findlabel DRAIN
        port DRAIN make "nsew"
        port class inout 
        port use signal 
        # # VPB
        # findlabel VPB
        # port make
        # port class inout
        # port use power  
        # VPWR
        findlabel VPWR
        port VPWR make "nsew"
        port class bidirectional
        port use power
        # VGND
        findlabel VGND
        port VGND make "nsew"
        port class bidirectional
        port use ground
        # set mag_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.mag] 
        # set lef_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.lef]
        cd $output_folder
        cd ./mag
        save sky130_asc_pfet_01v8_lvt_12.mag
        cd ../lef
        lef write sky130_asc_pfet_01v8_lvt_12.lef
        cd ../gds
        gds write sky130_asc_pfet_01v8_lvt_12.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pfet_01v8_lvt_12.spice
        # puts "mag_file: $mag_file"
        # puts "lef_file: $lef_file"
        # save $mag_file
        # lef write $lef_file
    } elseif {$inst_name=={pmos_60_flat}} {
        property FIXED_BBOX {0 0 27947 1880} ;#27707+240 to avoid drc
        # GATE
        findlabel GATE
        port GATE make "nsew"
        port class inout
        port use signal 
        # SOURCE
        findlabel SOURCE
        port SOURCE make "nsew"
        port class inout 
        port use signal 
        # DRAIN
        findlabel DRAIN
        port DRAIN make "nsew"
        port class inout 
        port use signal 
        # # VPB
        # findlabel VPB
        # port make
        # port class inout
        # port use power  
        # VPWR
        findlabel VPWR
        port VPWR make "nsew"
        port class bidirectional
        port use power
        # VGND
        findlabel VGND
        port VGND make "nsew"
        port class bidirectional
        port use ground
        # set mag_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.mag] 
        # set lef_file [file join a b $output_folder sky130_asc_pfet_01v8_lvt_1.lef]
        cd $output_folder
        cd ./mag
        save sky130_asc_pfet_01v8_lvt_60.mag
        cd ../lef
        lef write sky130_asc_pfet_01v8_lvt_60.lef
        cd ../gds
        gds write sky130_asc_pfet_01v8_lvt_60.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pfet_01v8_lvt_60.spice
        # puts "mag_file: $mag_file"
        # puts "lef_file: $lef_file"
        # save $mag_file
        # lef write $lef_file
    } elseif {$inst_name=={nmos_1_flat}} {
        property FIXED_BBOX {0 0 854 1880} ;#614+240 to avoid drc
        # GATE
        findlabel GATE
        port make 
        port class inout
        # SOURCE
        findlabel SOURCE
        port make 
        port class inout
        # DRAIN
        findlabel DRAIN
        port make 
        port class inout
        # # VNB
        # findlabel VNB
        # port make 
        # port class inout
        # port use ground
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_nfet_01v8_lvt_1.mag
        cd ../lef
        lef write sky130_asc_nfet_01v8_lvt_1.lef
        cd ../gds
        gds write sky130_asc_nfet_01v8_lvt_1.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_nfet_01v8_lvt_1.spice
    } elseif {$inst_name=={nmos_9_flat}} {
        property FIXED_BBOX {0 0 4518 1880} ;#4278+240 to avoid drc
        # GATE
        findlabel GATE
        port make 
        port class inout
        # SOURCE
        findlabel SOURCE
        port make 
        port class inout
        # DRAIN
        findlabel DRAIN
        port make 
        port class inout
        # # VNB
        # findlabel VNB
        # port make 
        # port class inout
        # port use ground
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_nfet_01v8_lvt_9.mag
        cd ../lef
        lef write sky130_asc_nfet_01v8_lvt_9.lef
        cd ../gds
        gds write sky130_asc_nfet_01v8_lvt_9.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_nfet_01v8_lvt_9.spice
    } elseif {$inst_name=={res_1_flat}} {
        box -1000 -1000 1000 1000
        select cell
        move origin right -10 
        property FIXED_BBOX {0 0 2720 1880} ;#2440+280 to avoid drc
        # Rin
        findlabel Rin
        port make
        port class inout
        # Rout
        findlabel Rout
        port make
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_res_xhigh_po_2p85_1.mag
        cd ../lef
        lef write sky130_asc_res_xhigh_po_2p85_1 -toplayer
        cd ../gds
        gds write sky130_asc_res_xhigh_po_2p85_1.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_res_xhigh_po_2p85_1.spice
    } elseif {$inst_name=={res_2_flat}} {
        box -1000 -1000 1000 1000
        select cell
        move origin right -10 
        property FIXED_BBOX {0 0 3294 1880} ;#3014+280 to avoid drc
        # Rin
        findlabel Rin
        port make
        port class inout
        # Rout
        findlabel Rout
        port make
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_res_xhigh_po_2p85_2.mag
        cd ../lef
        lef write sky130_asc_res_xhigh_po_2p85_2 -toplayer
        cd ../gds
        gds write sky130_asc_res_xhigh_po_2p85_2.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_res_xhigh_po_2p85_2.spice
    } elseif {$inst_name=={cap_1_flat}} {
        property FIXED_BBOX {0 0 7411 1880} ;#7171+240 to avoid drc
        # c0
        findlabel Cin
        port make 
        port class inout
        # c1 
        findlabel Cout
        port make 
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_cap_mim_m3_1.mag
        cd ../lef
        lef write sky130_asc_cap_mim_m3_1 -toplayer
        cd ../gds
        gds write sky130_asc_cap_mim_m3_1.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_cap_mim_m3_1.spice
    } elseif {$inst_name=={pnp_1_flat}} {
        property FIXED_BBOX {0 0 1580 1880} ;#1340+240 to avoid drc
        # Emitter
        findlabel Emitter
        port make
        port class inout
        # Base
        findlabel Base
        port make
        port class inout
        # Collector
        findlabel Collector
        port make
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_pnp_05v5_W3p40L3p40_1.mag
        cd ../lef
        lef write sky130_asc_pnp_05v5_W3p40L3p40_1 -toplayer
        cd ../gds
        gds write sky130_asc_pnp_05v5_W3p40L3p40_1.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice subcircuit on
        ext2spice subcircuit top on
        ext2spice -o sky130_asc_pnp_05v5_W3p40L3p40_1.spice
    } elseif {$inst_name=={pnp_7_flat}} {
        property FIXED_BBOX {0 0 9620 1880} ;#9380+240 to avoid drc
        # Emitter
        findlabel Emitter
        port make
        port class inout
        # Base
        findlabel Base
        port make
        port class inout
        # Collector
        findlabel Collector
        port make
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_pnp_05v5_W3p40L3p40_7.mag
        cd ../lef
        lef write sky130_asc_pnp_05v5_W3p40L3p40_7 -toplayer
        cd ../gds
        gds write sky130_asc_pnp_05v5_W3p40L3p40_7.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice subcircuit on
        ext2spice subcircuit top on
        ext2spice -o sky130_asc_pnp_05v5_W3p40L3p40_7.spice
    } elseif {$inst_name=={pnp_8_flat}} {
        property FIXED_BBOX {0 0 10960 1880} ;#10720+240 to avoid drc
        # Emitter
        findlabel Emitter
        port make
        port class inout
        # Base
        findlabel Base
        port make
        port class inout
        # Collector
        findlabel Collector
        port make
        port class inout
        # VPWR
        findlabel VPWR
        port make 
        port class inout
        port use power
        # VGND
        findlabel VGND
        port make 
        port class inout
        port use ground
        cd $output_folder
        cd ./mag
        save sky130_asc_pnp_05v5_W3p40L3p40_8.mag
        cd ../lef
        lef write sky130_asc_pnp_05v5_W3p40L3p40_8 -toplayer
        cd ../gds
        gds write sky130_asc_pnp_05v5_W3p40L3p40_8.gds
        cd ../spi
        extract all
        ext2spice lvs
        ext2spice -o sky130_asc_pnp_05v5_W3p40L3p40_8.spice
    } else {
        puts "No inst lef generated ..."
    }
}
