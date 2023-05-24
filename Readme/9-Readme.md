# Own actions

## Fichero 

[9-Own-actions.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/9-Own-actions.yml)

[s3-docker-deploy](https://github.com/sebasnaa/deploy-s3-docker)

## Objetivo

Comprobar diferentes tipos de ejecución, sinedo fuentes locales o otros repositorios.

- Usando JS actions
- Usando Composite actions
- Usando Docker actions


## Funcionamiento

1. Para usar JS utilizaremos la action personalizada ``.github/actions/deploy-s3-javascript``

Recordad que cad action es un objeto individual, es decir, necesitamos todos sus elementos para un correcto funcionamiento. Podemos ver como en su directorio nos encontramos ``node_modules`` para poder hacer esto teniendo un .gitignore debemos incluir solo ``/node_modules``

2. Para usar composite utilizaremos la configurada en ``.github/actions/cached-deps``

3. Para usar Docker(Python) utilizaremos la action personalizada ``.github/actions/deploy-s3-docker``

4. Todas las actiosn pueden ser referenciadas desde otro repositorio ``sebasnaa/deploy-s3-docker@v1``