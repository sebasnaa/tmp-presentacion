# Script de ayuda al usuario

Los archivos .sh proporcionados, `tired.sh` e `initial-setup.sh`, son scripts de shell que contienen comandos para automatizar tareas relacionadas con Git y GitHub Actions.


## El script `initial-setup.sh`

El script `initial-setup.sh` se encarga de habilitar o deshabilitar las acciones (workflows) en un repositorio. Su funcionalidad se basa en la herramienta de línea de comandos `gh` (GitHub CLI). El script realiza lo siguiente:

1. Obtiene la lista de acciones existentes en el repositorio utilizando el comando `gh workflow list -a` y lo guarda en la variable `actions`.

2. Si el primer argumento pasado al script es `enable`, habilita todas las acciones.

3. Si el primer argumento pasado al script es `disable`, deshabilita todas las acciones.

4. Si el primer argumento pasado al script es un número del 1 al 9, habilita todas las acciones cuyos nombres comienzan con ese número.

Para obtener más información sobre el uso de los comandos y la configuración de las acciones en el repositorio, consulta el código fuente del archivo `initial-setup.sh`.

## El script `tired.sh`

El script `tired.sh` realiza las siguientes acciones:

1. Obtiene un mensaje aleatorio de un sitio web (`http://whatthecommit.com/`) utilizando el comando `curl` y realiza algunas manipulaciones con herramientas de línea de comandos como `grep`, `tail` y `sed`.
2. Agrega todos los archivos al área de preparación de Git utilizando el comando `git add ./`.
3. Crea un commit con el mensaje obtenido en el paso 1 utilizando el comando `git commit -m "$message"`.
4. Si no se proporciona ningún argumento al script (usando `$#`), realiza un push al repositorio remoto en la rama "master" utilizando el comando `git push origin master`. De lo contrario, realiza un push a la rama especificada como argumento.

Para obtener más información sobre el uso de los comandos y la configuración de las acciones en el repositorio, consulta el código fuente del archivo `tired.sh`.


# Descripción  actions
Estos archivos YAML representan flujos de trabajo específicos que pueden personalizarse y configurarse para adaptarse a los requisitos de un proyecto en particular.

Los archivos YAML enumerados son archivos de acciones en GitHub. Cada archivo YAML representa una acción o flujo de trabajo específico que se puede ejecutar en respuesta a ciertos eventos o desencadenadores. Aquí está un resumen de cada uno de los archivos enumerados:



### `1-Issues-Event.yml`
Este archivo de acción se activa en respuesta a eventos relacionados con problemas (issues) y eventos de disparo de flujo de trabajo (workflow_dispatch). Contiene un trabajo llamado "info" que se ejecuta en una máquina virtual de Ubuntu y muestra los detalles del evento.

### `1-Issues-Event.yml`
Este archivo de acción se activa en respuesta a eventos relacionados con problemas (issues) y eventos de disparo de flujo de trabajo (workflow_dispatch). Contiene un trabajo llamado "info" que se ejecuta en una máquina virtual de Ubuntu y muestra los detalles del evento.

### `1-Pull-request-Event.yml` 
Este archivo de acción se activa en respuesta a eventos relacionados con solicitudes de extracción (pull_request) y eventos de disparo de flujo de trabajo (workflow_dispatch). Contiene tres trabajos: "deploy", "Test-parallel" y "Deploy". Estos trabajos realizan diversas tareas, como obtener el código, instalar dependencias, ejecutar pruebas y realizar implementaciones.

### `2-Jobs-Encadenados.yml`
Este archivo de acción contiene una serie de trabajos que se encadenan entre sí. Los trabajos se ejecutan secuencialmente y el resultado de un trabajo se puede utilizar como entrada para otros trabajos.

### `3-Variables-Context.yml`
Este archivo de acción muestra cómo se pueden usar variables y contextos en GitHub Actions. Define varios trabajos que utilizan variables de entorno y el contexto de GitHub para realizar diversas tareas.

### `4-Push-No-Using-Caching.yml y 4-Push-Using-Caching.yml`
Estos archivos de acción se activan en respuesta a eventos de push en la rama maestra y contienen trabajos para probar, construir y implementar un proyecto. La diferencia principal es que el segundo archivo utiliza el caché para almacenar las dependencias npm y acelerar el proceso de construcción.

### `6-Matrix.yml`
Este archivo de acción muestra cómo utilizar la estrategia de matriz para ejecutar trabajos en diferentes configuraciones. En este caso, los trabajos se ejecutan en diferentes versiones de Node.js y sistemas operativos.

### `7-Execution-Flow-Continue.yml y 7-Execution-Flow.yml`
Estos archivos de acción demuestran cómo controlar el flujo de ejecución de los trabajos. El archivo 7-Execution-Flow.yml muestra cómo generar un informe solo si un trabajo falla. El archivo 7-Execution-Flow-Continue.yml muestra cómo continuar la ejecución de otros trabajos incluso si uno de los trabajos falla.

### `8-Use-Reusable.yml`
Esta acción se activa cuando se realiza un push a la rama master o cuando se dispara manualmente. Contiene tres trabajos: lint, test y build. Estos trabajos realizan tareas como obtener el código, almacenar en caché las dependencias, ejecutar pruebas y compilar el sitio web.

### `8-Reusable.yml` 
Esta acción puede ser invocada desde otras acciones. Tiene una entrada llamada artifact-name que especifica el nombre de los archivos desplegables. Al ser invocada, ejecuta el trabajo deploy-inside, que descarga los archivos de artefacto, muestra información de despliegue y establece el resultado de la salida.

### `9-Own-actions.yml`
Esta accion se ejecuta en respuesta a eventos de push y workflow_dispatch en la rama "master". Estos trabajos incluyen tareas estándar como la verificación de código, ejecución de pruebas, compilación de un sitio web y despliegue. Además, también utiliza acciones personalizadas para realizar ciertas operaciones, como cargar y cachear dependencias, y desplegar el sitio web en un bucket de S3 utilizando una acción personalizada específica

