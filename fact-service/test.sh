#!/usr/bin/env bash

for i in 1 2 3 4 5 6 7 8 9 10 11 12; do curl $FACT_SERVICE_URL/api/fact/$i; done
