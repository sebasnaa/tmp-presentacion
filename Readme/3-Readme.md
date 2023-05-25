# 3-Variables-Context

Este repositorio contiene un flujo de trabajo automatizado que se activa en respuesta a un evento de disparo de flujo de trabajo (workflow_dispatch). El flujo de trabajo incluye varios trabajos que demuestran el uso de variables y contexto en GitHub Actions.

## Jobs

### job1

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Contexto de GitHub: Se utiliza la variable de entorno `GITHUB_CONTEXT` para almacenar el contexto de GitHub utilizando el comando `echo "$GITHUB_CONTEXT"`.

### job2

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Salidas**: Este trabajo produce las salidas `output1` y `output2` que se utilizarán en el trabajo `job3`.
- **Pasos**:
  1. Paso 1: Se utiliza el identificador `step1` y el comando `echo "step1value=hello" >> $GITHUB_OUTPUT` para almacenar el valor `hello` en la salida `step1value` utilizando la variable de entorno `$GITHUB_OUTPUT`.
  2. Paso 2: Se utiliza el identificador `step2` y el comando `echo "step2value=stemdoers" >> $GITHUB_OUTPUT` para almacenar el valor `stemdoers` en la salida `step2value` utilizando la variable de entorno `$GITHUB_OUTPUT`.

### Job: job3

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Necesita**: El trabajo `job2` debe completarse correctamente antes de ejecutar este trabajo.
- **Pasos**:
  1. Se muestra el valor de las salidas `output1` y `output2` del trabajo `job2` utilizando el comando `echo ${{needs.job2.outputs.output1}} ${{needs.job2.outputs.output2}}`.

### Job: job4

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Variables de entorno**:
  - `VARIABLE2`: Se establece en `jobvariable2` específicamente para este trabajo.
  - `VARIABLE3`: Se establece en `jobvariable3` específicamente para este trabajo.
- **Pasos**:
  1. Se muestran los valores de las variables de entorno `VARIABLE1`, `VARIABLE2` y `VARIABLE3` utilizando el comando `echo`.
  2. Se muestra el valor actualizado de la variable de entorno `VARIABLE3` establecido en `mystepvar3` utilizando la variable de entorno `$VARIABLE3`.


