#  ##################################
# 💻 Ambiente de Desenvolvimento em Docker para Engenharia da Computação

Este ambiente foi criado para facilitar o uso de ferramentas essenciais de programação e sistemas sem a necessidade de instalações locais. Ele utiliza o `Docker` para oferecer um ambiente Linux completo com suporte a:

- VSCode via navegador (`code-server`)
- Python 3
- Java (JDK 17)
- Git
- Terminal Linux completo (bash)
- Nano, curl, wget, unzip, etc.

---

## ✅ Pré-requisitos

- Docker instalado ([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))
- Navegador atualizado (Chrome, Edge, Firefox...)

---

## 🚀 Como iniciar o ambiente

### 1. Clone este repositório ou crie seu próprio repositório local

### 🔁 Opção A — Clonar o repositório oficial do professor

Abra o terminal e execute:

```bash
git clone https://github.com/Engenharia-Mackenzie/ambiente-lab.git
cd ambiente-lab
```

> Essa opção permite que você use o ambiente padrão criado pelo professor.

---

### 🛠 Opção B — Criar seu próprio repositório local a partir dos arquivos

Caso deseje manter um repositório próprio (com commits, códigos e alterações suas), siga os passos abaixo **após clonar**:

```bash
# Inicialize o repositório local
git init

# Configure seu nome e e-mail (necessário apenas uma vez)
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"

# Crie o branch principal
git branch -M main

# Adicione os arquivos ao controle de versão
git add .

# Faça seu primeiro commit
git commit -m "Primeiro commit do meu ambiente local"

# (Opcional) Se você já criou um repositório no GitHub, adicione o remoto:
git remote add origin https://github.com/seuusuario/seu-repositorio.git

# Envie os arquivos para o seu repositório remoto
git push -u origin main
```

> 🔒 Se você estiver em um ambiente com volume montado (como `/home/aluno/projetos` via Docker), pode ser necessário marcar a pasta como segura:
```bash
git config --global --add safe.directory /home/aluno/projetos
```

### 2. Construa a imagem Docker

```bash
docker build -t ambiente-lab .
```

### 3. Execute o container

Sem volume (uso apenas dentro do container):

```bash
docker run --rm --name lab-temporario -it -p 8080:8080 ambiente-lab
```

Com volume (usa pasta do seu sistema para salvar os projetos):

```bash
docker run --rm --name lab-aluno -it -p 8080:8080 -v /c/Users/SeuNome/Documentos/meus-projetos:/home/aluno/projetos ambiente-lab
```

> ⚠️ No Windows, use caminhos no formato `/c/Users/...` no comando acima.

---
## 🌐 Acessar o terminal do container (modo interativo)

Se quiser usar o terminal Linux dentro do container de forma direta (fora do navegador), você pode executar:

```
docker exec -it <nome-ou-id-do-container> bash
```

> Por exemplo, se o container estiver em execução com nome ambiente-lab, você pode encontrar o nome com:
```
docker ps
```
> E então executar:
```
docker exec -it ambiente-lab bash
```

## 🌐 Acessar o VSCode no navegador

Abra o navegador e acesse:

```
http://localhost:8080
```

> O ambiente já está configurado para abrir o VSCode direto, sem autenticação.

---

## 💡 Recursos disponíveis

- **Terminal:** Acesse pelo menu do VSCode ou pressione `Ctrl + Crase` (`Ctrl + `).
- **Editor de código:** idêntico ao VSCode tradicional.
- **Sistema de arquivos:** navegue por `/home/aluno` (ou pela pasta montada).
- **Git:** já instalado. Use terminal ou extensão gráfica do VSCode.
- **Java, C e Python:** compilar e rodar direto no terminal.

---

## 🧪 Exemplos de uso no terminal

### Compilar um programa Java:

```bash
cd projetos
nano HelloWorld.java
# digite o código
javac HelloWorld.java
java HelloWorld
```

### Executar um script Python:

```bash
cd projetos
nano script.py
# digite o código
python3 script.py
```

---
### Executar um arquivo em C (.c):

```bash
# digite o código
gcc -o hello hello.c
./hello
```

---
### Executar um arquivo em C++ (.cpp):

```bash
# digite o código
g++ -o hello hello.cpp
./hello
```

---

## 👥 Acesso múltiplo

Este ambiente foi projetado inicialmente para uso **individual**. Para uso por vários alunos simultaneamente, recomenda-se configurar:

- Um container por aluno
- Azure Lab Services, GitHub Codespaces ou infraestrutura de VMs com orquestração

---

## 🛠 Manutenção

Se desejar adicionar novos softwares, edite o `Dockerfile` e reconstrua a imagem:

```bash
docker build -t ambiente-lab .
```

---

## 👨‍🏫 Desenvolvido para uso didático

Este ambiente foi configurado para disciplinas de:
- Arquitetura de Computadores
- Programação
- Sistemas Operacionais
- Estruturas de Dados

Com foco na padronização e facilidade de acesso para os alunos.
