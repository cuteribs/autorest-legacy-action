#!/bin/sh -l

input_file=${1}
clear_output_folder=${2-false}
override_client_name=${3-ApiClient}
namespace=${4-AutoRest}
csharp=${5-false}
typescript=${6-false}
python=${7-false}

pwd
ls /github/home/.autorest/@autorestcore@3.5.1/nodemodules/@autorest/core/dist/resources/
exit 0
export PATH=$PATH:/root/.dotnet
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

