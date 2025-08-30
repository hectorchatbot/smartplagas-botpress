# Imagen estable de Botpress v12 (ajústala si usas otra)
FROM botpress/server:v12_31_0

# Copiamos el contenido del bot (tu carpeta data local) al contenedor
COPY ./data /botpress/data

# Puerto por defecto
EXPOSE 3000

# Arranca Botpress
CMD ["./bp"]