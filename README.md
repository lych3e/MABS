# Make Arch Build Stable

This project aims to automate the process of building Arch's stable packages. Currently an early prototype.

I wrote this so that I could utilise various compile-time optimisations without having to do it manually for every package, and again for every update.

You will need an archlinux gitlab account to utilise this.

## Features
- Automatically fetch, build & reinstall all installed packages.
- Automatically fetch, build & install updated packages (without recompiling the rest of the system) (TODO)
- A lockfile, so that running multiple of this program at the same time doesn't break anything. (TODO)

## Dependencies
- Bash (not just any shell, specifically bash.)
- Git
