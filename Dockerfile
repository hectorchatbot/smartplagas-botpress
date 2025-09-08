# Imagen oficial de Botpress 12
FROM botpress/server:latest

# Carpeta de trabajo
WORKDIR /botpress

# Producción
ENV NODE_ENV=production

# (Importante) NO copiar la carpeta ./data del repo
# Deja que Botpress la cree en el contenedor / volumen
RUN mkdir -p /botpress/data

# Iniciar Botpress escuchando en 0.0.0.0 y en el puerto que inyecta Railway ($PORT)
# Si $PORT no existe (local), usa 3000 por defecto.
CMD ["bash", "-lc", "export BP_CONFIG_HTTPSERVER_HOST=0.0.0.0; export BP_CONFIG_HTTPSERVER_PORT=${PORT:-3000}; ./bp start --data-dir ./data"]


