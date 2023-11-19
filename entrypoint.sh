#!/bin/sh -l

input_file=${1}
clear_output_folder=${2-false}
override_client_name=${3-ApiClient}
namespace=${4-AutoRest}
csharp=${5-false}
typescript=${6-false}
python=${7-false}

mv *.md /github/home/.autorest/@autorest_core@3.5.1/node_modules/@autorest/core/dist/resources/

export PATH=$PATH:/github/home/.autorest/.dotnet
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

autorest \
  --legacy \
  --version:3.5 \
  --input-file:$input_file \
  --output-folder:/github/workspace/output \
  --clear-output-folder:$clear_output_folder \
  --override-client-name:$override_client_name \
  --namespace:$namespace \
  --csharp:$csharp \
  --typescript:$typescript \
  --python:$python \
  --use:@cuteribs/autorest.csharp@latest \
  --use:@cuteribs/autorest.python@latest \
  --use:@cuteribs/autorest.typescript@latest \
  --verbose

