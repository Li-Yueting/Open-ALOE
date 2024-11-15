proc shift_to_center {} {
	set res1 [box size]
	puts "************************************"
	puts $res1
	move [expr {-[lindex $res1 0] / 2}]i [expr {-[lindex $res1 1] / 2}]i
	return $res1
}

proc shift_to_center_cap_1 {} {
	set res1 [box size]
	puts "************************************"
	puts $res1
	move 1443 25
	return $res1
}

proc shift_to_center_cap_2 {} {
	set res1 [box size]
	puts "************************************"
	puts $res1
	move 2243.5 25
	return $res1
}

# generate pmos stem cell 
proc pmos {width length nf} {
	# input arg [um]
	set index 0
	box 0 0 0 0 
	magic::gencell sky130::sky130_fd_pr__pfet_01v8_lvt [format "xm%d" $index] w $width l $length m 1 nf $nf diffcov 100 polycov 100 guard 0 glc 0 grc 0 gtc 0 gbc 0 tbcov 0 rlcov 0 topc 0 botc 0 poverlap 0 doverlap 1 lmin 0.15 wmin 0.42 compatible {sky130_fd_pr__pfet_01v8  sky130_fd_pr__pfet_01v8_lvt sky130_fd_pr__pfet_01v8_hvt  sky130_fd_pr__pfet_g5v0d10v5} full_metal 0 viasrc 100 viadrn 100 viagate 0 viagb 0 viagr 0 viagl 0 viagt 0
	set box_size [shift_to_center]
	set bx [expr {[lindex $box_size 0]/2}]
	set by [expr {[lindex $box_size 1]/2}]
	puts "by is : $by"
    set height_half_center 380
	set power_half_w 30
	set con_sep [expr $length*100] ;#unit conversion
	set con_w 30
	### unit conversion here
	### extend NWELL
	box [expr -$bx/2] 0 [expr $bx/2] [expr $height_half_center + $power_half_w+60]
	paint nwell
	### paint VPWR
	box [expr -$bx/2] [expr $height_half_center - $power_half_w+60] [expr $bx/2] [expr $height_half_center + $power_half_w+60]
	paint m1
	box [expr -$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $height_half_center + $con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr -$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr -$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	box [expr -$bx/2] [expr $height_half_center-$con_w/2+60] [expr -$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	label VPWR FreeSans 30
	########## add body pin ###########
	box [expr -$bx/2-5] [expr $height_half_center-$con_w/2+60] [expr -$bx/2+$con_w-5] [expr $height_half_center+$con_w/2+60]
	label VPB FreeSans 30
	### paint VGND
	box [expr -$bx/2] [expr -$height_half_center-$power_half_w-120] [expr $bx/2] [expr -$height_half_center+$power_half_w-120]
	paint m1
	box [expr -$bx/2] [expr -$height_half_center-$con_w/2-120] [expr $bx/2] [expr -$height_half_center+$con_w/2-120]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr -$bx/2+$x-$con_w/2] [expr -$height_half_center-$con_w/2-120] [expr -$bx/2+$x+$con_w/2]  [expr -$height_half_center+$con_w/2-120]
		paint viali
	}
	box [expr -$bx/2] [expr -$height_half_center-$con_w/2-120] [expr -$bx/2+$con_w] [expr -$height_half_center+$con_w/2-120]
	label VGND FreeSans 30
	### paint SOURCE rail
	box [expr -$bx/2] [expr $height_half_center-$con_w/2] [expr $bx/2] [expr $height_half_center+$con_w/2]
	paint li
    box [expr $bx/2-$con_w] [expr $height_half_center-$con_w/2] [expr $bx/2] [expr $height_half_center+$con_w/2]
	label SOURCE FreeSans 30
	### paint DRAIN rail
	box [expr -$bx/2] [expr -$height_half_center-$con_w/2] [expr $bx/2] [expr -$height_half_center+$con_w/2]
	paint li
	box [expr $bx/2-$con_w] [expr -$height_half_center-$con_w/2] [expr $bx/2] [expr -$height_half_center+$con_w/2]
	label DRAIN FreeSans 30
	### paint GATE rail
	set gate_w 50  
	box [expr -$bx/2] [expr -$by/2-80-$gate_w/2] [expr $bx/2]  [expr -$by/2-80+$gate_w/2]
	paint p
	box [expr -$bx/2] [expr -$by/2-80-15] [expr $bx/2]  [expr -$by/2-80+15]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr - $bx/2 + $x - $con_w/2] [expr - $by/2 - $con_w/2 - 80] [expr - $bx/2 + $x+$con_w/2]  [expr - $by/2 + $con_w/2 - 80]
		paint pcontact
	}
	box [expr $bx/2-$con_w] [expr - $by/2 - $con_w/2 - 80] [expr $bx/2]  [expr - $by/2 + $con_w/2 - 80]
	label GATE FreeSans 30
	### paint GATE connection
	for {set x 150} {$x+$con_w + 28<=$bx} {set x [expr $x + $con_sep + 28]} {
		box [expr -$bx/2+$x-$con_w] [expr -$by/2-70] [expr -$bx/2+$x+$con_w]  [expr -$by/2+$con_w]
		paint polysilicon
	}
	### paint source connection
	for {set x [expr 23.5+$con_sep+29]} {$x+29<=$bx} {set x [expr $x+2*$con_sep+2*29]} {
		box [expr -$bx/2+$x] [expr $by/2-40] [expr -$bx/2+$x+17]  [expr $height_half_center]
		paint li
	}
    ### paint drain connection
	for {set x 23.5} {$x+29<=$bx} {set x [expr $x+2*$con_sep+2*29]} {
		box [expr -$bx/2+$x] [expr -$by/2+40] [expr -$bx/2+$x+17]  [expr -$height_half_center]
		paint li
	}
	return $box_size
}

