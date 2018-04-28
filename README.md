# datalab-spark

A Docker image based on Google Cloud Datalab that includes Spark. The image can be used to run Spark jobs in local mode through PySpark.

## Contents

- Cloud Datalab
    - pyspark 2.3.0 added
- OpenJDK 8
- Spark 2.3.0

## Cloud Datalab Notebook with PySpark in local mode

To start the cloud datalab container execute the following command:

```
$ docker run --rm -p 8080:8080 elopezdelara/datalab-spark
```