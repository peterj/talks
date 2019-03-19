#!/bin/bash
set -e

kubectl apply -f k8s/istio-crds.yaml
kubectl apply -f k8s/istio.yaml