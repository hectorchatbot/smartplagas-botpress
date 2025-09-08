# Imagen oficial de Botpress v12 desde GHCR
FROM ghcr.io/botpress/server:12.31.0

# Carpeta de trabajo
WORKDIR /botpress

# Copia tus datos
COPY ./data ./data

# Producción
ENV NODE_ENV=production

# Puerto
EXPOSE 3000

# Start Botpress
CMD ["./bp", "start", "--port", "3000", "--host", "0.0.0.0", "--data-dir", "./data"]
