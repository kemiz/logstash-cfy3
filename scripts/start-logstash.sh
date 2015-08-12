#!/bin/bash

FILEPATH=$(ctx node properties conf_filepath)
FILENAME=$(ctx node properties conf_filename)

curl -o ${FILENAME} ${FILEPATH}
logstash -f ${FILENAME}