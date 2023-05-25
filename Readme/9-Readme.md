# 9-Own-actions

Este action contiene un conjunto de flujos de trabajo automatizados que se activan en respuesta a eventos de push en la rama "master" y eventos de disparo de flujo de trabajo (workflow_dispatch).

- Usando JS actions
- Usando Composite actions
- Usando Docker actions

## Jobs

### Lint

- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cargar y cachear las dependencias utilizando la acción personalizada `./.github/actions/cached-deps`.
  3. Verificar si se utilizó la caché en la acción de carga y caché de dependencias.
  4. Verificar el código utilizando el comando `npm run lint`.

### Test

- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cargar y cachear las dependencias utilizando la acción personalizada `./.github/actions/cached-deps`.
  3. Ejecutar pruebas utilizando el comando `npm run test`.
  4. Subir informe de pruebas como artefacto en caso de fallos.

### Build

- **Necesita**: Test
- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cargar y cachear las dependencias utilizando la acción personalizada `./.github/actions/cached-deps`.
  3. Compilar el sitio web utilizando el comando `npm run build`.
  4. Subir los archivos generados como artefactos.

### Deploy

- **Necesita**: Build
- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Obtener los artefactos de compilación utilizando la acción `actions/download-artifact@v3`.
  3. Mostrar el contenido de los archivos obtenidos.
  4. Desplegar el sitio web utilizando la acción personalizada `sebasnaa/deploy-s3-docker`.
  5. Mostrar la URL del sitio web desplegado.


