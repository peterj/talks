#!/bin/bash
set -e

# Services
kubectl apply -f <(istioctl kube-inject -f k8s/city.yaml)
kubectl apply -f <(istioctl kube-inject -f k8s/temperature.yaml)
kubectl apply -f <(istioctl kube-inject -f k8s/weather.yaml)

# Istio resources
kubectl apply -f istio/gateway.yaml
kubectl apply -f istio/city-vs.yaml
kubectl apply -f istio/temperature-vs.yaml
kubectl apply -f istio/weather-vs.yaml