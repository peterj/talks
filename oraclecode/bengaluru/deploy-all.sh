#!/bin/bash
set -e

echo -e "\nDeploying Istio..."
./deploy-istio.sh

echo -e "\nDeploying services ..."
./deploy-svc.sh

echo -e "\nDone!"