proc nmos {width length nf} {
	set index 0
	box 0 0 0 0 
	magic::gencell sky130::sky130_fd_pr__nfet_01v8_lvt [format "xm%d" $index] w $width l $length m 1 nf $nf diffcov 100 polycov 100 guard 0 glc 0 grc 0 gtc 0 gbc 0 tbcov 0 rlcov 0 topc 0 botc 0 poverlap 0 doverlap 1 lmin 0.15 wmin 0.42 compatible {sky130_fd_pr__pfet_01v8  sky130_fd_pr__pfet_01v8_lvt sky130_fd_pr__pfet_01v8_hvt  sky130_fd_pr__pfet_g5v0d10v5} full_metal 0 viasrc 100 viadrn 100 viagate 0 viagb 0 viagr 0 viagl 0 viagt 0
	set box_size [shift_to_center]
	set bx [expr {[lindex $box_size 0]/2}]
	set by [expr {[lindex $box_size 1]/2}]
	puts "by is : $by"
	set height_half_center 245
	set power_half_w 30
	set con_w 30
	### unit conversion here
	set con_sep  [expr $length*100] 
	### extend PWELL to VSS
	box [expr -$bx/2] 0 [expr $bx/2] [expr -$height_half_center+$con_w/2-120]
	paint pwell
	### paint VDD
	box [expr -$bx/2] [expr $height_half_center - $power_half_w+60] [expr $bx/2] [expr $height_half_center + $power_half_w+60]
	paint m1
	box [expr -$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $height_half_center + $con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr -$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr -$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	box [expr -$bx/2] [expr $height_half_center-$con_w/2+60] [expr -$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	label VPWR FreeSans 30
	### paint VSS
	box [expr -$bx/2] [expr -$height_half_center-$power_half_w-120] [expr $bx/2] [expr -$height_half_center+$power_half_w-120]
	paint m1
	box [expr -$bx/2] [expr -$height_half_center-$con_w/2-120] [expr $bx/2] [expr -$height_half_center+$con_w/2-120]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr -$bx/2+$x-$con_w/2] [expr -$height_half_center-$con_w/2-120] [expr -$bx/2+$x+$con_w/2]  [expr -$height_half_center+$con_w/2-120]
		paint viali
	}
	box [expr -$bx/2] [expr -$height_half_center-$con_w/2-120] [expr -$bx/2+$con_w] [expr 0-$height_half_center+$con_w/2-120]
	label VGND FreeSans 30
	### paint SOURCE rail
	box [expr -$bx/2] [expr +$height_half_center-$con_w/2] [expr $bx/2] [expr $height_half_center+$con_w/2]
	paint li
	box [expr +$bx/2-$con_w] [expr +$height_half_center-$con_w/2] [expr $bx/2] [expr $height_half_center+$con_w/2]
	label SOURCE FreeSans 30
	### paint DRAIN rail
	box [expr 0-$bx/2] [expr 0-$height_half_center-$con_w/2] [expr $bx/2] [expr 0-$height_half_center+$con_w/2]
	paint li
	box [expr $bx/2-$con_w] [expr 0-$height_half_center-$con_w/2] [expr $bx/2] [expr 0-$height_half_center+$con_w/2]
	label DRAIN FreeSans 30
	### paint GATE rail
	set gate_w 50  
	box [expr -$bx/2] [expr -$by/2-80-$gate_w/2] [expr $bx/2]  [expr -$by/2-80+$gate_w/2]
	paint p
	box [expr -$bx/2] [expr -$by/2-80-15] [expr $bx/2]  [expr -$by/2-80+15]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr - $bx/2 + $x - $con_w/2] [expr - $by/2 - $con_w/2 - 80] [expr - $bx/2 + $x+$con_w/2]  [expr - $by/2 + $con_w/2 - 80]
		paint pcontact
	}
	box [expr $bx/2-$con_w] [expr - $by/2 - $con_w/2 - 80] [expr $bx/2]  [expr - $by/2 + $con_w/2 - 80]
	label GATE FreeSans 30
	### paint GATE connection
	for {set x 133} {$x+$con_w + 28<=$bx} {set x [expr $x + $con_sep + 28]} {
		box [expr -$bx/2+$x-$con_w] [expr -$by/2-70] [expr -$bx/2+$x+$con_w]  [expr -$by/2+$con_w]
		paint p
	}
	### paint source connection
	for {set x [expr 5.5+$con_sep+29]} {$x+10<=$bx} {set x [expr $x+2*$con_sep+2*29]} {
		box [expr -$bx/2+$x] [expr $by/2-40] [expr 0-$bx/2+$x+17]  [expr $height_half_center]
		paint li
	}
	### paint drain connection
	for {set x 5.5} {$x+29<=$bx} {set x [expr $x+2*$con_sep+2*29]} {
		box [expr -$bx/2+$x] [expr -$by/2+40] [expr -$bx/2+$x+17]  [expr -$height_half_center]
		paint li
	}
	return $box_size
}

