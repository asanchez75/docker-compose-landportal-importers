#!/bin/bash

if [ ! -d /usr/landbook-receiver/model ]; then
  cd /usr/landbook-receiver && \
  git clone https://github.com/landportal/landbook-model model
fi

# replacing relative by absolute path
cd /usr/src/app && \
find . -type f -exec sed -i -e 's#../../landbook-receiver/rdf-generator.py#/usr/landbook-receiver/rdf-generator.py#g#' {} \;

# run main script automatically to generate RDF data
#//usr/src/app/run.sh

sleep infinity
