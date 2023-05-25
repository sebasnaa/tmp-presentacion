# 7-Execution-Flow

Este action contiene un conjunto de flujos de trabajo automatizados que se activan en respuesta a eventos de push en la rama "master" y eventos de disparo de flujo de trabajo (workflow_dispatch).

## Jobs

### Lint

- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cachear las dependencias utilizando la acción `actions/cache@v3`.
  3. Instalar las dependencias solo si no se encuentra un caché válido.
  4. Verificar el código utilizando el comando `npm run lint`.

### Test

- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cachear las dependencias utilizando la acción `actions/cache@v3`.
  3. Instalar las dependencias solo si no se encuentra un caché válido.
  4. Ejecutar pruebas utilizando el comando `npm run test`.
  5. Subir informe de pruebas como artefacto en caso de fallos.

### Build

- **Necesita**: Test
- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cachear las dependencias utilizando la acción `actions/cache@v3`.
  3. Instalar las dependencias solo si no se encuentra un caché válido.
  4. Compilar el sitio web utilizando el comando `npm run build`.
  5. Subir los archivos generados como artefactos.

### Deploy

- **Necesita**: Build
- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Obtener los artefactos de compilación utilizando la acción `actions/download-artifact@v3`.
  2. Mostrar el contenido de los archivos obtenidos.
  3. Desplegar el sitio web. El comando utilizado en el archivo original es `echo "Deploying..."`, pero no se proporciona más información sobre cómo se realiza el despliegue.

### Reports

- **Necesita**: Lint, Deploy
- **Condiciones**: Ejecutar solo en caso de fallos
- **Ejecución**: ubuntu-latest
- **Pasos**:
  1. Mostrar información de salida relacionada con el fallo en los trabajos anteriores.

Ten en cuenta que algunos pasos están comentados en el archivo original y no se ejecutan en el flujo de trabajo actual.