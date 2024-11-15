from shutil import copyfile
import os 

SKYWATER130_HOME = './'
dirs = './spi/'

def write_concat_spi_file(outfilename, indirs):
    first_file = True
    # print('outfilename',os.path.abspath(outfilename))
    with open(outfilename, 'w') as outfile:
        for fname in os.listdir(indirs):
            if fname.endswith(".spice"):
                print("now merging file:", indirs+fname)
                with open(indirs+fname) as infile:
                    start_subckt = False
                    for line in infile:
                        # Only write lines between MACRO ... END macro
                        if line.startswith('.subckt'):
                            start_subckt = True
                        if (start_subckt):
                            outfile.write(line)
                outfile.write('\n')
write_concat_spi_file(SKYWATER130_HOME+'view-standard/stdcells.spi', dirs)