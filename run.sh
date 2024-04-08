#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <script_name>"
    exit 1
fi

script_name="$1"

python3 -m venv venv
source venv/bin/activate
pip install Flask flask-mysqldb botocore boto3
python3 "$script_name"