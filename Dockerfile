# Imagen oficial de Botpress
FROM botpress/server:latest

# Carpeta de trabajo
WORKDIR /botpress

# Crear carpeta de datos y asegurar permisos para el usuario 'botpress'
RUN mkdir -p /botpress/data \
  && chown -R botpress:botpress /botpress \
  && chmod -R u+rwX /botpress

# (Opcional) Copia SOLO tus assets/flows si existen en el repo.
# Ojo: usar --chown para que queden del usuario botpress.
COPY --chown=botpress:botpress ./data/flows ./data/flows
COPY --chown=botpress:botpress ./data/global ./data/global

# Producción
ENV NODE_ENV=production

# Railway inyecta $PORT
EXPOSE 3000

# Ejecutar como el usuario correcto
USER botpress

# Arranque
CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]


