#!/bin/bash
set -euo pipefail

./dotbot/bin/dotbot -c install.conf.yaml -d "$(pwd)/dotfiles/"
