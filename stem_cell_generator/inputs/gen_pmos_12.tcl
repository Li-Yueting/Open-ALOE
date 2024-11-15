source ./inputs/stem_cells.tcl
source ./inputs/extract_stem_cells.tcl

# set stem cell output folder
set script_path ./outputs/stem-cell-library

### stem cell generation start here ### 
pmos 6.45 2 12 ;#w, l, nf 
extract_sc pmos_12 $script_path
exit