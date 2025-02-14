# Laboratório de Gerenciamento de Usuários e Grupos no Linux

Este projeto foi criado como parte de um exercício de laboratório proposto pela **DIO (Digital Innovation One)** no curso **Linux do Zero**. O objetivo do laboratório era obter experiência prática no gerenciamento de usuários, grupos e diretórios em um ambiente Linux, utilizando scripts em Bash.

## Objetivo do Projeto

O objetivo do projeto era automatizar as seguintes tarefas:

1. Automatizar a criação de diversos diretórios necessários para a configuração de um sistema.
2. Configurar grupos específicos (administradores, vendas, secretariado) aos quais os usuários pertencem.
3. Adicionar usuários ao sistema, definir senhas e associá-los aos grupos apropriados.
4. Ajustar as permissões dos diretórios para garantir que os usuários e grupos certos tenham acesso aos recursos necessários.

O projeto foca nos seguintes conceitos:
- Criação de diretórios com o comando `mkdir`.
- Criação de grupos utilizando `groupadd`.
- Criação de usuários com o comando `useradd` e definição de senhas.
- Atribuição de usuários a grupos.
- Configuração de propriedade de arquivos e permissões utilizando `chown` e `chmod`.

## Funcionalidades

- O script cria dinamicamente diretórios, grupos e usuários com base em listas predefinidas.
- Configura permissões apropriadas para os diretórios, garantindo controle de acesso seguro.

## Estrutura

### 1. Diretórios a serem criados
- `/adm` (Diretório para administradores)
- `/ven` (Diretório para vendas)
- `/sec` (Diretório para secretariado)
- `/publico` (Diretório público)

### 2. Grupos
- `GRP_ADM` (Grupo de administradores)
- `GRP_VEN` (Grupo de vendas)
- `GRP_SEC` (Grupo de secretariado)

### 3. Usuários
- **Usuários Administradores**: `carlos`, `maria`, `joao`
- **Usuários de Vendas**: `debora`, `sebastiana`, `roberto`
- **Usuários de Secretariado**: `josefina`, `amanda`, `rogerio`

### 4. Permissões de Diretórios
- As permissões para os diretórios `/adm`, `/ven` e `/sec` são configuradas com **770** (leitura, escrita e execução para o proprietário e o grupo).
- O diretório `/publico` é configurado com **777** (permissão total para todos os usuários).

## Como Funciona o script

1. Cria os diretórios necessários no sistema.
2. Cria os grupos de segurança `GRP_ADM`, `GRP_VEN` e `GRP_SEC`.
3. Os usuários são adicionados ao sistema, com senhas temporárias e configurados para pertencer aos grupos correspondentes.
4. Configura as permissões dos diretórios para garantir que apenas os usuários e grupos corretos possam acessá-los.