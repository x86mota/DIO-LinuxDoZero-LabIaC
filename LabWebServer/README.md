# Laboratório de Provisionamento de um Web Server

Este projeto foi criado como parte de um desafio no curso da Digital Innovation One (DIO) com o objetivo de provisionar um servidor Web

## Arquitetura do Projeto

O Dockerfile é dividido em duas partes principais, utilizando uma abordagem de multi-stage build para otimizar o tamanho da imagem final:
- **Etapa 1: Baixar e descompactar os arquivos do site.**  
  A partir da imagem base `alpine:latest`, o Dockerfile faz o download de um arquivo ZIP hospedado no GitHub e o descompacta.  
  Os arquivos foram baixados do repositório [linux-site-dio](https://github.com/denilsonbonatti/linux-site-dio) do instrutor **Denilson Bonatti**.  

- **Etapa 2: Usar NGINX para servir o site.**  
  A partir da imagem oficial nginx, os arquivos descompactados são copiados para o diretório de conteúdo do NGINX.  
  A configuração padrão do NGINX serve automaticamente os arquivos contidos no diretório /usr/share/nginx/html/.

O NGINX agora serve o site estático descompactado do repositório no contêiner.

## Como Executar

Para construir e rodar a aplicação, siga os seguintes passos:

1. Construir a imagem Docker:

    No diretório onde está o Dockerfile, execute o seguinte comando para construir a imagem Docker:

    ```bash
    docker build -t meu-site-nginx .
    ```

2. Rodar o contêiner:

    Após a imagem ser construída, execute o contêiner com o comando abaixo:

    ```bash
    docker run -d -p 8080:80 meu-site-nginx
    ```

    Isso fará com que o site esteja disponível em http://localhost:8080.
