#!/usr/bin/env bash

gcloud builds submit --pack image=gcr.io/$PROJECT_ID/fib-service
gcloud run deploy fib-service --image gcr.io/$PROJECT_ID/fib-service --allow-unauthenticated  --service-account trace-test-service-account@$PROJECT_ID.iam.gserviceaccount.com
