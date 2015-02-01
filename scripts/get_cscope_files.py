import os
import sys
import re

folder_exclude_pattern = set([
    '.svn',
    '.hg',
    '.git',
    '.cvs',
    ])

if __name__ == '__main__':

    if len(sys.argv) == 2:
        curdir = sys.argv[1]
    else:
        curdir = os.getcwd()

    file_count = 1
    cscope_files = open('cscope.files', 'w')

    for (path, dirs, files) in os.walk(curdir, topdown=True):
        dirs[:] = [d for d in dirs if d not in folder_exclude_pattern]
        for f in files:
            if re.match('.*\.(c|cpp|cc|h|hpp|java)$', f):
                output = "\"" + os.path.join(path, f) + "\""
                print "[" + str(file_count) + "] " + output
                file_count += 1

                cscope_files.write(output)
                cscope_files.write(os.linesep)

    cscope_files.close()
