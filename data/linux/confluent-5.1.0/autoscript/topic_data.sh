#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Topic Data Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

mkdir -p data

avroConsoleConsumerCommand=${kafka_avro_console_consumer_command/__topicsfilename__/${filename}}
echo -e "Topics data and count command prepared: " ${avroConsoleConsumerCommand}

for topic in $(echo ${kafka_data_topics} | sed "s/,/ /g")
do
    command=$(sed "s/__topics__/${topic}/g" <<< ${avroConsoleConsumerCommand})
    eval ${command} 2> responseOfAvroConsumerCommand
	msgOfTopic=$(sed -e "s/Processed a total of \(.*\) messages/\1/" <<< $(<responseOfAvroConsumerCommand))
    echo "${topic}:${msgOfTopic}"
done

echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Topic Data Script >>>>>>>>>>>>>>>>>>>>>>>>"