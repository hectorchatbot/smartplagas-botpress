FROM botpress/server:latest

WORKDIR /botpress

# Crea data y asegura permisos para el usuario botpress
RUN mkdir -p /botpress/data \
  && chown -R botpress:botpress /botpress \
  && chmod -R u+rwX /botpress

# (Opcional) SOLO si tienes estos directorios en tu repo.
# Si no existen, borra estas 2 líneas.
COPY --chown=botpress:botpress ./data/flows ./data/flows
COPY --chown=botpress:botpress ./data/global ./data/global

ENV NODE_ENV=production

EXPOSE 3000
USER botpress

CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]



