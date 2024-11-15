rm -rf ./outputs
mkdir ./outputs
mkdir ./outputs/log
mkdir ./outputs/stem-cell-library
mkdir ./outputs/stem-cell-library/gds
mkdir ./outputs/stem-cell-library/lef
mkdir ./outputs/stem-cell-library/mag
mkdir ./outputs/stem-cell-library/spi
mkdir ./outputs/stem-cell-library/view-standard
cp .magicrc ./outputs/stem-cell-library/view-standard/.
# iteratively generate stem cells 
for file in ./inputs/*; do
    if [[ $file = ./inputs/gen_*.tcl  ]]; then
        file_name=$(echo "$(basename $file)" | cut -f 1 -d '.')
        magic -dnull -noconsole < ./inputs/$file_name.tcl |tee -a ./outputs/log/$file_name.log
    fi
done
sh ./inputs/generate_view_standard.sh | tee -a ./outputs/log/stem-cell-lib-merge.log
