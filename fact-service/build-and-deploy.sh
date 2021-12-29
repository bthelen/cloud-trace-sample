#!/usr/bin/env bash

mvn clean install
gcloud builds submit --pack image=gcr.io/$PROJECT_ID/fact-service
gcloud run deploy fact-service --image gcr.io/$PROJECT_ID/fact-service --allow-unauthenticated --service-account trace-test-service-account@$PROJECT_ID.iam.gserviceaccount.com
