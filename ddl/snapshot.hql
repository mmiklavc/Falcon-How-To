CREATE DATABASE IF NOT EXISTS ${env:DATABASE};

DROP TABLE IF EXISTS ${env:DATABASE}.${env:SNAPSHOT_TABLE}; 

CREATE EXTERNAL TABLE ${env:DATABASE}.${env:SNAPSHOT_TABLE} (
    COL1                           STRING        COMMENT 'Column 1',
    COL2                           BIGINT        COMMENT 'Column 2',
    COL3                           STRING        COMMENT 'Column 3',
    COL4                           STRING        COMMENT 'Column 4'
)
COMMENT 'Snapshot data'

PARTITIONED BY (ds STRING)
ROW FORMAT DELIMITED
          FIELDS TERMINATED BY ','
          LINES TERMINATED BY  '\n'
STORED AS TEXTFILE
LOCATION '${env:SNAPSHOT_DIR}';
