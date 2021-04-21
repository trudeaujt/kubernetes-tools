screen -dm kubectl --namespace monitoring port-forward $PROMETHEUS 9090
screen -dm kubectl port-forward --namespace monitoring service/grafana 3001:80