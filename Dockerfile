FROM node:18-slim

# Botpress CLI (última estable)
RUN npm i -g @botpress/cli

WORKDIR /app
COPY ./data ./data

ENV NODE_ENV=production
EXPOSE 3000

# Arranque correcto con el CLI moderno:
#  - serve (no start)
#  - puerto dinámico de Railway
#  - host 0.0.0.0
#  - data-dir y auto-migrate
CMD ["bash", "-lc", "bp serve --port ${PORT:-3000} --host 0.0.0.0 --dir ./data --auto-migrate"]
