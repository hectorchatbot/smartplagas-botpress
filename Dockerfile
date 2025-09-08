FROM botpress/server:latest
WORKDIR /botpress
ENV NODE_ENV=production
CMD ["./bp", "start", "--port", "${PORT}", "--host", "0.0.0.0", "--data-dir", "./data"]
