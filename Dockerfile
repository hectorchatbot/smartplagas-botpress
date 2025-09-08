# Usa la última imagen oficial de Botpress
FROM botpress/server:latest

# Carpeta de trabajo
WORKDIR /botpress

# No copiamos ./data, Railway lo manejará vacío en runtime
# (Si necesitas flows o bots, súbelos luego dentro del admin de Botpress)

# Configuración recomendada para producción
ENV NODE_ENV=production

# Railway ignora EXPOSE, pero lo dejamos informativo
EXPOSE 3000

# Comando de arranque: respeta el puerto de Railway y usa data-dir vacío
CMD ["bash", "-lc", "export BP_CONFIG_HTTPSERVER_HOST=0.0.0.0; export BP_CONFIG_HTTPSERVER_PORT=${PORT:-3000}; ./bp start --data-dir ./data"]



