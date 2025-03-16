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
   ```

2. **Inicie a VM com Vagrant:**
   ```bash
   vagrant up
   ```
   Isso criará a VM, configurará o ambiente e executará o provisionamento com Ansible.

3. **Acesse o WordPress:**
   Após o provisionamento, acesse o WordPress no navegador:
   ```
   http://192.168.57.10:8080
   ```

4. **Conecte-se à VM via SSH:**
   ```bash
   vagrant ssh
   ```

5. **Verifique os containers em execução:**
   ```bash
   docker ps
   ```

## Estrutura do Projeto

O projeto é composto pelos seguintes arquivos:

- **`Vagrantfile`**: Configuração da VM com Vagrant.
- **`playbook_ansible.yml`**: Playbook do Ansible para provisionamento.
- **`docker-compose.yml`**: Configuração dos containers com Docker Compose.
- **`Dockerfile`**: Configuração personalizada do Nginx.

## Trechos de Código e Funcionalidades

### 1. `Vagrantfile`

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "private_network", ip: "192.168.57.10"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
  end
end
```

### 2. `playbook_ansible.yml`

```yaml
- hosts: all
  become: yes
  tasks:
    - name: Instalar dependências
      apt:
        name:
          - docker.io
          - docker-compose
        state: present
        update_cache: yes

    - name: Executar docker-compose
      command: docker-compose up -d
      args:
        chdir: /vagrant
```

### 3. `docker-compose.yml`

```yaml
version: '3.8'
services:
  webproxy:
    image: seu-usuario/nginx_custom
    ports:
      - "8080:8080"
    networks:
      - wordpress

  webserver:
    image: wordpress:latest
    volumes:
      - app:/var/www/html
    environment:
      WORDPRESS_DB_HOST: database:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
    networks:
      - wordpress

  database:
    image: mysql:5.7
    volumes:
      - my:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
    networks:
      - wordpress

volumes:
  app:
  my:

networks:
  wordpress:
```

### 4. `Dockerfile`

```dockerfile
FROM nginx:latest

RUN apt-get update && apt-get install -y curl iputils-ping

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
```

### 5. `nginx.conf`

```nginx
events {}

stream {
    upstream webserver {
        server webserver:80;
    }

    server {
        listen 8080;
        proxy_pass webserver;
    }
}
```

## Contribuição

Se você quiser contribuir para este projeto, siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Commit suas alterações (`git commit -m 'Adicionando nova feature'`).
4. Push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Se tiver dúvidas ou sugestões, entre em contato:

- **Nome**: Edvan Oliveira
- **Email**: [edvsl@gmail.com](mailto:edvan@example.com)
- **GitHub**: [Edvan-dev](https://github.com/seu-usuario)

Disciplina Administração de sistemas abertos 2024.2
