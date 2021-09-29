#!/bin/bash
export PATH=/usr/local/bin/anaconda3/bin:$PATH
source activate pyspark_h3_v2

export PYSPARK_PYTHON=/usr/local/bin/anaconda3/bin/python3
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser"
export SPARK_MAJOR_VERSION=2

/data/opt/spark/spark-2.4.2-bin-Spectrum-Spark_scala2.11/bin/pyspark \
--master yarn \
--num-executors 30 \
--driver-memory 10G \
--executor-cores 4 \
--executor-memory 10G \
--jars bdt-2.3.0-2.4.5-2.11.jar,sqljdbc42.jar \
--conf spark.ui.enabled=true \
--conf spark.ui.showConsoleProgress=true \
--conf spark.kryoserializer.buffer.max=2000mb \
--conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
--conf spark.driver.maxResultSize=10G \
--conf spark.sql.shuffle.partitions=300 \
--conf spark.kryo.registrationRequired=false \
--conf spark.submit.pyFiles="bdt-2.3.0-py3.6.egg" \
--conf spark.pyspark.python=/usr/local/bin/anaconda3/bin/python3 \
--conf spark.pyspark.driver.python=jupyter