#!/bin/bash

export SPARK_HOME=/opt/spark/spark-3.0.1-bin-hadoop3.2
export SPARK_RAPIDS_PLUGIN_DIR=/opt/sparkRapidsPlugin
export SPARK_MASTER_URL=spark://fqdn.or.ip:7077
export SPARK_RAPIDS_PLUGIN_JAR=$SPARK_RAPIDS_PLUGIN_DIR/rapids-4-spark_2.12-0.3.0-SNAPSHOT.jar
export CUDF_JAR=$SPARK_RAPIDS_PLUGIN_DIR/cudf-0.17-20201201.000618-39-cuda11.jar
export SPARK_RAPIDS_PLUGIN_INTEGRATION_TEST_JAR=./rapids-4-spark-integration-tests_2.12-0.3.0-SNAPSHOT-jar-with-dependencies.jar

python benchmark.py \
  --template spark-submit-template.txt \
  --input 'hdfs://fqdn.or.ip:9000/data/tpcds_sf3000-parquet/useDecimal=true,useDate=true,filterNull=false' \
  --input-format parquet \
  --configs gpu-aqe-off-ucx-off-8-cores \
  --benchmark tpcds \
  --query q5
