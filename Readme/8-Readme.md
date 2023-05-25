# Acción `8-Use-Reusable`

Esta acción se activa en respuesta a cambios en la rama `master` o mediante el disparo manual del flujo de trabajo. Contiene tres trabajos: `lint`, `test` y `build`.

### Lint

El trabajo `lint` se ejecuta en una máquina virtual de Ubuntu y realiza las siguientes tareas:

- Obtiene el código utilizando la acción `actions/checkout@v3`.
- Almacena en caché las dependencias utilizando la acción `actions/cache@v3`.
- Instala las dependencias utilizando `npm ci`.
- Ejecuta el linting del código utilizando `npm run lint`.

### Test

El trabajo `test` también se ejecuta en una máquina virtual de Ubuntu y realiza las siguientes tareas:

- Obtiene el código utilizando la acción `actions/checkout@v3`.
- Almacena en caché las dependencias utilizando la acción `actions/cache@v3`.
- Instala las dependencias utilizando `npm ci`.
- Ejecuta las pruebas del código utilizando `npm run test`.
- Si hay una falla en las pruebas, se carga el informe de prueba utilizando `actions/upload-artifact@v3`.

### Build

El trabajo `build` se ejecuta después de que se hayan completado los trabajos `test` y realiza las siguientes tareas:

- Obtiene el código utilizando la acción `actions/checkout@v3`.
- Almacena en caché las dependencias utilizando la acción `actions/cache@v3`.
- Instala las dependencias utilizando `npm ci`.
- Compila el sitio web utilizando `npm run build`.
- Carga los archivos de artefacto utilizando `actions/upload-artifact@v3`.

## Acción `8-Reusable`

Esta acción se configura para ser invocada desde otras acciones y tiene una entrada llamada `artifact-name` que especifica el nombre de los archivos desplegables. Al ser invocada, ejecuta el trabajo `deploy-inside`.

### deploy-inside

El trabajo `deploy-inside` se ejecuta en una máquina virtual de Ubuntu y realiza las siguientes tareas:

- Descarga los archivos de artefacto utilizando `actions/download-artifact@v3`.
- Lista los archivos de artefacto utilizando el comando `ls`.
- Muestra información de despliegue utilizando el comando `echo`.
- Establece el resultado de la salida utilizando `echo "step-result=success" >> $GITHUB_OUTPUT`.



