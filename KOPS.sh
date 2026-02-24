


What This Setup Does (Big Picture)

This script will:

Configure AWS access

Install kubectl (Kubernetes CLI)

Install kops (Kubernetes Operations tool)

Set an S3 bucket for cluster state

Create a Kubernetes cluster on AWS

Apply the cluster configuration and get admin access

✅ STEP-BY-STEP — RUN THESE ON YOUR EC2 SERVER


aws configure


2. Install kubect
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client




3. Install KOPS
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
kops version
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

5. Create S3 Bucket for KOPS State
aws s3 mb s3://cloudanddevopsbyraham0073456.k8s.local
export KOPS_STATE_STORE=s3://cloudanddevopsbyraham0073456.k8s.local

6. Create Kubernetes Cluster
kops create cluster \
--name rahamss.k8s.local \
--zones ap-south-1a \
--control-plane-count=1 \
--control-plane-size c7i-flex.large \
--node-count=2 \
--node-size c7i-flex.large \
--image ami-02b8269d5e85954ef

🔹 7. Apply Cluster (Important Step)
kops update cluster --name rahamss.k8s.local --yes --admin


8. Validate Cluster
kops validate cluster


kubectl get nodes


kops install on amazonlinux


sudo yum update -y
sudo yum install unzip curl -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
aws configure

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

aws s3 mb s3://mkumar.k8s.local

export KOPS_STATE_STORE=s3://mkumar.k8s.local
echo $KOPS_STATE_STORE
kops create cluster \
--name mkumarserver.k8s.local \
--zones ap-south-1a \
--control-plane-count=1 \
--control-plane-size c7i-flex.large \
--node-count=2 \
--node-size c7i-flex.large \
--image ami-02b8269d5e85954ef

kops update cluster 

kops validate cluster


