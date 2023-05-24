# Uso de Matrix

## Fichero 

[6-Matrix.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/6-Matrix.yml)

## Objetivo

Comprobar el funcionamiento ``matrix`` que nos permite crear varios jobs basados en las combinaciones de las variables de la matrix.

## Posible ejecución

1. Simple ejecutar de forma manual, 

# Upload/Download artifacts, caching dependencies

## Fichero 

[4-Push-Using-Caching.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/4-Push-Using-Caching.yml)

## Objetivo

Visualizar como podemos hacer uso de la `actions/cache@v3`

## Posible ejecución

1. Realizar cualquier cambio y realizando un push se activará el workflow o usarlo manualmente. Vemos como en el primer Job no hace ningún tipo match al buscar en cache pero en los siguientes si.