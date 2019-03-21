# ckdots

> Manage your dotfiles across all your devices

[![CI Status](http://img.shields.io/travis/cybertk/ck-dots.svg?style=flat)](https://travis-ci.org/cybertk/ckdots)

**ckdots** manage your dotfiles by move them to a central config dir, you can simply sharing this config dir across all you devices

## Getting Started

### Install On First Device

If this is the first time you use **ckdots**, just invoke the following command to install it,

```
git clone https://github.com/cybertk/ckdots.git
./ckdots/bin/ckdots init
```

To save dotfile, i.e. `.gemrc`

```
ckdots add .gemrc
```

Show current status of all your dotfiles

```
ckdots status
```

### Restore From Existing Config

If you already have a **config** dir(defauts at *~/.ckdots*), and want to restore the saved config on another machine.

First, download your **config** dir into *~/.ckdots*, i.e. if your dir is tracked under git

```shell
git clone https://github.com/example/ckdots-config.git ~/.ckdots
```

Then initialize the with

```
git clone https://github.com/cybertk/ckdots.git
./ckdots/bin/ckdots init
```

Now you all you configs will be installed on your new device.

## Sync Your CLI Config Across Devices

**ckdots** will save all your config into *~/.ckdots* dir, you can simply put this dir in your Cloud Disk or track it with git.

## Use Customized Config Dir

**config** dir is controlled with environment variable `CKDOTS_CONFIG`. 

For example, when you restore the **ckdots** on a new device, and you exsiting config is saved in Dropbox at path */Dropbox/cli.config/*. Then restore with

```shell
CKDOTS_CONFIG=/Dropbox/cli.config/ ./path/to/ckdots/bin/ckdots init
```

## Command Line Usages

- init, install ckdots on a new machine
- add, save specifed dotfile
- checkout, restore previous saved dotfile
- ls, list all saved dotfile
- status, show current status of dotfiles
- help, print this help

## Using with Docker

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

Then enjoy with your dots environment by attching the home volume

```
docker run -it --rm -vckdots:/root ubuntu:14.04 /bin/bash --login
```

## License

ck-dots is available under the MIT license. See the LICENSE file for more info.
