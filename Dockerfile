# Usa el servidor oficial de Botpress v12
FROM botpress/server:12

# Carpeta de trabajo del servidor
WORKDIR /botpress

# Copia tu bot (flows, etc.) dentro de /botpress/data
COPY ./data ./data

# Recomendado en producción
ENV NODE_ENV=production

# Exposición informativa
EXPOSE 3000

# Ejecuta el binario del servidor y fuerza migraciones
# - respeta el puerto inyectado por Railway
# - escucha en 0.0.0.0
# - usa tu carpeta ./data
CMD ["bash", "-lc", "./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data --auto-migrate"]
