proc load {molecule mos} {
	# 27 is magenta
	# 19 is green
	upvar 1 $molecule global_molecule
	set curdir [pwd]
	# may have to change this line to .cube
	set filepath $curdir/$molecule/${molecule}.cub
	puts $filepath
	axes location Off
	display projection Orthographic
	display nearclip set 0.000000
	display farclip set 10.000000
	display depthcue off
	color Display Background 32
	color change rgb 32 0.86 0.98 1.0
	mol new $filepath type {cube} first 0 last -1 step 1 waitfor 1 volsets $mos
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
	display resize 600 400
	scale to 1
	#translate by 0 -0.2 0
	color Element O red
	color Element H white
	color Element C black
	color Element N blue
}

proc mol_render {molecule} {
	set curdir [pwd]
	set filepath $curdir/$molecule/${molecule}
	puts $filepath
	render Wavefront ${filepath}.obj true
}

proc to_mos {lowest_mo} {
	mol modstyle 0 0 Isosurface 0.02 $lowest_mo 0 0 1 1
	mol modcolor 0 0 ColorID 0
	mol addrep 0
	mol modstyle 1 0 Isosurface -0.02 $lowest_mo 0 0 1 1
	mol modcolor 1 0 ColorID 1
}

proc mos_render {molecule mos} {
	foreach mo_no $mos {
		set filename_mo_no [expr {$mo_no}]
		set curdir [pwd]
		set filepath $curdir/$molecule/${molecule}_mo${filename_mo_no}
		render Wavefront ${filepath}.obj true
		mol modstyle 0 0 Isosurface 0.02 $mo_no 0 0 1 1
		mol modstyle 1 0 Isosurface -0.02 $mo_no 0 0 1 1
	}
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
	set filename $curdir/${mol}.tga
	render TachyonInternal $filename -aasamples 12
}

# # load molecule
# mol new {/home/hari/Documents/shapers/calculations/ch4/ch4_mo1.cub} type {cube} first 0 last -1 step 1 waitfor 1 volsets {0 1 2 3 4 5 6 }
# #change view to atom coloured CPK
# mol modcolor 0 0 Element
# mol modstyle 0 0 CPK 1.000000 0.300000 14.000000 12.000000
# # then would want to render out the object
# # then render out the molecular orbitals
# mol modstyle 0 0 Isosurface 0.02 0 0 0 1 1
# mol color Element
# mol representation Isosurface -0.02 0 0 1 1 
# mol selection all mol material 
# # change displayed isosurface. here change it to 4th MO
# mol modstyle 1 0 Isosurface -0.003009 4 0 0 2 1
# # render out to file
# render Wavefront vmdscene.obj true
