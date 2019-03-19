#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Create Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

echo ${kafka_topics_create} | tr ',' '\n' > create_topic

command=${kafka_create_topics_command/__topicsfilename__/create_topic}

echo -e "Topics creation command prepared: " ${command}

eval ${command}

echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Create Topic Script >>>>>>>>>>>>>>>>>>>>>>>>"