#!/bin/bash

set -x

/opt/spark/bin/spark-shell -I /data/tpcds/tpcds_datagen.scala --master spark://`hostname`:7077 --jars /data/tpcds/spark-sql-perf_2.12-0.5.1-SNAPSHOT.jar --executor-memory 40G
