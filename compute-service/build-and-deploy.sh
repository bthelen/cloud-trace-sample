#!/usr/bin/env bash

mvn clean install
gcloud builds submit --pack image=gcr.io/$PROJECT_ID/compute-service
gcloud run deploy compute-service --image gcr.io/$PROJECT_ID/compute-service --allow-unauthenticated --service-account trace-test-service-account@$PROJECT_ID.iam.gserviceaccount.com
