#!/bin/bash

module load r

if [[ $(wc -l < "data/qc_df.csv") -gt 1 ]]; then
    scripts/multiome-processing.R \
        filter,cluster \
        data/samplesheet.csv \
        --project-prefix $project_prefix \
        -m $my_macs_path \
        -R output/RDS-files/$project_prefix-qc-obj-list.RDS \
        --qc.sheet data/qc_df.csv
else
    echo "qc_df.csv does not have more than one line. Please fill it out and try again."
fi

