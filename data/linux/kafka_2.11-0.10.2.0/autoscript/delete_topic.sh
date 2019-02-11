#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Delete Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

topicsToDelete=$(sed 's/,/\\|/g' <<< ${kafka_topics_delete})

echo $topicsToDelete

command=${kafka_check_deleted_topics_command/__topics__/${topicsToDelete}}

echo -e "Topics deletion command prepared: " ${command}

countOfTopicsRemaining=-1

while [ $countOfTopicsRemaining -ne 0 ]
do
   eval ${command} > count
   countOfTopicsRemaining=$(<count)
   echo "Topic remaining to delete: " $countOfTopicsRemaining
   sleep 2
done

echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Delete Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"