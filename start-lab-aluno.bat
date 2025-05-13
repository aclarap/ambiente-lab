@echo off
REM Script para iniciar o ambiente Docker com volume montado e porta 8080 exposta

setlocal

REM Caminho local da pasta de projetos
set "HOST_DIR=C:\lab-aluno"  REM Altere para o caminho desejado
set "HOST_DIR=%HOST_DIR:\=/%"  REM Converte para sintaxe Docker

REM Nome da imagem e container
set "IMAGE_NAME=ambiente-lab"
set "CONTAINER_NAME=lab-aluno"

REM Converte caminho para sintaxe Docker
REM Altere para o caminho desejado
set "DOCKER_PATH=/c/lab-aluno" 

REM Converte para sintaxe Docker
set "DOCKER_PATH=%DOCKER_PATH:\=/%"  

REM Executa o container com nome fixo e volume montado
docker run --rm --name %CONTAINER_NAME% -it -p 8080:8080 -v %DOCKER_PATH%:/home/aluno/projetos %IMAGE_NAME%

pause
