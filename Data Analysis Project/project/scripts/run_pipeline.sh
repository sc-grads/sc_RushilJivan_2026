#!/bin/bash

TIMESTAMP=$(date)

echo "Pipeline started..."

source ../venv/bin/activate

python3 process_data.py

if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Success" >> ../output/pipeline.log
else
    echo "[$TIMESTAMP] Failed" >> ../output/pipeline.log
fi

echo "Pipeline Completed..."
