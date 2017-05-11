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


## License

ck-dots is available under the MIT license. See the LICENSE file for more info.
