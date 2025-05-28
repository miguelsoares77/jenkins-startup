FROM jenkins/jenkins
USER root

# Instalar dependências do sistema, Docker, Terraform, Python, Ansible, etc.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl build-essential libssl-dev libffi-dev \
    python3 python3-venv python3-dev python3-pip \
    jq wget unzip ansible gnupg lsb-release ca-certificates software-properties-common gettext && \
    # Instalar Docker
    curl -fsSL https://get.docker.com | sh && \
    # Instalar Terraform
    wget https://releases.hashicorp.com/terraform/1.11.3/terraform_1.11.3_linux_amd64.zip && \
    unzip terraform_1.11.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    # Limpeza
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    terraform -version