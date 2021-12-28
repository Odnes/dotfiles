#!/usr/bin/env python3

# Author: odnes@tiptheiceberg.com

import argparse
import shutil
import glob
import os

# Relative path expansion is the shell's responsibility
parser = argparse.ArgumentParser(
        description='Save all config/application.yml files residing under\
                     com. parents  to a destination folder')
parser.add_argument('src', help='An arbitrary depth below this path,\
                    com. directories are to be found.')
parser.add_argument('dst',
                    help='Folder to place found application.yml_files into.')
parser.add_argument('-z', '--zim', action='store_true', help="Append links to copied files in the folder's\
                    respective zimfile. Ignore overwritten (updated) files.")

args = parser.parse_args()
src = os.path.abspath(args.src)
dst = os.path.abspath(args.dst)

os.chdir(src)
for yml_path in glob.glob('./com.*/**/config/*.yml', recursive=True):
    yml_name = os.path.basename(yml_path)
    backup_name = yml_path.split('/')[1].split('/')[0] + '.' + yml_name

    dstfile_path = dst + '/' + backup_name

    try:
        if os.path.exists(dstfile_path):
            print(dstfile_path + " overwritten. \n")
            
            zimfile = dst.rsplit('/', maxsplit=1)[0] + '/' +\
                os.path.basename(dst) + '.txt'

            # this might belong outside the loop, might also be
            # non zim-specific
            with open(zimfile, 'a') as zf:
                zf.write("[[./" + backup_name + "]]\n")
        else:
            print("Creating backup: " + dstfile_path + '\n')

        shutil.copy(yml_path, dstfile_path)
    except FileNotFoundError:
        print("Destination folder doesn't exist")


