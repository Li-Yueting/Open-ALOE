source ./inputs/stem_cells.tcl
source ./inputs/extract_stem_cells.tcl

# set stem cell output folder
set script_path ./outputs/stem-cell-library

### stem cell generation start here ### 
nmos 4 2 9 ;#w, l, nf 
extract_sc nmos_9 $script_path
exit