#!/bin/bash

SVN_REPO_BASENAME=$1
WORK_DIR=$2

THIS_DIR=$(basename "$(dirname "$(readlink -f "$0")")")
SVN_REPO_URL=file://$(pwd)/$1/

echo "\$ svn checkout file:///.../$THIS_DIR/$SVN_REPO_BASENAME/ $WORK_DIR"
svn checkout "file://$(pwd)/$SVN_REPO_BASENAME/" "$WORK_DIR"
