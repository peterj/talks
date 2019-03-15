#!/bin/bash
export GRAFANA_POD=$(kubectl get pods --namespace istio-system -l "app=grafana" -o jsonpath="{.items[0].metadata.name}")
export JAEGER_POD=$(kubectl get pod -n istio-system -l app=jaeger -o jsonpath='{.items[0].metadata.name}')

export SERVICEGRAPH_POD=$(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}')

alias grafana="kubectl --namespace istio-system port-forward $GRAFANA_POD 3000:3000 & open http://localhost:3000"
alias jaeger="kubectl --namespace istio-system port-forward $JAEGER_POD 16686:16686 & open http://localhost:16686"
alias servicegraph="kubectl --namespace istio-system port-forward $SERVICEGRAPH_POD 8088:8088 & open http://localhost:8088/dotviz"