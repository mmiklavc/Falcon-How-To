#!/bin/bash

. env.sh

DELTA_LOCAL_DIR=deltas

echo "Cleaning up deltas..."
hdfs dfs -rm -r ${DELTA_DIR}
echo "Done cleaning up deltas"

echo "Loading deltas..."
for dir in $(ls ${DELTA_LOCAL_DIR}); do
    echo "Loading $dir"
    hdfs dfs -mkdir -p ${DELTA_DIR}/${dir}
    hdfs dfs -put ${DELTA_LOCAL_DIR}/${dir}/* ${DELTA_DIR}/${dir}/
    echo "Done loading"
done
echo "Done loading deltas"
