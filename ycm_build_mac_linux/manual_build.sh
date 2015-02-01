function num_cores {
  if command_exists nproc; then
   num_cpus=$(nproc)
  else
    num_cpus=1
    if [[ `uname -s` == "Linux" ]]; then
      num_cpus=$(grep -c ^processor /proc/cpuinfo)
    else
      # Works on Mac and FreeBSD
      num_cpus=$(sysctl -n hw.ncpu)
    fi
  fi
  echo $num_cpus
}

function python_finder {
  python_library="-DPYTHON_LIBRARY="
  python_include="-DPYTHON_INCLUDE_DIR="

  # The CMake 'FindPythonLibs' Module does not work properly.
  # So we are forced to do its job for it.
  python_prefix=$(python-config --prefix | sed 's/^[ \t]*//')
  if [ -f "${python_prefix}/Python" ]; then
    python_library+="${python_prefix}/Python"
    python_include+="${python_prefix}/Headers"
  else
    which_python=$(python -c 'import sys;print(sys.version)' | sed 's/^[ \t]*//')
    which_python="python${which_python:0:3}"
    lib_python="${python_prefix}/lib/lib${which_python}"
    if [ -f "${lib_python}.a" ]; then
      python_library+="${lib_python}.a"
    else
      python_library+="${lib_python}.dylib"
    fi
    python_include+="${python_prefix}/include/${which_python}"
  fi

  echo "${python_library} ${python_include}"
}

ycm_dir="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp"
llvm_root="~/libs/clang+llvm-3.3"

cmake -G "Unix Makefiles" $(python_finder) -DPATH_TO_LLVM_ROOT=$llvm_root . $ycm_dir
make -j $(num_cores) ycm_support_libs
