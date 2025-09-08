# Imagen pública de Botpress
FROM botpress/server:latest

# Carpeta de trabajo
WORKDIR /botpress

# Copia solo tus flows (si tienes algo en /data/flows o /data/global)
# ⚠️ IMPORTANTE: no copiar toda la carpeta data porque rompe los permisos
COPY ./data/flows ./data/flows
COPY ./data/global ./data/global

# Recomendado en producción
ENV NODE_ENV=production

# Railway inyecta el puerto en $PORT
EXPOSE 3000

# Inicia Botpress respetando el puerto y usando la carpeta data
CMD ["bash", "-lc", "./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]


