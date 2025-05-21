# 💻 Ambiente de Desenvolvimento em Docker para Engenharia da Computação

Este ambiente foi criado para facilitar o uso de ferramentas essenciais de programação e sistemas sem a necessidade de instalações locais. Ele utiliza o `Docker` para oferecer um ambiente Linux completo com suporte a:

- VSCode via navegador (`code-server`)
- Python 3
- Java (JDK 17)
- Git
- Mysql
- Terminal Linux completo (bash)
- Nano, curl, wget, unzip, etc.

---

## ✅ Pré-requisitos

- Docker instalado ([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))
- Navegador atualizado (Chrome, Edge, Firefox...)

---

## 🚀 Como iniciar o ambiente

### 1. Clone o repositório (ou acesse os arquivos)

```bash
git clone https://github.com/Engenharia-Mackenzie/ambiente-lab.git
cd ambiente-lab
```

### 2. Construa a imagem Docker

```bash
docker build -t ambiente-lab .
```

### 3. Execute o container

Sem volume (uso apenas dentro do container):

```bash
docker run -it -p 8080:8080 ambiente-lab
```

Com volume (usa pasta do seu sistema para salvar os projetos):

```bash
docker run -it -p 8080:8080 -v /c/Users/SeuNome/Documentos/meus-projetos:/home/aluno/projetos ambiente-lab
```

> ⚠️ No Windows, use caminhos no formato `/c/Users/...` no comando acima.

---

## 🌐 Verificação pós-build:
```bash
mvn -v     # Confirma Maven funcionando
java -version  # Verifica Java 18
python3     # Confirma Python
mysql -u aluno -p  # Confirma acesso ao banco
```
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
- **MySQL:** Use pelo terminal ou extensão gráfica do VSCode.



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

## ▶️ Executar com script no Windows

Se preferir, use o arquivo `start-lab-aluno.bat` incluído no repositório.  
1. edite o arquivo e altere o caminho das variáveis HOST_DIR e DOCKER_PATH
2. salve o arquivo e dê dois cliques nele para iniciar o ambiente com tudo configurado automaticamente.

Esse script:
- Inicia o container com nome fixo (`lab-aluno`)
- Monta a pasta `C:\seudiretorio\lab-aluno` como volume persistente
- Abre o ambiente acessível via `http://localhost:8080`


## 🛠 Manutenção

Se desejar adicionar novos softwares, edite o `Dockerfile` e reconstrua a imagem:

```bash
docker build -t ambiente-lab .
```

---

## 🗄️ Uso do MySQL no terminal

O ambiente já inclui o **MySQL Server** instalado e pré-configurado com os seguintes dados:

| Usuário | Senha     | Observação                       |
|--------|-----------|-----------------------------------|
| root   | root123   | Acesso completo (administrador)   |
| aluno  | senha123  | Usuário padrão para alunos        |
| Banco  | labdb     | Banco criado automaticamente      |

---

### 🔑 Acessar o MySQL como aluno:

```bash
mysql -u aluno -p
# senha: senha123
```

### 🔑 Acessar o MySQL como root:

```bash
sudo mysql -u root -p
# senha: root123
```

---

### 🔧 Comandos básicos no MySQL:

```sql
-- Ver bancos existentes
SHOW DATABASES;

-- Usar banco de dados
USE labdb;

-- Listar tabelas do banco
SHOW TABLES;

-- Criar tabela
CREATE TABLE alunos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  curso VARCHAR(100)
);

-- Inserir dados
INSERT INTO alunos (nome, curso) VALUES ('Ana', 'Engenharia');

-- Ver dados
SELECT * FROM alunos;

-- Sair
EXIT;
```

## 👨‍🏫 Desenvolvido para uso didático

Este ambiente foi configurado para disciplinas de:
- Arquitetura de Computadores
- Programação
- Sistemas Operacionais
- Estruturas de Dados

Com foco na padronização e facilidade de acesso para os alunos.


---
