#!/bin/bash

THIS_DIR=$(basename "$(dirname "$(readlink -f "$0")")")

echo "\$ svn checkout file:///.../$THIS_DIR/svnEjemplo/ $@"
svn checkout file://$(pwd)/svnEjemplo/ $@

