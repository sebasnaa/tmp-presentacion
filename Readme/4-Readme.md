# Upload/Download artifacts,no caching dependencies 

## Fichero 

[4-Push-No-Using-Caching.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/4-Push-No-Using-Caching.yml)

## Objetivo

Visualizar como podemos en un job crear un artefacto y hacer uso del mismo en un Job futuro.

## Posible ejecución

1. Realizar cualquier cambio y realizando un push se activará el workflow o usarlo manualmente. Al finalizar tendremos el artifact disponible para su descarga.

# Upload/Download artifacts, caching dependencies

## Fichero 

[4-Push-Using-Caching.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/4-Push-Using-Caching.yml)

## Objetivo

Visualizar como podemos hacer uso de la `actions/cache@v3`

## Posible ejecución

1. Realizar cualquier cambio y realizando un push se activará el workflow o usarlo manualmente. Vemos como en el primer Job no hace ningún tipo match al buscar en cache pero en los siguientes si.