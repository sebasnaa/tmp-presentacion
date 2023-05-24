# Uso de Matrix

## Fichero 

[6-Matrix.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/6-Matrix.yml)

## Objetivo

Comprobar el funcionamiento ``matrix`` que nos permite crear varios jobs basados en las combinaciones de las variables de la matrix.

## Funcionamiento

1. Ejecutar de forma manual o usando push, deberian funcionar paralelamente.

2. Uso de include o exclude

```
    strategy:
      matrix:
        node-version: [16, 18]
        os: [ubuntu-latest, windows-latest]
        include: 
          - node-version: 14
            os: ubuntu-latest
        exclude:
          - node-version: 12
            os: windows-latest

```
3. Uso de continue-on-error
```
    continue-on-error: true
    strategy:
      matrix:
        node-version: [16, 18]
        os: [ubuntu-latest, windows-latest]
        include: 
          - node-version: 14
            os: ubuntu-latest
        exclude:
          - node-version: 12
            os: windows-latest
```