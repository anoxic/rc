#!/bin/sh
tar -cv @spec/base.mtree > build/base.tar

command -v git >/dev/null 2>&1 || { echo Git required to build priv; exit; }

git submodule init
git submodule update

tar -cv @spec/priv.mtree > build/priv.tar
