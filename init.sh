#!/usr/bin/env bash

## Change root path
cd "$(dirname "$0")/" || exit

cd kubespray

## Create virtual environment if not exists
if [ ! -d venv ]; then
    python3 -m venv venv
    source venv/bin/activate
    python -m pip install -U pip wheel setuptools
    python -m pip install -r contrib/inventory_builder/requirements.txt
fi
