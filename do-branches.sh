#!/bin/bash

# Do not print paths on chdir()
unset CDPATH

SVN_REPO_BASENAME=$1

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SVN_REPO_URL=file://$SCRIPT_DIR/$SVN_REPO_BASENAME/

cat <<EOF
$ svn mkdir -m "Creado estructura de ramas" \\
  file:///.../$(basename "$SVN_REPO_BASENAME")/{trunk,branches,tags}
EOF
svn mkdir -m "Creado estructura de ramas" $SVN_REPO_URL/{trunk,branches,tags}
