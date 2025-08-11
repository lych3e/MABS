#!/bin/bash
cache_loc=~/.cache/mabs
clone_loc=${CACHE_LOC}/src
build_loc=${CACHE_LOC}/bin

packages=$(pacman -Q | sed -r 's/[:]+/-/g' | awk '{system("git clone -b " $2 " https://gitlab.archlinux.org/archlinux/packaging/packages/" $1 ".git \n")}')

# clone start
mkdir -p $clone_loc
rm -rf $clone_loc
cd $clone_loc

echo $packages
