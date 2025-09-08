# Imagen oficial de Botpress v12 (GitHub Container Registry)
FROM ghcr.io/botpress/server:v12

# Carpeta de trabajo del server
WORKDIR /botpress

# Copia tu bot (flows, content, etc.) dentro de /botpress/data
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Puerto informativo (Railway ignora EXPOSE, pero ayuda a leer logs)
EXPOSE 3000

# Inicia Botpress (respeta $PORT de Railway, escucha en 0.0.0.0 y usa ./data)
CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]
