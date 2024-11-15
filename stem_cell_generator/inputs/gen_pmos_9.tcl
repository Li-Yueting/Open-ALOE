source ./inputs/stem_cells.tcl
source ./inputs/extract_stem_cells.tcl

# set stem cell output folder
set script_path ./outputs/stem-cell-library

### stem cell generation start here ### 
pmos 6.45 2 9 ;#w, l, nf 
extract_sc pmos_9 $script_path
exit