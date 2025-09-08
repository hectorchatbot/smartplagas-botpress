# Imagen oficial del servidor Botpress v12
# (usa la etiqueta 'latest' para evitar "not found")
FROM botpress/server:latest

# Carpeta de trabajo del servidor
WORKDIR /botpress

# Copia tu bot (flows, contenidos, etc.) a la carpeta de datos
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Exponer el puerto (informativo)
EXPOSE 3000

# Arranque del servidor y migraciones automáticas
# - respeta el puerto que inyecta Railway (${PORT})
# - escucha en 0.0.0.0
# - usa la carpeta ./data como data-dir
# - ejecuta migraciones al iniciar
CMD ["bash", "-lc", "./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data --auto-migrate"]
