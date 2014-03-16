#!/bin/bash

# Do not print paths on chdir()
unset CDPATH

SVN_REPO_BASENAME=$1
REPO_PATH=$2

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SVN_REPO_URL=file://$SCRIPT_DIR/$SVN_REPO_BASENAME/$REPO_PATH

echo "\$ svn switch file://.../$(basename "$SVN_REPO_BASENAME")/$REPO_PATH"
svn switch "$SVN_REPO_URL"
