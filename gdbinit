set breakpoint pending on
set disassembly-flavor intel
set debuginfod enabled on
source /home/pwent/code/external/pwndbg/gdbinit.py
# Force heap resolution via heuristic until
# https://github.com/pwndbg/pwndbg/issues/3303 is fixed.
set resolve-heap-via-heuristic force
