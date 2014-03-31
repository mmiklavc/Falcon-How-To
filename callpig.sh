#!/bin/bash

echo "Running Pig script"
pig -useHCatalog \
  -param falcon_snapshotin_database=falcon_howto \
  -param falcon_snapshotin_storage_type=TABLE \
  -param falcon_snapshotin_table=snapshot \
  -param falcon_snapshotin_catalog_url=thrift://sandbox.hortonworks.com:9083 \
  -param falcon_snapshotin_filter="(ds=='20140325')" \
  -param deltain=hdfs://sandbox.hortonworks.com:8020/cluster-one/data/delta/20140326 \
  -param falcon_snapshotout_database=falcon_howto \
  -param falcon_snapshotout_storage_type=TABLE \
  -param falcon_snapshotout_dataout_partitions="'ds=20140326'" \
  -param falcon_snapshotout_catalog_url=thrift://sandbox.hortonworks.com:9083 \
  -param falcon_snapshotout_dated_partition_value=20140326 \
  -param falcon_snapshotout_table=snapshot \
  -param timestamp=20140326 \
  -f apps/howto/gen_snapshot.pig
echo "done"
