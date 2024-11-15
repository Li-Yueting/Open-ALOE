from shutil import copyfile
import os 

SKYWATER130_HOME = './'
dirs = './lef/'
# lef_file_list = os.listdir(dirs)

def write_concat_lef_file(outfilename, indirs):
    first_file = True
    # print('outfilename',os.path.abspath(outfilename))
    with open(outfilename, 'w') as outfile:
        for fname in os.listdir(indirs):
            print("now merging file:", indirs+fname)
            with open(indirs+fname) as infile:
                start_macro = False
                end_macro = False
                for line in infile:
                    # Only write lines between MACRO ... END macro
                    if line.startswith('MACRO'):
                        start_macro = True
                    if line.startswith('END LIBRARY'):
                        end_macro = True
                    if (first_file and not end_macro) or (not first_file and (start_macro and not end_macro)):
                        outfile.write(line)
                first_file = False
            outfile.write('\n')
            outfile.write('#--------EOF---------')
            outfile.write('\n')
            outfile.write('\n')
        outfile.write('END LIBRARY')

write_concat_lef_file(SKYWATER130_HOME+'view-standard/stdcells.lef', dirs)