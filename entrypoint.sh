#!/bin/sh -l

input_file=${1}
clear_output_folder=${2-false}
override_client_name=${3-}
namespace=${4-}
csharp=${5-false}
typescript=${6-false}
python=${7-false}

# autorest && \
#   --input-file:$input_file && \
#   --output-folder:/github/workspace/output && \
#   --clear-output-folder:$clear_output_folder && \
#   --override-client-name:$override_client_name && \
#   --namespace:$namespace && \
#   --csharp:$csharp && \
#   --typescript:$typescript && \
#   --python:$python && \
#   --legacy && \
#   --version:3.5

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT