#!/usr/bin/env bash
cp ~/.vimrc .vimrc
cp -R ~/.vim/ .vim/
git add .vimrc
git add .vim/*
