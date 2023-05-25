# 2-Jobs-Encadenados

Este repositorio contiene un flujo de trabajo automatizado que se activa en respuesta a un evento de disparo de flujo de trabajo (workflow_dispatch). El flujo de trabajo incluye varios trabajos que demuestran cómo encadenar trabajos en GitHub Actions.

## Jobs

### job-1

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Salida para Job 1: Utiliza el comando `echo` para imprimir "Hello from Job 1. Run Job 3 equals true" y utiliza la entrada `run-job-3` para obtener el valor booleano ingresado en el evento del flujo de trabajo.

### job-2

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Salida para Job 2: Utiliza el comando `echo` para imprimir "Hello from Job 2".

### job-3

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Salida para Job 3: Utiliza el comando `echo` para imprimir "Hello from Job 3".

### job-4

- **Ejecución**: Se ejecuta en `ubuntu-latest`.
- **Pasos**:
  1. Salida para Job 4: Utiliza el comando `echo` para imprimir "Hello from Job 4".

## Ejemplos de uso

1. Activar el workflow, todos los Jobs se ejecutarán en paralelo

2. Supongamos que queremos ejecutar los jobs en este orden 
  ``Job1 -> Job2 Job3 -> Job4``, pasamos a descomentar los `needs` correspondientes. 

3. Podemos establecer la ejecucion de un Jobs aplicando una condicional
````
if: github.event.inputs.run-job-3 == 'true'
````

