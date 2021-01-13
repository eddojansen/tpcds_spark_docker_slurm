#!/bin/bash

SPARK_HOME=/opt/spark/spark-3.0.1-bin-hadoop3.2
SPARK_MASTER=spark://fqdn.or.ip:7077
DATAGEN_SCALA=tpcds_datagen_3T.scala
SPARK_SQL_JAR=spark-sql-perf_2.12-0.5.1-SNAPSHOT.jar

set -x

$SPARK_HOME/bin/spark-shell -I $DATAGEN_SCALA --master $SPARK_MASTER --jars $SPARK_SQL_JAR --executor-memory 50G
