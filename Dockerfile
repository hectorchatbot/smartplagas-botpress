FROM botpress/server:latest
WORKDIR /botpress
COPY . .
ENV NODE_ENV=production
CMD ["bash","-lc","./bp start --port ${PORT:-3000} --host 0.0.0.0"]