proc place_cap_1 {x_center y_center index} {
	load cap_1
	# input arg [um]
	box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um  
	# box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um 
	magic::gencell sky130::sky130_fd_pr__cap_mim_m3_1 [format "xm%d" $index] w 2.00 l 2.00 val 5.36 carea 1.00 cperi 0.17 nx 10 ny 2 dummy 0 square 1 lmin 2.00 wmin 2.00 lmax 30.0 wmax 30.0 dc 0 bconnect 0 tconnect 0 ccov 100
	set box_size [shift_to_center_cap_1]
	set bx [expr {[lindex $box_size 0]/2}]
	set by [expr {[lindex $box_size 1]/2}]
	set height_half_center 380
	set power_half_w 30
	set con_w 30
	### unit conversion here
	set con_sep  [expr 2*100]
	set x_center [expr 0*100]
	set y_center [expr $y_center*100]
	### connect parrallel caps
	# ------ label Cin
	box [expr -$bx/2] [expr $by/2-40] [expr -$bx/2+100] [expr $by/2]
	paint m2
	label Cin FreeSans 50
	box [expr -$bx/2] [expr -$by/2] [expr $bx/2+1] [expr $by/2]
	paint m3
	box [expr -$bx/2+10] [expr $by/2-35] [expr -$bx/2+90] [expr $by/2-5]
	paint via2
    ### m4 vertical connections
	set m4_w 160
	for {set x [expr -$bx/2+70]} {$x+$m4_w<=$bx/2} {set x [expr $x + 360]} {
		box [expr $x] [expr -$by/2-60] [expr $x+$m4_w]  [expr $by/2-60]
		paint m4
	}
	
	#------ label Cout
	
	### m4 horizontal rail
	box [expr 0-$bx/2] [expr -$by/2-50] [expr 0 + $bx/2] [expr -$by/2-110]
	paint m4
	box [expr 0-$bx/2] [expr -$by/2-50] [expr 0 - $bx/2+100] [expr -$by/2-110]
	paint m3
	box [expr 0-$bx/2+10] [expr -$by/2-55] [expr 0 - $bx/2+90] [expr -$by/2-105]
	paint via3
	box [expr 0-$bx/2+20] [expr -$by/2-60] [expr 0 - $bx/2+80] [expr -$by/2-100]
    paint via2
	box [expr 0-$bx/2+10] [expr -$by/2-55] [expr 0 - $bx/2+90] [expr -$by/2-105]
	paint m2
	label Cout FreeSans 50
	# paint m3
	# paint via2
	# paint m2
	
	### paint VDD
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w+60] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w+60]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $y_center + $height_half_center + $con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$x+$con_w/2] [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	#------ label VPWR
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	paint m1
	label VPWR FreeSans 50
	### paint VSS
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w-120] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w-120]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2-120]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2-120]
		paint viali
	}
	#------ label VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2-120]
	paint m1
	label VGND FreeSans 50 
}

