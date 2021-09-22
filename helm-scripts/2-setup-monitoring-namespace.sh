helm install prometheus prometheus-community/prometheus --create-namespace --namespace monitoring  --set server.persistentVolume.size=10Gi,server.retention=30d &&
helm install grafana grafana/grafana --set persistence.enabled=true,persistence.type=pvc,persistence.size=10Gi --namespace=monitoring &&
export PROMETHEUS=$(kubectl get pods --namespace monitoring -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}") &&
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode | ts “Grafana Password: “