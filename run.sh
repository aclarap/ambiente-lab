#!/bin/bash

# Inicia o serviço MySQL
sudo service mysql start

# Inicia o code-server (VSCode no navegador)
code-server --bind-addr 0.0.0.0:8080 --auth none
