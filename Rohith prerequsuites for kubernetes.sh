#!/bin/bash
yum -y update
yum install -y curl
yum install -y wget
yum install -y jq

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
yum update

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /bin/kubectl
yum install -y kubectl

curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /bin/kops


yum install -y git
yum install -y docker
sudo amazon-linux-extras install docker -y
service docker start
docker run hello-world
yum install -y tmux

yum install -y ansible
sudo amazon-linux-extras install ansible2 -y

sudo mv /bin/ansible /usr/local/bin/ansible-playbook







 kops create cluster --name devops25.k8s.local --master-count 3 --node-count 1 --node-size t2.small --zones us-west-2a,us-west-2b,us-west-2c,us-west-2d --master-size t2.medium --master-zones us-west-2a,us-west-2b,us-west-2c --ssh-public-key devops23.pub --authorization RBAC --networking kubenet --yes