proc place_cap_2 {x_center y_center index} {
	load cap_2
	# input arg [um]
	box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um  
	# box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um 
	magic::gencell sky130::sky130_fd_pr__cap_mim_m3_2 [format "xm%d" $index] w 2.00 l 2.00 val 5.36 carea 2.00 cperi 0.17 nx 10 ny 2 dummy 0 square 1 lmin 2.00 wmin 2.00 lmax 30.0 wmax 30.0 dc 0 bconnect 1 tconnect 1 ccov 100
	set box_size [shift_to_center_cap_2]
	set bx [expr {[lindex $box_size 0]/2}]
	set by [expr {[lindex $box_size 1]/2}]
	set height_half_center 380
	set power_half_w 30
	set con_w 30
	### unit conversion here
	set con_sep  [expr 2*100]
	set x_center [expr 0*100]
	set y_center [expr $y_center*100]

	# ## m4 connections
	# box [expr -$bx/2] [expr -$by/2+20] [expr $bx/2] [expr $by/2+30]
	# paint m4
	# # ------ label c0
	# box [expr -$bx/2] [expr $by/2] [expr -$bx/2+30] [expr $by/2+30]
	# label c0 FreeSans 50
    # ### m5 connections
	# box [expr -$bx/2] [expr -$by/2-30] [expr $bx/2+10] [expr $by/2]
	# paint m5
	# #------ label c1
	# box [expr -$bx/2] [expr -$by/2-30] [expr -$bx/2+30] [expr -$by/2]
	# label c1 FreeSans 50


	### paint VDD
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w+60] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w+60]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $y_center + $height_half_center + $con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$x+$con_w/2] [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	#------ label VPWR
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	paint m1
	label VPWR FreeSans 50
	### paint VSS
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w-120] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w-120]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2-120]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2-120]
		paint viali
	}
	#------ label VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2-120] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2-120]
	paint m1
	label VGND FreeSans 50 
}

proc place_res_1 {x_center y_center index} {
    set bx 1220
    # set by 
    set height_half_center 440
	set power_half_w 30
	set con_sep 100 ;#unit conversion
	set con_w 30

    box -394 97.5 394 382.5
    paint xpolyres

    box 402.5 105.5 601 374.5
    paint viali
    box 394 97.5 610 382.5
    paint xpolycontact
    box 394 97.5 610 382.5
    paint locali
    box 399.5 99.5 604.5 380.5
    paint metal1

    box -601 105.5 -402.5 374.5
    paint viali
    box -610 97.5 -394 382.5
    paint xpolycontact
    box -610 97.5 -394 382.5
    paint locali
    box -604.5 99.5 -399.5 380.5
    paint metal1
    box -550 210 -490 270
    label Rin FreeSans 30

    box -394 -382.5 394 -97.5
    paint xpolyres

    box 402.5 -374.5 601 -105.5
    paint viali
    box 394 -382.5 610 -97.5
    paint xpolycontact
    box 394 -382.5 610 -97.5
    paint locali
    box 399.5 -380.5 604.5 -99.5
    paint metal1

    box -601 -374.5 -402.5 -105.5
    paint viali
    box -610 -382.5 -394 -97.5
    paint xpolycontact
    box -610 -382.5 -394 -97.5
    paint locali
    box -604.5 -380.5 -399.5 -99.5
    paint metal1
    box -550 -270 -490 -210
    label Rout FreeSans 30

    box 394 -382.5 610 99.5
    paint m1
    paint locali

	### paint VPWR
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w +60] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w+60]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $y_center + $height_half_center + $con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	paint m1
	label VPWR FreeSans 50

	### paint VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2]
	paint m1
	label VGND FreeSans 50
	# bulk
	box -610 -470 610 385 
	paint pwell
	box -124 -30 124 30
	paint psubstratepcontact
	box -154 -45 154 45
	paint psubstratepdiff
	box -154 -445 154 45
	paint locali
}

