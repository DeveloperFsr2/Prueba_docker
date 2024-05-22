# Para crear la Imagen
```bash
docker build -t prueba6 .  
```
# Para crear subir la imagen con su puerto 
```bash
docker run -d --name pruex -p 70:8080 prueba6  
```
# Prueba_docker
# Utilizamos la imagen base de Ubuntu
```bash
FROM ubuntu
```
# Aqui actualizamos el sistema y instala nginx, Node.js, npm y Angular CLI
```bash
RUN apt-get update && apt-get install -y nginx
```
```bash
RUN apt-get install -y nodejs npm
```
```bash
RUN npm install -g @angular/cli
```

#  Copiamos la configuración de Nginx
```bash
COPY nginx.conf /etc/nginx/nginx.conf
```
# Expone el puerto 80
```bash
EXPOSE 80
```
# Directorio de trabajo de nuestro aplicacion
```bash
WORKDIR /app
```
# Copia los archivos de la aplicación Angular
```bash
COPY . /app
```
# Instala las dependencias de Node.js para la aplicación Angular
```bash
RUN npm install
```
# Construye la aplicación Angular
```bash
RUN ng build
```
```bash
CMD ["nginx", "-g", "daemon off;"]
```
# ---------------------------------------------------------------------
# Tambien es necesario crearnos un archivo nginx.conf
