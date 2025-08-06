#deployment-system

Steps
- Create kind cluster
- Set up 2 namespaces (infra, app)
- Use Opentofu to manage helm releases for infra tools
- Add Jekins to run pipelines for app code
- Prometheus + Grafana auto-integrated with apps
