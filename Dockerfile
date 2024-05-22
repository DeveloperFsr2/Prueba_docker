 # imagen base de Ubuntu
FROM ubuntu

# Actualiza el sistema y instala nginx, Node.js, npm y Angular CLI
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y nodejs npm
RUN npm install -g @angular/cli

# Copia la configuración de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expone el puerto 70
EXPOSE 70

# Directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación Angular
COPY . /app

# Instala las dependencias de Node.js para la aplicación Angular
RUN npm install

# Construye la aplicación Angular
RUN ng build

CMD ["nginx", "-g", "daemon off;"]