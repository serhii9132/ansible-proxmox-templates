#!/bin/bash

set -e

LOG_DIR="./logs"
TIMESTAMP=$(date +"%Y_%m_%d_%H-%M-%S")
LOG_FILE="${LOG_DIR}/ansible_${TIMESTAMP}.log"

export ANSIBLE_LOG_PATH="$LOG_FILE"

mkdir -pv "$LOG_DIR"

ansible-playbook -vvvv "$@" playbook.yaml