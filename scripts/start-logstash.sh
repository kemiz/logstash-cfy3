#!/bin/bash

FILEPATH=$(ctx node properties conf_filepath)
FILENAME=$(ctx node properties conf_filename)

sudo curl -o ${FILENAME} ${FILEPATH}
/opt/logstash/bin/logstash -f ${FILENAME}