# w = 2.85    l = 7.88 x 2   10.75 x 2
proc place_res_2 {x_center y_center index} {
    set bx 1507
    # set by 
    set height_half_center 440
	set power_half_w 30
	set con_sep 100 ;#unit conversion
	set con_w 30

	# box -394 97.5 394 382.5
    box -537.5 97.5 537.5 382.5
    paint xpolyres

    # box 402.5 105.5 601 374.5
	box 546 105.5 744.5 374.5
    paint viali
    box 537.5 97.5 753.5 382.5
    paint xpolycontact
    box 537.5 97.5 753.5 382.5
    paint locali
    box 543 99.5 748 380.5
    paint metal1

    box -744.5 105.5 -546 374.5
    paint viali
    box -753.5 97.5 -537.5 382.5
    paint xpolycontact
    box -753.5 97.5 -537.5 382.5
    paint locali
    box -748 99.5 -543 380.5
    paint metal1
    box -693.5 210 -633.5 270
	# box -550 210 -490 270
    label Rin FreeSans 30

    box -537.5 -382.5 537.5 -97.5
    paint xpolyres

    box 546 -374.5 744.5 -105.5
    paint viali
    box 537.5 -382.5 753.5 -97.5
    paint xpolycontact
    box 537.5 -382.5 753.5 -97.5
    paint locali
    box 543 -380.5 748 -99.5
    paint metal1

    box -744.5 -374.5 -546 -105.5
    paint viali
    box -753.5 -382.5 -537.5 -97.5
    paint xpolycontact
    box -753.5 -382.5 -537.5 -97.5
    paint locali
    box -748 -380.5 -543 -99.5
    paint metal1
    box -693.5 -270 -633.5 -210
    label Rout FreeSans 30

    box 537.5 -382.5 753.5 99.5
    paint m1
    paint locali

	### paint VPWR
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w+60] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w+60]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr $bx/2] [expr $height_half_center+$con_w/2+60]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2+60]
		paint viali
	}
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2+60] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2+60]
	paint m1
	label VPWR FreeSans 50

	### paint VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2]
	paint m1
	label VGND FreeSans 50

	# bulk
	box -610 -470 610 385 
	paint pwell
	box -124 -30 124 30
	paint psubstratepcontact
	box -154 -45 154 45
	paint psubstratepdiff
	box -154 -445 154 45
	paint locali
}

proc place_pnp_1 {x_center y_center index} {

	box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um  
	magic::gencell sky130::sky130_fd_pr__rf_pnp_05v5_W3p40L3p40 [format "xm%d" $index] 
    set box_size [shift_to_center]
	set bx [expr {[lindex $box_size 0]/2}]
    set height_half_center 470
	set power_half_w 30
	set con_sep 100 ;#unit conversion
	set con_w 30

    # Todo: check patint li
	### label Collector
	box 70 292 130 312
	paint li
	label Collector FreeSans 30
	### label Base
	box 52 216 112 236
	paint li
	label Base FreeSans 30
	### label Emitter
	box -54 35 60 100
	paint li
	label Emitter FreeSans 30

	### paint VPWR
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2] [expr $bx/2] [expr $y_center + $height_half_center + $con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2]
	paint m1
	label VPWR FreeSans 50

	### paint VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2]
	paint m1
	label VGND FreeSans 50
	puts $bx/2
}

