#!/bin/bash

. env.sh

echo "Cleaning app..."
hdfs dfs -rm -r $APP_PATH
echo "Done cleaning app"

echo "Deploying app..."
hdfs dfs -mkdir -p $APP_PATH
hdfs dfs -put $APP_SRC/* $APP_PATH
echo "Done deploying app"
