# Kubernetes Deploy
Kubernetes

## Install
```bash
git clone https://github.com/amir2b/kubernetes.git --recursive
cd kubernetes

./inventory_builder.sh 192.168.1.111 192.168.1.112 192.168.1.113 192.168.1.114 192.168.1.115
nano inventory/hosts.yaml

ansible-playbook -i inventory/hosts.yaml resolv.yml
ansible-playbook -i inventory/hosts.yaml kubespray/cluster.yml
```

## Update
```bash
git pull
git submodule update --remote
```
