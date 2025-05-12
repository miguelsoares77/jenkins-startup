FROM jenkins/jenkins
USER root
RUN apt-get update

# Instalar Docker
RUN curl -sSL https://get.docker.com/ | sh

# Instalar Terraform
RUN apt-get install -y wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.11.3/terraform_1.11.3_linux_amd64.zip && \
    unzip terraform_1.11.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    terraform -version

# Instalar Ansible
RUN apt-get install -y ansible