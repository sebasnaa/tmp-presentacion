# Push, Pull request, Issues....

## Objetivo

Poder visualizar los múltiples eventos que pueden disparar la ejecución de un workflows y ver diferencias entre `Activity Types` y `Filters`. No existe ningún orden para la ejecución.

- ### [Push Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Push-Event.yml) `filter`
---
 ### Posibles pruebas
---
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


- ### [Issues Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Issues-Event.yml)

---
 ### Posibles pruebas
---

- ### [Pull Request Event](https://github.com/sebasnaa/tmp-presentacion/blob/master/.github/workflows/1-Pull-request-Event.yml)
