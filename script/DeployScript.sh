#!/usr/bin/env bash

mvn -f ../pom.xml clean install

mvn -f ../pom.xml compile exec:java \
    -Dstart-class=com.rathna.JdbcParallelRead \
    -Dexec.args="--project=primary-272722 --runner=DataflowRunner \
--stagingLocation=gs://primary-272722/staging/ \
--tempLocation=gs://primary-272722/temp/ \
--jobName=SQLConnector --network=global/networks/vpc-primary --region=us-central1 \
--serviceAccount=dataflow-sa-primary@primary-272722.iam.gserviceaccount.com \
--subnetwork=https://www.googleapis.com/compute/v1/projects/primary-272722/regions/us-central1/subnetworks/vpc-primary-central \
--usePublicIps=false --numWorkers=1 --maxNumWorkers=1 --autoscalingAlgorithm=NONE --workerMachineType=n1-standard-1"
