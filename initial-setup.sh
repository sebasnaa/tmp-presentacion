#!/bin/bash


# gh workflow list -a | awk '{print $1}'
gh workflow list -a


gh workflow disable "1-Pull-request-Event"
gh workflow disable "2-Jobs-Encadenados"
gh workflow disable "3-Variables-Context"
gh workflow disable "4-Push-Using-Caching"
gh workflow disable "4-Push-No-Using-Caching"
gh workflow disable "1-Issues-Event"
gh workflow disable "1-Push-Event"



if [ $# -gt 0 ]
  then
    echo "valor $1"
fi