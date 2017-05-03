#!/bin/bash
gcc -c -Wall tbl0.c tbl1.c tbl2.c 

gcc -shared -Wall -o libtbl.so tbl.c -I. -Wl,-z,defs -L. -lpthread -lm -ldl
