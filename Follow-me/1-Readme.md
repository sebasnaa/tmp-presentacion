# Push, Pull request, Issues....


## Ficheros




## Objetivo

Poder visualizar los múltiples eventos que pueden disparar la ejecución de un workflows y ver diferencias entre `Activity Types` y `Filters`. No existe ningún orden para la ejecución.

- ### [Push Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Push-Event.yml) - `Filter`
  - [Doc](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#push)
 ### Posibles pruebas

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

---
- ### [Issues Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Issues-Event.yml) -  `Activity Types`
    - [Doc](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#issues)


 ### Posibles pruebas

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

---

- ### [Pull Request Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Pull-request-Event.yml) -  `Activity Types`
   - [Doc](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#pull_request)
##
 ### Posibles pruebas
 

1. Inicialmente podemos realizar cualquier cambio y realizar un pull request que activará el workflow.

2. Modificar el código

```
on:
  pull_request:
    types:
      - edited
```