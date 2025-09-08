# Imagen pública en Docker Hub (no requiere autenticación)
FROM botpress/server:latest

# cache-bust 1

# Carpeta de trabajo
WORKDIR /botpress

# Copia tus flows y contenido
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Sólo informativo (Railway ignora EXPOSE)
EXPOSE 3000

# Inicia Botpress respetando el puerto inyectado por Railway ($PORT)
CMD ["bash","-lc","./bp start --auto-migrate --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]

