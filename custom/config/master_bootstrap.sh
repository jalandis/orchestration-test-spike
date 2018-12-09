#!/usr/bin/env bash

################################################################################
# Custom Master Setup
################################################################################

sudo yum install -y python python-pip libffi-devel python-devel openssl-devel

cd /opt/orka/custom/deployer
virtualenv .venv
source .venv/bin/activate
python -m pip install -e .

python setup.py sdist bdist_wheel
twine upload --repository-url https://dev-nexus.theinstitutes.org/repository/ti-python/ dist/*

# Warning: This script hangs on install in the Centos VM.  No known cause.
