docker run -it \
-e MASTER="nvdl-bsg-d000" \
-e SPARK_WORKER_CORES=`nproc` \
-e SPARK_WORKER_OPTS='-Dspark.worker.resource.gpu.amount=1 -Dspark.worker.resource.gpu.discoveryScript=/data/sparkRapidsPlugin/getGpusResources.sh' \
-e SPARK_RAPIDS_PLUGIN_JAR="/data/sparkRapidsPlugin/rapids-4-spark_2.12-0.4.0-20210112.085853-45.jar" \
-e SPARK_RAPIDS_PLUGIN_INTEGRATION_TEST_JAR="/data/tpcds/rapids-4-spark-integration-tests_2.12-0.4.0-20210112.090812-45-jar-with-dependencies.jar" \
-e SPARK_CUDF_JAR="/data/sparkRapidsPlugin/cudf-0.18-20210112.093909-33-cuda11.jar" \
-e TPCDS_HOME="/data/tpcds" \
-v /mnt/nvdl/datasets/tpcds/conf/spark-defaults.conf:/opt/spark/conf/spark-defaults.conf \
-v /mnt/nvdl/datasets/tpcds:/data \
-v /tmp:/tmp \
--network host \
--name worker \
--rm \
gcr.io/data-science-enterprise/spark-worker-slurm:3.0.1
