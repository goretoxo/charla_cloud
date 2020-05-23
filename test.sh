#!/bin/bash

echo $1
 
echo "${1: -1}"

if [ "${1: -1}" == "/" ]
  then
  echo "mal"
  exit
fi
echo "bien"
