# 4-Push-No-Using-Caching

Este repositorio contiene un flujo de trabajo automatizado que se activa en respuesta a eventos de push a la rama `master` y eventos de disparo de flujo de trabajo (workflow_dispatch).

## Jobs

### Test

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Instalar las dependencias utilizando el comando `npm ci`.
  3. Lint code: Ejecutar el comando `npm run lint`.
  4. Test code: Ejecutar el comando `npm run test`.

### Build

- **Necesita**: El trabajo de compilación (`build`) debe completarse correctamente antes de ejecutar este trabajo.
- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Salidas**: Este trabajo produce la salida `script-file` que se utilizará en el trabajo de implementación (`deploy`).
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Instalar las dependencias utilizando el comando `npm ci`.
  3. Compilar el sitio web utilizando el comando `npm run build`.
  4. Publicar el nombre del archivo JavaScript: Se utiliza el comando `find dist/assets/*.js -type f -execdir echo 'script-file-something={}' >> $GITHUB_OUTPUT ';'` para encontrar el archivo JavaScript generado y almacenar su nombre en la salida `script-file-something` utilizando la variable de entorno `$GITHUB_OUTPUT`.
  5. Cargar los artefactos generados utilizando la acción `actions/upload-artifact@v3` para almacenar los archivos generados en la ruta `dist`.

### Deploy

- **Necesita**: El trabajo de compilación (`build`) debe completarse correctamente antes de ejecutar este trabajo.
- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Obtener los artefactos de compilación utilizando la acción `actions/download-artifact@v3`.
  2. Mostrar el contenido de los artefactos utilizando el comando `ls`.
  3. Obtener el nombre del archivo JavaScript de la salida del trabajo de compilación utilizando el comando `echo "${{ needs.build.outputs.script-file }}"`.
  4. Implementar: Imprimir el mensaje "Deploying..." para indicar que se está realizando la implementación.



# 4-Push-Using-Caching

Este repositorio contiene un flujo de trabajo automatizado que se activa en respuesta a eventos de push a la rama `master` y eventos de disparo de flujo de trabajo (workflow_dispatch).

## Jobs


### Test

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cachear las dependencias utilizando la acción `actions/cache@v3` para almacenar las dependencias de Node.js en la ruta `~/.npm` basado en el archivo `package-lock.json`.
  3. Instalar las dependencias utilizando el comando `npm ci`.
  4. Lint code: Ejecutar el comando `npm run lint`.
  5. Test code: Ejecutar el comando `npm run test`.

### Build

- **Necesita**: El trabajo de prueba (`test`) debe completarse correctamente antes de ejecutar este trabajo.
- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Salidas**: Este trabajo produce la salida `script-file` que se utilizará en el trabajo de implementación (`deploy`).
- **Pasos**:
  1. Obtener código utilizando la acción `actions/checkout@v3`.
  2. Cachear las dependencias utilizando la acción `actions/cache@v3` para almacenar las dependencias de Node.js en la ruta `~/.npm` basado en el archivo `package-lock.json`.
  3. Instalar las dependencias utilizando el comando `npm ci`.
  4. Compilar el sitio web utilizando el comando `npm run build`.
  5. Publicar el nombre del archivo JavaScript: Se utiliza el comando `find dist/assets/*.js -type f -execdir echo 'script-file-something={}' >> $GITHUB_OUTPUT ';'` para encontrar el archivo JavaScript generado y almacenar su nombre en la salida `script-file-something` utilizando la variable de entorno `$GITHUB_OUTPUT`.
  6. Cargar los artefactos generados utilizando la acción `actions/upload-artifact@v3` para almacenar los archivos generados en la ruta `dist`.

### Deploy

- **Necesita**: El trabajo de compilación (`build`) debe completarse correctamente antes de ejecutar este trabajo.
- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Obtener los artefactos de compilación utilizando la acción `actions/download-artifact@v3`.
  2. Mostrar el contenido de los artefactos utilizando el comando `ls`.
  3. Obtener el nombre del archivo JavaScript de la salida del trabajo de compilación utilizando el comando `echo "${{ needs.build.outputs.script-file }}"`.
  4. Implementar: Imprimir el mensaje "Deploying..." para indicar que se está realizando la implementación.


