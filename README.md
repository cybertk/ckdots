# ckdots

> Manage your dotfiles across all your devices

[![CI Status](http://img.shields.io/travis/cybertk/ck-dots.svg?style=flat)](https://travis-ci.org/cybertk/ckdots)

**ckdots** manages your dotfiles by moving them to a designated **config directory**, then you can simply share this directory across all your devices with your familiar tools, such as OneDrive, Busybox, iCloud Drive, or a git repo.

## Install

To install the **ckdots** and save all your dotfiles at */Dropbox/cli.config/*:

```shell
git clone https://github.com/cybertk/ckdots.git
CKDOTS_CONFIG=/Dropbox/cli.config/ ./ckdots/bin/ckdots init
```

Then you can sync the **config directory** */Dropbox/cli.config/* on all your devices, and install **ckdots** on them.

## Getting started

### Move the dotfile to your shared config directory

**ckdots** moves the dotfiles to a designated **config directory**(defaults at *~/.ckdots*) and creates a softlink at
the original place. To save a dotfile, for example, *.gemrc*:

```shell
ckdots add .gemrc
```

### Show current status of all your dotfiles

```shell
$ ckdots status
Tracked dots:
	un-checkout: .cocos/
	.docker/
	un-checkout: .fastlane/
	un-checkout: .gdbinit
	un-checkout: .gemrc
	.gitconfig
	.gnupg/
	un-checkout: .greenkeeperrc
	un-checkout: .hyper.js
	.kube/

Untracked dots:
  (use "ckdots add <file>..." to include in what will be managed)

	.Trash/
	.anyconnect
	.bash_sessions/
```

## Command-line Usages

- init, install ckdots on a new machine
- add, save specified dotfile
- checkout, restore previously saved dotfile
- ls, list all saved dotfile
- status, show the current status of dotfiles
- help, print this help

## Use in Docker

Create a dedicated home volume

```bash
docker volume create home
```

Then install the **ckdots** into home volume with

```
export GITHUB_UESRNAME=xxx
export GITHUB_TOKEN=xxx
export CKCONFIG_REPO=$GITHUB_UESRNAME/ckdots-config
docker run -it --rm -vhome:/root quanlong/ckdots $GITHUB_USERNAME $GITHUB_TOKEN $CKCONFIG_REPO [dots]
```

i.e. install *.vim* and *.vimrc/* with

```bash
docker run -it --rm -vhome:/root quanlong/ckdots cybertk $GITHUB_TOKEN cybertk/ckdots-config .vim/ .vimrc
```

Then enjoy with your dots environment by attaching the home volume

```
docker run -it --rm -vckdots:/root ubuntu:14.04 /bin/bash --login
```

## License

**ckdots** is available under the MIT license. See the LICENSE file for more info.
