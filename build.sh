#!/bin/bash 
set -e

if [[ $1 == "" ]]; then
  echo "Provide a tag for the container"
  exit 1
fi

docker pull ubuntu:16.04
docker build -t eu.gcr.io/bolcom-sbx-monitoring-clients/opentsdb-bigtable:$1 .
gcloud docker -- push eu.gcr.io/bolcom-sbx-monitoring-clients/opentsdb-bigtable:$1
