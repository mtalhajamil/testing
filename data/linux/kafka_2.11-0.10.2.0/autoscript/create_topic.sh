#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Create Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

filename="create_topic"
[ -e $filename ] && rm $filename
echo "Topics file name: " $filename
touch $filename
echo ${kafka_topics_create} | tr ',' '\n' > $filename

command=${kafka_create_topics_command/__topicsfilename__/${filename}}

echo -e "Topics creation command prepared: " ${command}

eval ${command}


echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Create Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"
