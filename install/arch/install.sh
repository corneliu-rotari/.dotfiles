#!/bin/sh

packages=(`cat packages.txt`)


for package in "${packages[@]}"; do
    echo "Installing $package"
done
