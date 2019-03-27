#!/bin/bash
yum update -y
yum install curl -y
yum install wget -y
yum install jq -y

#cat <<EOF > /etc/yum.repos.d/kubernetes.repo
#[kubernetes]
#name=Kubernetes
#baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
#enabled=1
#gpgcheck=1
#repo_gpgcheck=1
#gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
#EOF

#cat /etc/yum.repos.d/kubernetes.repo
#yum update
#rm -rf /etc/yum.repos.d/kubernetes.repo
#yum update

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /bin/kubectl
yum install kubectl -y

curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /bin/kops

yum install git -y
yum install tmux -y

yum install -y docker
sudo amazon-linux-extras install docker -y
service docker start
docker run hello-world

yum install -y tmux

yum install -y ansible
sudo amazon-linux-extras install ansible2 -y
sudo mv /bin/ansible /usr/local/bin/ansible-playbook


