#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
cargo install bob-nvim
bob install stable
bob use stable
