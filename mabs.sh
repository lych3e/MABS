#!/bin/bash
cache_loc=~/.cache/mabs
clone_loc=${cache_loc}/src
bin_loc=${cache_loc}/bin
log_loc=${cache_loc}/log.txt

# double check cache_loc isn't / because otherwise we'll try to delete all files
if [ $cache_loc -ef "/" ]; then
    printf "WE WERE ABOUT TO OPERATE ON / \n Execution terminated. No files were changed."
    exit
fi

# don't specify q here. That will be done separately in the relevant places.
pacman_opts="-Q discord net-tools"

# setup log
rm $log_loc
touch $log_loc
echo "Logging at $log_loc"

packages=( $(pacman $pacman_opts -q) )
(IFS=$'\n'; printf "\nThe following packages will be cloned: \n${packages[*]}")

printf "\n\nThis totals ${#packages[@]} packages.\n\n"

# clone start
mkdir -p $clone_loc
rm -rf $clone_loc/*
cd $clone_loc

# clone packages
printf "Cloning package sources into '${clone_loc}'..."

# get affected packages (with version), change invalid chars to -, and git clone every related repo
pacman $pacman_opts | sed -r 's/[:]+/-/g' | awk '{system("git clone -b " $2 " https://gitlab.archlinux.org/archlinux/packaging/packages/" $1 ".git")}'

echo "Cloning complete."
echo $packages

# setup bin directory
mkdir -p $bin_loc
rm -f $bin_loc

# build packages and move them to $bin_loc
printf "${packages[1]}"
