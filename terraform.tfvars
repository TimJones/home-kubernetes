matchbox_http_endpoint = "http://host-01.admin.home.es.tnv:8080"
matchbox_rpc_endpoint = "host-01.admin.home.es.tnv:8081"
ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZoLxw9Vv0Semb6Gyp6amdYePMaXVU19E84+V1j5xKh7zwtNpB9mW4GlyzStozuUsAoCWoIpsfB7fvAdHmDMNhK880zkSxlxiZElK9P3LR3K+l5FMqL33xY5iYzqsUSJ8fb4uepm/3a6ssjdg+5Ty2dtdBFk2dVit3KwaQWmDejsN/L/qEpUTtGyyRdvMzlkTrLMkSu6yc3wOndnt0pTPh/CooVECR878E5d4QMn3tvP0odALcxCt2HsZOTGnu+Xn9Q+6RrpfeCPQrj4JRPdO1L3cZnVa1Yc1bBiT+45QbTwVKVOmVF87gNj9nGfB6e66MqJU5A6ye4nW+vZF2sFhz"

cluster_name = "home"
container_linux_version = "1409.5.0"
container_linux_channel = "stable"

# Machines
controller_names = ["node-01"]
controller_macs = ["02:00:0d:84:1f:93"]
controller_domains = ["node-01.admin.home.es.tnv"]
worker_names = ["node-02", "node-03"]
worker_macs = ["02:00:0d:84:1f:94", "02:00:0d:84:1f:95"]
worker_domains = ["node-02.admin.home.es.tnv", "node-03.admin.home.es.tnv"]

# Bootkube
k8s_domain_name = "node-01.admin.home.es.tnv"
asset_dir = "bootkube-assets"

# Optional
# container_linux_oem = ""
experimental_self_hosted_etcd = "true"
