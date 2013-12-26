#!/bin/bash

export RBENV_ROOT="${PWD}/.rbenv"

export PATH="$PWD/.rbenv/bin:$PATH"
eval "$(rbenv init -)"