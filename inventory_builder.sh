#!/usr/bin/env bash

## Change root path
cd "$(dirname "$0")/" || exit
PATH_ROOT="$(pwd)"

cd kubespray

if [ -d "${PATH_ROOT}/inventory" ]; then
    echo "Inventory exists!"
    exit 1
fi

cp -rfp inventory/sample "${PATH_ROOT}/inventory"
export CONFIG_FILE="${PATH_ROOT}/inventory/hosts.yaml"

source venv/bin/activate
python contrib/inventory_builder/inventory.py $*

cat << EOF >> "${PATH_ROOT}/inventory/hosts.yaml"
  vars:
    ansible_user: username
    ansible_password: password
    ansible_become_password: password
    ansible_become: yes
EOF
