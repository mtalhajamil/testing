#!/bin/bash

echo "<<<<<<<<<<<<<<<<<<<< Started Executing Kafka Reset Script >>>>>>>>>>>>>>>>>>>>>>>>"

. ./reset_stream_applications.sh
. ./delete_topic.sh
. ./create_topic.sh

echo "<<<<<<<<<<<<<<<<<<<< Ended Executing Kafka Reset Script >>>>>>>>>>>>>>>>>>>>>>>>"