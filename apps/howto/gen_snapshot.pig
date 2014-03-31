IN_SNAPSHOT = LOAD '$falcon_snapshotin_database.$falcon_snapshotin_table' using org.apache.hcatalog.pig.HCatLoader();
IN_SNAPSHOT_FILTERED = FILTER IN_SNAPSHOT BY $falcon_snapshotin_filter;
IN_SNAPSHOT_PRUNED = FOREACH IN_SNAPSHOT_FILTERED GENERATE $0..$3;
DESCRIBE IN_SNAPSHOT_PRUNED;

IN_DELTA = LOAD '$deltain' using PigStorage(',') as (col1:chararray, col2:long, col3:chararray, col4:chararray);
DESCRIBE IN_DELTA;

OUT_SNAPSHOT = UNION IN_SNAPSHOT_PRUNED, IN_DELTA;
STORE OUT_SNAPSHOT INTO '$falcon_snapshotout_database.$falcon_snapshotout_table' USING org.apache.hcatalog.pig.HCatStorer('$falcon_snapshotout_dataout_partitions');
