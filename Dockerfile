FROM node:18-slim

RUN npm i -g @botpress/cli@12

WORKDIR /app
COPY ./data ./data

ENV NODE_ENV=production
EXPOSE 3000

CMD ["bash", "-lc", "bp start --port ${PORT:-3000} --host 0.0.0.0 --data-dir ./data --auto-migrate"]
