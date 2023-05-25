# GitHub Actions Push, Pull request, Issues....

Este repositorio contiene varios flujos de trabajo automatizados utilizando GitHub Actions. Cada flujo de trabajo se activa en respuesta a un evento específico y realiza una serie de pasos relacionados.

## 1-Issues-Event

Este flujo de trabajo se activa en respuesta a eventos de apertura, cierre, asignación, etc. de issues. Proporciona información detallada sobre el evento en los pasos del trabajo.

### Ejemplos de uso

1. Inicialmente podemos crear un issues y veremos como activa un workflow.

    Adicionalmente tenemos un trigger de tipo `workflow_dispatch` que nos permite lanzar el workflow de forma manual. 

2. Modificar el código

```
on: 
  issues:
      types:
        - edited
        - deleted
```

## 1-Pull-request-Event

Este flujo de trabajo se activa en respuesta a eventos relacionados con solicitudes de extracción (pull requests). Imprime los datos del evento y realiza acciones como la obtención del código, la instalación de dependencias, la ejecución de pruebas y la implementación del proyecto.

### Ejemplos de uso
 

1. Inicialmente podemos realizar cualquier cambio y realizar un pull request que activará el workflow.

2. Modificar el código

```
on:
  pull_request:
    types:
      - edited
```

## 1-Push-Event

Este flujo de trabajo se activa en respuesta a eventos de push en el repositorio. Contiene varios trabajos que se ejecutan en paralelo. El trabajo "Lint" realiza el linting del código, el trabajo "Test" realiza las pruebas y el trabajo "Deploy" realiza la implementación del proyecto. Además, hay un trabajo adicional llamado "Test-parallel" que se ejecuta de forma independiente y realiza pruebas en paralelo.

### Ejemplos de uso


1. Inicialmente podemos realizar cualquier cambio y realizar un push que activará el workflow.

2. Modificar el código 
```
on: 
  push:
    branches:
      - 'main'
      - '!master'
```
3. Modificar el código
```
on: 
  push:
    branches:
      - '!main'
      - 'master'
```
