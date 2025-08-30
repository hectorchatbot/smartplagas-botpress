# SmartPlagas Botpress

Chatbot de Smart Plagas desplegado en Railway con Docker.

## Cómo funciona
- Basado en Botpress v12
- El bot se monta desde la carpeta `data/`
- Se expone en el puerto 3000
- Integrado a WordPress mediante el canal Webchat

## Deploy en Railway
1. Subir este repo a GitHub
2. Crear proyecto en Railway → Deploy from GitHub
3. Railway construye la imagen desde Dockerfile
4. Configurar variables de entorno:
   - `PORT=3000`
   - `BP_PRODUCTION=true`
   - `BPFS_STORAGE=database`
   - `DATABASE_URL` = (cadena de conexión de Postgres en Railway)
