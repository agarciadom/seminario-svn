#!/bin/bash

# Do not print paths on chdir()
unset CDPATH

SVN_REPO_BASENAME=$1
REPO_PATH_SRC=$2
REPO_PATH_DST=$3

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SVN_REPO_URL_SRC=file://$SCRIPT_DIR/$SVN_REPO_BASENAME/$REPO_PATH_SRC
SVN_REPO_URL_DST=file://$SCRIPT_DIR/$SVN_REPO_BASENAME/$REPO_PATH_DST

echo -e \
"\$ svn cp -m \"Copiado $REPO_PATH_SRC a $REPO_PATH_DST\" \\
   $SVN_REPO_URL_SRC \\
   $SVN_REPO_URL_DST"
svn cp -m "Integrado cambios de $REPO_PATH_SRC en $REPO_PATH_DST" "$SVN_REPO_URL_SRC" "$SVN_REPO_URL_DST"
