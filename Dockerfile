FROM botpress/server:latest

WORKDIR /botpress

# Evitar cache y limpiar cualquier data vieja (permisos problemáticos)
ARG CACHEBUST=1
RUN rm -rf /botpress/data/* || true

# Garantizar permisos para el usuario botpress
RUN mkdir -p /botpress/data \
  && chown -R botpress:botpress /botpress \
  && chmod -R u+rwX /botpress

# ⚠️ Si NO tienes estas carpetas en tu repo, BORRA estas dos líneas.
# ⚠️ Si las tienes, mantenlas con --chown para que no queden como root.
# COPY --chown=botpress:botpress ./data/flows ./data/flows
# COPY --chown=botpress:botpress ./data/global ./data/global

ENV NODE_ENV=production

EXPOSE 3000
USER botpress

CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data"]


