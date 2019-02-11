#!/bin/bash

file="./kafka.properties"

if [ -f "$file" ]
then
  echo "$file found."
  while IFS='=' read -r key value
  do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
  done < "$file"
  echo "kafka.broker =" ${kafka_broker}
  echo "kafka.topics.create =" ${kafka_topics_create}
  echo "kafka.topics.delete =" ${kafka_topics_delete}
  echo "kafka.topics.script =" ${kafka_topics_script}
  echo "kafka.create.topics.command =" ${kafka_create_topics_command}
  echo "kafka.check.deleted.topics.command =" ${kafka_check_deleted_topics_command}
  echo "kafka.delete.topics.command =" ${kafka_delete_topics_command}
else
  echo "$file not found."
fi
