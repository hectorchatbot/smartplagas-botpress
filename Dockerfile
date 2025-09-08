# Imagen oficial del server de Botpress v12
FROM ghcr.io/botpress/server:v12.31.10

# Carpeta de trabajo
WORKDIR /botpress

# Copia tu bot (flows, content, etc.) dentro de /botpress/data
COPY ./data ./data

# Opcional/recomendado en producción
ENV NODE_ENV=production

# Expón el puerto informativo (Railway ignora EXPOSE, pero ayuda a leer logs)
EXPOSE 3000

# Inicia Botpress SIN migración automática
# - respeta el puerto que inyecta Railway con $PORT
# - escucha en 0.0.0.0
# - usa /botpress/data
CMD ["bash", "-lc", "./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]
