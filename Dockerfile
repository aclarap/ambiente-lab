# Imagem base oficial com Debian
FROM ubuntu:22.04

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza o sistema e instala dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    software-properties-common \
    python3 \
    python3-pip \
    openjdk-18-jdk \
    zsh \
    sudo \
    locales \
    nano \
    build-essential \
    && locale-gen en_US.UTF-8

# Instala o VSCode Server (via code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh && \
    ln -s /usr/lib/code-server/bin/code-server /usr/local/bin/code-server


# Cria um usuário para uso educacional
RUN useradd -m aluno -s /bin/bash && \
    echo "aluno:senha123" | chpasswd && \
    adduser aluno sudo

# Copia o script de configuração do VSCode Server
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expor a porta do VSCode
EXPOSE 8080

# Entrar como usuário padrão
USER aluno
WORKDIR /home/aluno

# Inicia o VSCode Server
CMD ["/run.sh"]
