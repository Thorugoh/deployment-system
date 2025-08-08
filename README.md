#deployment-system

###Steps
- Create kind cluster
- Set up 2 namespaces (infra, app)
- Use Opentofu to manage helm releases for infra tools
- Add Jekins to run pipelines for app code
- Prometheus + Grafana auto-integrated with apps

###Commands:
- Create local Kubernetes cluster:
kind create cluster --config kind-config.yaml

- Create namespaces for infra and apps:
kubectl apply -f namespaces.yaml

- Deploy Jenkins Helm chart in infra namespace:
helm install jenkins jenkins/jenkins -n infra -f values.yaml

- Get Jenkins URL
export NODE_PORT=$(kubectl get --namespace infra -o jsonpath="{.spec.ports[0].nodePort}" services jenkins)
export NODE_IP=$(kubectl get nodes --namespace infra -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT

- Get Pods by namespace
kubectl get pods -n infra