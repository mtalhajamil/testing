#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Reseting Stream Applications >>>>>>>>>>>>>>>>>>>>>>>>"

. ./load_prop.sh

filename="reset_stream_applications"
[ -e $filename ] && rm $filename
echo "Application Ids file: " $filename
echo ${kafka_topics_stream} | tr ',' '\n' > $filename

command=${kafka_reset_stream_applications_command/__topicsfilename__/${filename}}
command=${command/__topics__/${kafka_topics_stream}}

echo -e "Applications stream reset command prepared: " ${command}

eval ${command}

echo "<<<<<<<<<<<<<<<<<<<< Ended Reseting Stream Applications >>>>>>>>>>>>>>>>>>>>>>>>"