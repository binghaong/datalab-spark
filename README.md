# datalab-spark

A Docker image based on Google Cloud Datalab that includes Spark. The image can be used to run Spark jobs in local mode through PySpark.

## Contents

- Added libraries (Python):
    - pyspark 2.3.1
    - pandas-datareader 0.6.0
    - seaborn 0.9.0
- OpenJDK 8
- Spark 2.3.1
- Google Cloud Storage Connector

## Build the image on Google Cloud Container Builder

```
$ gcloud auth login
$ gcloud config set project [PROJECT_ID]
$ gcloud container builds submit --tag gcr.io/[PROJECT_ID]/datalab-spark .
```

## Datalab on a local machine

To start Cloud Datalab on a local machine execute the following command:

```
$ docker run --rm -p 8080:8080 gcr.io/[PROJECT_ID]/datalab-spark
```

## Datalab on the Google Cloud

To start Cloud Datalab on the Google Cloud execute the following command:

```
$ datalab create --image-name gcr.io/[PROJECT_ID]/datalab-spark \
                 --machine-type n1-standard-2 --disk-size-gb 20 datalab-1
```