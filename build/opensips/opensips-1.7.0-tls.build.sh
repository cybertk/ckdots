#!/bin/sh
# Copyright (C) 2011 Intel.
#
# @brief Helper script for build OpenSips
#
# @author Kyan <kyan.ql.he@gmail.com>

PREFIX=`pwd`/app

# Enable TLS
TLS=1

# Build opensips core
make prefix=$PREFIX

# Build modules
make prefix=$PREFIX modules

make prefix=$PREFIX install
