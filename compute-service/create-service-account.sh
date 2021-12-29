#!/usr/bin/env bash

gcloud iam service-accounts create trace-test-service-account --description "Service Account for Cloud Trace and Cloud Run test" --display-name "trace-test-service-account"
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:trace-test-service-account@$PROJECT_ID.iam.gserviceaccount.com" --role="roles/cloudtrace.agent"
