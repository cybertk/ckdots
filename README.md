# ckdots

> Manage your dotfiles across all your devices

[![CI Status](http://img.shields.io/travis/cybertk/ck-dots.svg?style=flat)](https://travis-ci.org/cybertk/ckdots)

**ckdots** manage your dotfiles by move them to a central config dir, you can simply sharing this config dir across all you devices

## Getting Started

Install from source

```
git clone https://github.com/cybertk/ckdots.git
cd ckdots
./bin/ckdots init
```

To save dotfile, i.e. `.gemrc`

```
ckdots add .gemrc
```

Show current status of all your dotfiles

```
ckdots status
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
docker run -it --rm -vhome:/root quanlong/ckdots <github_username> <github_password_or_token> <github_repo> [dots]
```

i.e. install *.vim* and *.vimrc/* with

```bash
docker run -it --rm -vhome:/root quanlong/ckdots cybertk secret cybertk/ckdots-config .vim/ .vimrc
```

Then enjoy with your dots environment by attching the home volume

```
docker run -it --rm -vckdots:/root ubuntu:14.04 /bin/bash --login
```

## License

ck-dots is available under the MIT license. See the LICENSE file for more info.
