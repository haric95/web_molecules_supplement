proc load {molecule} {
	# 27 is magenta
	# 19 is green
	upvar 1 $molecule global_molecule
	# set curdir [pwd]
	set filepath /home/hari/Documents/shapers/hpc/opts/calculations/${molecule}/${molecule}.cube
	# puts $filepath
	# axes location Off
	display projection Orthographic
	display nearclip set 0.000000
	display farclip set 10.000000
	display depthcue off
	color Display Background 32
	color change rgb 32 0.86 0.98 1.0
	mol new $filepath type {cube} first 0 last -1 step 1 waitfor 1 volsets {1 }
	mol modstyle 0 0 CPK 1.000000 0.300000 25.000000 12.000000
	mol modcolor 0 0 Element
	# mol addrep 0
	# mol modstyle 1 0 Isosurface 0.06 0 0 0 1 1
	# mol modmaterial 1 0 EdgyGlass
	# mol modcolor 1 0 ColorID $color1
	# mol addrep 0
	# mol modstyle 2 0 Isosurface -0.06 0 0 0 1 1
	# mol modmaterial 2 0 EdgyGlass
	# mol modcolor 2 0 ColorID $color2
	display resize 440 350
	scale to 1
	#translate by 0 -0.2 0

	color Element O red
	color Element H white
	color Element C black
	color Element N blue
}

# proc test_rotate {axis} {
# 	for {set i 0} {$i < 40} {incr i} {
# 		#set filename $curdir/molecule/images/snap.[format "%02d" $i].tga
# 		#render TachyonInternal $filename
#    	rotate $axis by 9
#     	display update
#     	sleep 0.5 }
# }

# proc render_rotate {molecule mo_no axis} {
# 	set curdir [pwd]
# 	axes location Off
# 	for {set i 0} {$i < 40} {incr i} {
# 		set filename $curdir/$molecule/images/mo$mo_no.[format "%02d" $i].tga
# 		render Renderman $filename
#     	rotate $axis by 9
#     	display update
#    		sleep 0.5 }
# }

proc renderer {mol} {
	set curdir [pwd]
	axes location Off
	set filename /home/hari/Documents/shapers/calculations/${mol}.tga
	render TachyonInternal ${filename}
}
