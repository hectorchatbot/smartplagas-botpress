FROM botpress/server:latest

WORKDIR /botpress
# Copia SOLO tu código/config, no la carpeta data
COPY . .

ENV NODE_ENV=production

# Botpress debe escuchar en el puerto que Railway inyecta y en 0.0.0.0
CMD ["bash","-lc","./bp start --port ${PORT:-8080} --host 0.0.0.0"]
