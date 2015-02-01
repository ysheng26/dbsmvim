@echo off

del tags
del cscope.files
del cscope.out
del *.taghl

python get_cscope_files.py .

cscope -bqv

ctags --fields=+l -RV

gtags -v
