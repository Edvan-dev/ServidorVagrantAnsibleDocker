FROM nginx:latest

# Instalar pacotes adicionais
RUN apt-get update && apt-get install -y curl iputils-ping

# Configuração do Load Balancer
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
