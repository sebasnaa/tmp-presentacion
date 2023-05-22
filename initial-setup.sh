#!/bin/bash


gh workflow list -a

gh workflow disable "1-Push-Event"
gh workflow disable "1-Issues-Event"

