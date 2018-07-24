FROM gcr.io/cloud-datalab/datalab:latest
LABEL maintainer="Enrique Lopez de Lara <elopezdelara@expertsum.com>"

ENV BASE_DIR                /usr/local
ENV SPARK_HOME              ${BASE_DIR}/spark
ENV SPARK_VERSION           2.3.1
ENV PYSPARK_DRIVER_PYTHON   ipython
ENV PATH                    ${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}

# Python Packages
RUN conda update -n root conda -y --quiet && \
    conda install -n py3env pyspark=${SPARK_VERSION} pandas-datareader -y --quiet && \
    conda install -n py3env -c conda-forge seaborn -y --quiet && \
    conda clean -tipsy

# OpenJDK + other dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y openjdk-8-jdk-headless procps fonts-liberation && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Spark
RUN curl -s https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz | tar xz -C /tmp && \
    mv /tmp/spark-${SPARK_VERSION}-bin-hadoop2.7 ${SPARK_HOME}

# Google Cloud Storage Connector
RUN wget -q https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar -P ${SPARK_HOME}/jars
COPY ./spark/spark-defaults.conf ${SPARK_HOME}/conf