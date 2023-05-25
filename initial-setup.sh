#!/bin/bash

actions=$(gh workflow list -a | awk '{print $1}')
array=($actions)

# Habilitamos las actions
if [[ $1 == "enable" ]] then
  for i in ${array[@]} 
   do 
       gh workflow enable $i 2> /dev/null
   done
fi
# Deshabilitamos las actions
if [[ $1 == "disable" ]] then
  for i in ${array[@]} 
   do 
      gh workflow disable $i 2> /dev/null
   done
fi

# Habilitamos las actions según el valor numerico inicial que contiene
if [[ $1 == [1-9] ]]; then

  nueva_lista=()
  for elemento in "${array[@]}"
  do
    if [[ $elemento =~ ^$1-* ]]; then
      nueva_lista+=("$elemento")
    fi
  done
  for elemento in "${nueva_lista[@]}"
  do
    gh workflow enable $elemento 2> /dev/null
  done


fi


