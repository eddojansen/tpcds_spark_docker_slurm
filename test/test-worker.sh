docker run -it \
-e MASTER="nvdl-bsg-d000" \
-e SPARK_WORKER_CORES=`nproc` \
-e SPARK_WORKER_OPTS='-Dspark.worker.resource.gpu.amount=1 -Dspark.worker.resource.gpu.discoveryScript=/mnt/nvdl/datasets/tpcds/sparkRapidsPlugin/getGpusResources.sh' \
-e SPARK_RAPIDS_PLUGIN_JAR="/mnt/nvdl/datasets/tpcds/sparkRapidsPlugin/rapids-4-spark_2.12-0.4.0-20210112.085853-45.jar" \
-e SPARK_RAPIDS_PLUGIN_INTEGRATION_TEST_JAR="/mnt/nvdl/datasets/tpcds/tpcds/rapids-4-spark-integration-tests_2.12-0.4.0-20210112.090812-45-jar-with-dependencies.jar" \
-e SPARK_CUDF_JAR="/mnt/nvdl/datasets/tpcds/sparkRapidsPlugin/cudf-0.18-20210112.093909-33-cuda11.jar" \
-e TPCDS_HOME="/mnt/nvdl/datasets/tpcds/tpcds" \
-v /mnt/nvdl/datasets/tpcds/conf/spark-defaults.conf:/opt/spark/conf/spark-defaults.conf \
-v /mnt/nvdl/datasets/tpcds:/data \
-v /tmp:/tmp \
--network host \
--name worker \
--rm \
gcr.io/data-science-enterprise/spark-worker-slurm:3.0.1
