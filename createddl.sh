#!/bin/bash

. env.sh

hive -f ddl/snapshot.hql
