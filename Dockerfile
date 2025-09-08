# Usa la imagen oficial de Botpress desde Docker Hub (pública)
FROM botpress/server:v12

# Carpeta de trabajo
WORKDIR /botpress

# Copia tus datos (flows, content, etc.)
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Exponer puerto
EXPOSE 3000

# Comando de inicio
CMD ["./bp", "start", "--port", "3000", "--host", "0.0.0.0", "--data-dir", "./data"]
