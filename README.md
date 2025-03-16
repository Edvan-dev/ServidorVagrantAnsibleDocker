# Projeto: Provisionamento de Servidor com Vagrant, Docker e Ansible

Este projeto tem como objetivo provisionar um servidor totalmente automatizado utilizando **Vagrant**, **Docker** e **Ansible**. A infraestrutura criada inclui um servidor web com **WordPress** e **Nginx** como proxy reverso, além de um banco de dados **MySQL**.

## Funcionalidades do Projeto

1. **Criação de uma Máquina Virtual (VM) com Vagrant:**
   - Utiliza o VirtualBox como provedor.
   - Configura uma rede privada com IP estático.
   - Sincroniza pastas entre o host e a VM.

2. **Provisionamento com Ansible:**
   - Configura o hostname da VM.
   - Instala o Docker e o Docker Compose.
   - Executa o `docker-compose` para criar a infraestrutura de containers.

3. **Infraestrutura de Containers com Docker:**
   - Cria três containers:
     - **webproxy**: Nginx personalizado como proxy reverso.
     - **webserver**: WordPress como servidor de aplicação.
     - **database**: MySQL como banco de dados.
   - Configura volumes persistentes para o WordPress e o MySQL.
   - Expõe o Nginx na porta 8080 do host.

## Requisitos para Rodar o Projeto

Antes de começar, certifique-se de que você tem os seguintes softwares instalados:

- **[Vagrant](https://www.vagrantup.com/)**
- **[VirtualBox](https://www.virtualbox.org/)**
- **[Ansible](https://docs.ansible.com/)**
- **[Docker](https://www.docker.com/)**
- **[Git](https://git-scm.com/)**

## Como Executar o Projeto

Siga os passos abaixo para rodar o projeto:

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/projeto-vagrant-docker-ansible.git
   cd projeto-vagrant-docker-ansible

Disciplina Administração de sistemas abertos 2024.2
