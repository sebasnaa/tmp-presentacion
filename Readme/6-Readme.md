# 6-Matrix

Este repositorio contiene un flujo de trabajo automatizado que se activa en respuesta a eventos de push y eventos de disparo de flujo de trabajo (workflow_dispatch).

## Job: Build

- **Ejecución**: Se ejecuta en varias combinaciones definidas en la matriz.
- **Estrategia**: Matriz de combinaciones con diferentes versiones de Node.js y sistemas operativos.
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Instalar Node.js utilizando la acción `actions/setup-node@v3` con la versión correspondiente especificada en la matriz.
  3. Instalar las dependencias utilizando el comando `npm ci`.
  4. Compilar el proyecto utilizando el comando `npm run build`.

### Matriz

La matriz define diferentes combinaciones de versiones de Node.js y sistemas operativos para ejecutar el trabajo de compilación. Las combinaciones se definen de la siguiente manera:

- `node-version`: Versiones de Node.js [16, 18]
- `os`: Sistemas operativos [ubuntu-latest, windows-latest]

Si se produce un error en una combinación específica, por defecto, el flujo de trabajo se detendrá y no se ejecutarán más trabajos para esa combinación. Sin embargo, en este caso, se ha agregado el parámetro `continue-on-error: true` en la estrategia de la matriz para evitar que el flujo de trabajo se detenga en caso de errores.

#### Ejemplos de uso

1. Uso de include o exclude

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
2. Uso de continue-on-error
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