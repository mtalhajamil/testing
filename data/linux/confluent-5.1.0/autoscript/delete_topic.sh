#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Delete Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

commadToDeleteTopics=${kafka_delete_topics_command/__topics__/${kafka_topics_delete}}
echo "Command to delete topics: " ${commadToDeleteTopics}
eval ${commadToDeleteTopics}

topicsToDelete=$(sed 's/,/\\|/g' <<< ${kafka_topics_delete})
echo $topicsToDelete
commadToCheckDeletedTopicsCount=${kafka_check_deleted_topics_count_command/__topics__/${topicsToDelete}}
echo "Command to get name of remaining topics to be deleted: " ${commadToCheckDeletedTopicsCount}
countOfTopicsRemaining=-1

commadToGetNameOfTopics=${kafka_check_deleted_topics_command/__topics__/${topicsToDelete}}
echo "Command to get count of remaining topics to be deleted: " ${commadToGetNameOfTopics}

while [ $countOfTopicsRemaining -ne 0 ]
do
   eval ${commadToCheckDeletedTopicsCount} > count
   countOfTopicsRemaining=$(<count)
   echo "Topic remaining to delete: " $countOfTopicsRemaining

   eval ${commadToGetNameOfTopics} > nameOfTopics
   nameOfTopicsRemaining=$(<nameOfTopics)
   echo -e "Name of topics: \n" ${nameOfTopicsRemaining}

   sleep 2
done

echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Delete Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"