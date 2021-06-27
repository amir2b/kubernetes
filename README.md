# Kubernetes Deploy
Kubernetes

## Install
```bash
git clone https://github.com/amir2b/kubernetes.git --recursive
cd kubernetes

./init.sh
./inventory_builder.sh 192.168.1.111 192.168.1.112 192.168.1.113 192.168.1.114 192.168.1.115
nano inventory/hosts.yaml

ansible-playbook -i inventory/hosts.yaml resolv.yml
ansible-playbook -i inventory/hosts.yaml kubespray/cluster.yml
```

## Local install kubectl
```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl

mkdir ${HOME}/.kube/
scp root@<control-plane-host>:/etc/kubernetes/admin.conf ${HOME}/.kube/config

echo 'alias k=kubectl' >> ${HOME}/.bashrc
source ${HOME}/.bashrc

kubectl cluster-info
```

## Update
```bash
git pull
git submodule update --remote
```
