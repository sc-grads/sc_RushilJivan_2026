#!/bin/bash

TIMESTAMP=$(date)

<<<<<<< HEAD
echo "Pipeline started..."
=======
echo "Pipeline started..."
>>>>>>> b4d84c271dc7d8be538cd12a64301a76d7b17cf3

python3 scripts/process_data.py

if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Success" >> output/pipeline.log
else
    echo "[$TIMESTAMP] Failed" >> output/pipeline.log
fi

<<<<<<< HEAD
echo "Pipeline Completed..."
=======
echo "Pipeline Completed.."
>>>>>>> b4d84c271dc7d8be538cd12a64301a76d7b17cf3
