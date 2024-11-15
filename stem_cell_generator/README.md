# aloe-sky130
aloe-sky130 is an analog PnR automation tool based on ALOE [1] architecture using skywater-130nm technology. This is a developing repo for our EE372 project at Stanford University. aloe-sky130 is tested on a bandgap reference (BGR) circuit. For the BGR part, we referred [2]. In the layout part, some of the tcl codes referred [3].

## Proposal & Presentation
Our project proposal & the overview presentation is [here](https://drive.google.com/drive/folders/1wuhCuDhPMV9OHajH3ZFC1K35qJaZ7o5d?usp=sharing)
## Running codes
### Step 0 - Environment Setup 
Log into farmshare follow the [instruction here, watching the video is recommended](https://ee.stanford.edu/student-resources/it-resources/ee-instructional-computing-resources)  <br>
Source singularity environment by typing: <br>
``` 
$ /farmshare/home/classes/ee/admin/software/bin/centos.sh 
``` 
Then:
``` 
$ git clone https://github.com/Li-Yueting/aloe-sky130.git 
$ cd aloe-sky130
$ source setup.csh  
```
### Step 1 - Build Stem Cell Library
``` 
$ cd ./stem_cell_generator 
$ sh run_generator.sh  
```
in magic command line put in: ``` place_pmos 0 0 2 12 1 ``` to generate stem cell for pmos/nmos/pnp/resistor/cap
## Play around toy examples (skywater130-analog-flow using mflowgen [4])
[inverter](./inverter) <br>
[ring oscillator](./ringosc) 
## Reference 
[1] Wei, Po-Hsuan, and Boris Murmann. "Analog and Mixed-Signal Layout Automation Using Digital Place-and-Route Tools." IEEE Transactions on Very Large Scale Integration (VLSI) Systems 29.11 (2021): 1838-1849. <br>
[2] https://github.com/johnkustin/bandgapReferenceCircuit <br>
[3] https://github.com/westonb/open-pmic <br>
[4] https://github.com/mflowgen/mflowgen
## Contact
Yueting Li: lyt1314@stanford.edu <br>
Xingyu Ni: xingyuni@stanford.edu
