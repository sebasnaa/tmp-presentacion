# Jobs en serie o paralelos

## Fichero 

[2-Jobs-Encadenados.yml](https://github.com/sebasnaa/tmp-presentacion/actions/workflows/2-Jobs-Encadenados.yml)

## Objetivo

Comprobar el funcionamiento de los Jobs pudiendo ejecutar Jobs de secuencialmente o paralelamente.

## Funcionamiento

1. Activar el workflow, todos los Jobs se ejecutarán en paralelo

2. Supongamos que queremos ejecutar los jobs en este orden 
  ``Job1 -> Job2 Job3 -> Job4``, pasamos a descomentar los `needs` correspondientes. 

3. Podemos establecer la ejecucion de un Jobs aplicando una condicional, para comprobar este proceso descomentamos 
````
if: github.event.inputs.run-job-3 == 'true'
````

