#!/bin/sh -l

input_file=${1}
output_folder=${2-generated}
clear_output_folder=${3-false}
override_client_name=${4-}
namespace=${5-}
csharp=${6-false}
typescript=${7-false}
python=${8-false}

autorest && \
  --input-file:$input_file && \
  --output-folder:$output_folder && \
  --clear-output-folder:$clear_output_folder && \
  --override-client-name:$override_client_name && \
  --namespace:$namespace && \
  --csharp:$csharp && \
  --typescript:$typescript && \
  --python:$python && \
  --legacy
  --v3
  --version:3.5
  --use:@cuteribs/autorest.csharp@2.3.0-2