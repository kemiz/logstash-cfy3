#!/bin/bash

FILEPATH=$(ctx node properties conf_filepath)
FILENAME=$(ctx node properties conf_filename)

wget ${FILEPATH}
logstash -f ${FILENAME}