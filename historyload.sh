#!/bin/bash

. env.sh

echo "Cleaning snapshot dir..."
hdfs dfs -rm -r $SNAPSHOT_DIR
echo "Done cleaning snapshot dir"

echo "Loading snapshot history load..."
hdfs dfs -mkdir -p $SNAPSHOT_DIR/ds=20140325
hdfs dfs -put historyload/* $SNAPSHOT_DIR/ds=20140325
echo "Done loading snapshot history load"

echo "Adding partition..."
hive -e "USE $DATABASE; ALTER TABLE $SNAPSHOT_TABLE ADD IF NOT EXISTS PARTITION (ds = '20140325')";
echo "Done adding partition"
