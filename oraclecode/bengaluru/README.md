# Demo

Run `source _common.sh` and then use `grafana`, `jaeger` and `servicegraph` to open the pages.

kubectl scale deploy city-svc --replicas=0

kubectl scale deploy city-svc --replicas=3

# Introduce the delay to temperature service

cat temperature-delay.yaml
kubectl apply -f temperature-delay.yaml

# Reset it back

kubectl apply -f temperature-vs.yaml

# Introduce an abort

cat city-abort.yaml
kubectl apply -f city-abort.yaml

# Reset it back

kubectl apply -f city-vs.yaml

# Retries and timeouts

kubectl set env deploy temperature-svc SLEEP_SECONDS=2
cat temperature-retries.yaml
kubectl apply -f temperature-retries.yaml

## Reset all

kubectl set env deploy temperature-svc SLEEP_SECONDS=0
kubectl apply -f city-vs.yaml
kubectl apply -f temperature-vs.yaml
