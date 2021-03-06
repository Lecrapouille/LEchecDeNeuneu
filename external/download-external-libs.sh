#!/bin/bash

### This script will git clone some libraries that SimTaDyn needs and
### compile them. To avoid pollution, they are not installed into your
### environement. Therefore SimTaDyn Makefiles have to know where to
### find their files (includes and static/shared libraries).

### $1 is given by ../Makefile and refers to the current architecture.
if [ "$1" == "" ]; then
  echo "Expected one argument. Select the architecture: Linux, Darwin or Windows"
  exit 1
fi
ARCHI="$1"
TARGET=SimTaDyn

### Delete all previous directories to be sure to have and compile
### fresh code source.
rm -fr backward-cpp CmdParser 2> /dev/null

function print-clone
{
    echo -e "\033[35m*** Cloning:\033[00m \033[36m$TARGET\033[00m <= \033[33m$1\033[00m"
}

### Clone Backward tool: A beautiful stack trace pretty printer for C++. No installation
### is needed but some libraries are needed (libdw-dev, binutils-dev, ...).
### License: MIT
print-clone backward-cpp
git clone https://github.com/Lecrapouille/backward-cpp.git --depth=1 > /dev/null 2> /dev/null

### Library CmdParser is a C++ alternative to C getopt for parsing options like --help
print-clone CmdParser
git clone https://github.com/FlorianRappl/CmdParser.git --depth=1 > /dev/null 2> /dev/null
