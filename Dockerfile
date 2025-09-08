# Imagen oficial de Botpress desde GitHub Container Registry
FROM ghcr.io/botpress/server:latest

# Carpeta de trabajo
WORKDIR /botpress

# Copia tus flujos y contenido dentro de /botpress/data
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Puerto (Railway ignora EXPOSE, pero ayuda a leer logs)
EXPOSE 3000

# Inicia Botpress
CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]
