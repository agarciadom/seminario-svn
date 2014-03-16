#!/bin/bash

# Do not print paths on chdir()
unset CDPATH

eval $@ 2>&1
