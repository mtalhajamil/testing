#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Loading Properties >>>>>>>>>>>>>>>>>>>>>>>>"

file="./kafka.properties"

if [ -f "$file" ]
then
  echo "$file found."
  while IFS='=' read -r key value
  do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
    #echo ${key} "= ${!key}"
  done < "$file"
else
  echo "$file not found."
fi


echo "<<<<<<<<<<<<<<<<<<<< Loaded Properties >>>>>>>>>>>>>>>>>>>>>>>>"