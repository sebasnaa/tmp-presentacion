#!/bin/bash


actions=$(gh workflow list | awk '{print $1}')
enableActions=($actions)


# Habilitamos las actions
if [[ $1 == "enableAll" ]] then
actions=$(gh workflow list -a | awk '{print $1}')
allActions=($actions)

allActions=($(printf "%s\n" "${allActions[@]}" | sort))
enableActions=($(printf "%s\n" "${enableActions[@]}" | sort))
diff_list=($(comm -23 <(printf "%s\n" "${allActions[@]}") <(printf "%s\n" "${enableActions[@]}"))) 

  for i in ${diff_list[@]} 
   do 
       gh workflow enable $i 2> /dev/null
   done
   echo "
   Todos los workflow activados"
fi


# Deshabilitamos las actions
if [[ $1 == "disableAll" ]] then
  for i in ${enableActions[@]} 
   do 
      gh workflow disable $i 2> /dev/null
   done
   echo "
    Todos los workflow desactivados"
fi


if [[ $1 == "enable" && $2 == [1-9] ]] then

  actions=$(gh workflow list -a | awk '{print $1}')
  allActions=($actions)

  allActions=($(printf "%s\n" "${allActions[@]}" | sort))
  enableActions=($(printf "%s\n" "${enableActions[@]}" | sort))
  diff_list=($(comm -23 <(printf "%s\n" "${allActions[@]}") <(printf "%s\n" "${enableActions[@]}"))) 


  nueva_lista=()
  for elemento in "${diff_list[@]}"
  do
    if [[ $elemento =~ ^$2-* ]]; then
      nueva_lista+=("$elemento")
    fi
  done
  for elemento in "${nueva_lista[@]}"
  do
    gh workflow enable $elemento 2> /dev/null
  done

  echo "
  Todos los workflow $2-* activados" 

fi

if [[ $1 == "disable" && $2 == [1-9] ]] then

  nueva_lista=()
  for elemento in "${enableActions[@]}"
  do
    if [[ $elemento =~ ^$2-* ]]; then
      nueva_lista+=("$elemento")
    fi
  done
  for elemento in "${nueva_lista[@]}"
  do
    gh workflow disable $elemento 2> /dev/null
  done

  echo "
  Todos los workflow $2-* desactivados  " 

fi

# # Habilitamos las actions según el valor numerico inicial que contiene
# if [[ $1 == [1-9] ]]; then

#   nueva_lista=()
#   for elemento in "${array[@]}"
#   do
#     if [[ $elemento =~ ^$1-* ]]; then
#       nueva_lista+=("$elemento")
#     fi
#   done
#   for elemento in "${nueva_lista[@]}"
#   do
#     gh workflow enable $elemento 2> /dev/null
#   done

#   echo "Todos los workflow $1-* activados  " 

# fi






