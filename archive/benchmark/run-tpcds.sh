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
  --query q1 q2 q3 q5 q6 q7 q8 q9 q10 \
  q12 q13 q14a q14b q15 q16 q17 q18 q19 \
  q20 q21 q22 q23a q23b q25 q26 q27 q28 q29 \
  q30 q31 q32 q33 q34 q35 q36 q37 q38 q39a q39b \
  q40 q41 q42 q43 q44 q45 q46 q47 q48 q49 \
  q50 q52 q53 q54 q55 q56 q57 q58 q59 \
  q60 q61 q62 q63 q64 q65 q66 q68 q69 \
  q70 q71 q73 q74 q75 q76 q77 q78 q79 \
  q80 q81 q82 q83 q84 q85 q86 q87 q88 q89 \
  q90 q91 q92 q93 q94 q96 q97 q98 q99

#Note several queries have been ommitted in this example
