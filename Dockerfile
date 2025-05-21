
# Imagem base
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Atualiza e instala dependências
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    nano \
    zsh \
    sudo \
    locales \
    python3 \
    python3-pip \
    openjdk-18-jdk \
    build-essential \
    maven \
    software-properties-common \
    mysql-server \
    && locale-gen en_US.UTF-8

# Instala o code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh \
    && ln -s /usr/lib/code-server/bin/code-server /usr/local/bin/code-server

# Cria usuário 'aluno' com sudo
RUN useradd -m aluno -s /bin/bash && \
    echo "aluno:senha123" | chpasswd && \
    adduser aluno sudo

# Configura senha do MySQL root e cria banco e usuário
RUN service mysql start && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root123'; FLUSH PRIVILEGES;" && \
    mysql -uroot -proot123 -e "CREATE DATABASE labdb; \
        CREATE USER IF NOT EXISTS 'aluno'@'localhost' IDENTIFIED BY 'senha123'; \
        GRANT ALL PRIVILEGES ON labdb.* TO 'aluno'@'localhost'; \
        FLUSH PRIVILEGES;"

# Instala o Python e bibliotecas necessárias
RUN apt-get install -y python3-venv && \
    python3 -m venv /home/aluno/venv && \
    /home/aluno/venv/bin/pip install --upgrade pip
RUN pip install flask fastapi uvicorn        

# Copia o script de inicialização
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Porta padrão para code-server
EXPOSE 8080

USER aluno
WORKDIR /home/aluno

# Comando padrão
CMD ["/run.sh"]