proc place_pnp {x_center y_center mult index} {
	box [expr 0]um [expr $y_center]um [expr 0]um [expr $y_center]um  
	magic::gencell sky130::sky130_fd_pr__rf_pnp_05v5_W3p40L3p40 [format "xm%d" $index] 
	
	for {set i 1} {$i <= $mult-1} {set i [expr $i + 1]} {
		copy to [expr 670*$i] 0
	}

	box 643 13 684 657
	paint locali
	paint psubstratepdiff

	# Conncet Collector
	for {set j 1} {$j <= $mult-2} {set j [expr $j + 1]} {
		copy to [expr 643+670*$j] 13
		paint locali
		paint psubstratepdiff
	}

	box 0 0 [expr 670*$mult] 670
    set box_size [shift_to_center]
	set bx [expr {[lindex $box_size 0]/2}]
	set x_center [expr 670*$mult/2]
	set y_center 335
    set height_half_center 470
	set power_half_w 30
	set con_sep 100 ;#unit conversion
	set con_w 30

	# Connect Emitter
	box 182 182 [expr $bx-182] 488
	paint metal1
	# Connect Base
	box 95 540 [expr $bx-95] 575
	paint metal1
	for {set n 0} {$n<$mult} {set n [expr $n+1]} {
		for {set x 105} {$x+17< [expr 670-95]} {set x [expr $x+45]} {
			box [expr $n*670+$x] 550 [expr $n*670+$x+17] 567
			paint mcon
		} 
	}
	# Connect Collector
	box 13 615 [expr $bx-13] 650 
	paint metal1
	for {set n 0} {$n<$mult} {set n [expr $n+1]} {
		for {set x 23} {$x+17< [expr 670-13]} {set x [expr $x+45]} {
			box [expr $n*670+$x] 630 [expr $n*670+$x+17] 647
			paint mcon
		} 
	}
	paint metal1
	# # Connect Base and Collector
	# box 13 570 [expr 668.375*$mult] 657
	# paint locali
	# box 13 13 [expr 668.375*$mult] 100
	# paint locali

    # Todo: check patint li
	### label Collector
	box 13 627 133 647
	label Collector FreeSans 30
	### label Base
	box 95 551 215 571
	label Base FreeSans 30
	## label Emitter
	box 270 370 390 435
	label Emitter FreeSans 30

	### paint VPWR
	box [expr 0-$bx/2] [expr $height_half_center - $power_half_w] [expr 0 + $bx/2] [expr $y_center + $height_half_center + $power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2] [expr $bx/2] [expr $y_center + $height_half_center + $con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $height_half_center+$con_w/2]
	paint m1
	label VPWR FreeSans 50

	### paint VGND
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$power_half_w] [expr $bx/2] [expr $y_center-$height_half_center+$power_half_w]
	paint m1
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr $bx/2] [expr $y_center-$height_half_center+$con_w/2]
	paint li
	for {set x 100} {$x+$con_w<=$bx} {set x [expr $x + $con_sep]} {
		box [expr 0-$bx/2+$x-$con_w/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$x+$con_w/2]  [expr $y_center-$height_half_center+$con_w/2]
		paint viali
	}
	box [expr 0-$bx/2] [expr $y_center-$height_half_center-$con_w/2] [expr 0-$bx/2+$con_w] [expr $y_center-$height_half_center+$con_w/2]
	paint m1
	label VGND FreeSans 50

	puts $bx/2
}

# set customized parameters that usually don't change in one element 
proc inst_param_customize {inst_name guard topc botc doverlap lmin wmin viagate} {
	append inst_name "_defaults"
	set params [sky130::$inst_name]
	dict set params guard $guard
	dict set params topc $topc
	dict set params botc $botc
	dict set params doverlap $doverlap
	dict set params lmin $lmin
	dict set params wmin $wmin
	dict set params viagate $viagate
	return $params
}
######################## Instance Placement Illustration #####################
#	inst_name guard topc botc lmin wmin viagate
#	inst_name x_center y_center width length nf index params
##############################################################################

### some simple test ###
# load first_try
### PFET PLACEMENT ###
# set params [inst_param_customize "sky130_fd_pr__pfet_01v8_lvt" 0 0 1 0 0.35 0.42 50]  
# place_inst "sky130_fd_pr__pfet_01v8_lvt" 0 10 12.9 2 14 1 $params
# ### NFET PLACEMENT ###
# set params [inst_param_customize "sky130_fd_pr__nfet_01v8_lvt" 0 0 1 0 0.15 0.42 50]  
# place_inst "sky130_fd_pr__nfet_01v8_lvt" 0 -10 9 2 1 2 $params

# place_sky130_fd_pr__res_xhigh_po_2p85 0 0 2.850 31.52 17 22.132k 1