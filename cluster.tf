// Self-hosted Kubernetes cluster
module "cluster" {
  source = "git::https://github.com/poseidon/typhoon//bare-metal/container-linux/kubernetes?ref=v1.9.2"

  providers = {
    local = "local.default"
    null = "null.default"
    template = "template.default"
    tls = "tls.default"
  }

  # install
  matchbox_http_endpoint  = "http://matchbox.home.es.tnv:8080"
  container_linux_channel = "stable"
  container_linux_version = "1576.5.0"
  ssh_authorized_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2W59vf7yI42TbphjU5U2N6YMioz02n6TZlO5LKLEyt7Fdp12jY6tby22sg1w/x/fsQrbjkBTfT2MBqsGz2lVquVIABtno3FzBgOIXkkk47v7B9SjYF+G4caJyfsBCkV20Z9PVQNnvhEL/6NVAaJN44SvKvADUh/dusQDQ7xpcQ+E2EdIs2qrCZJoc/EM590MfDKFic+rQaWXqHqYOLs6wL3k8w9c32bht6t3aDgG6Y8HItt3b3TfCAETYmmDO2bivWBDPeTgsGL/AknFbuUcFE+FNVIboovMt9WWCsYeHXAg+uC4vIxOqGRA2buGsM8qdGsJEu5mnH5aZlIYuTx2n"

  # cluster
  cluster_name    = "home"
  k8s_domain_name = "api.k8s.home.es.tnv"

  # machines
  controller_names   = ["node-01"]
  controller_macs    = ["02:00:c6:3b:b2:bb"]
  controller_domains = ["node-01.home.es.tnv"]
  worker_names = [
    "node-02",
    "node-03",
  ]
  worker_macs = [
    "02:00:c6:3b:b2:bc",
    "02:00:c6:3b:b2:bd",
  ]
  worker_domains = [
    "node-02.home.es.tnv",
    "node-03.home.es.tnv",
  ]

  # output assets dir
  asset_dir = "./assets"

  # optional
  cached_install = false
  pod_cidr = "192.168.192.0/18"
  service_cidr = "192.168.32.0/20"
  cluster_domain_suffix = "k8s.home.es.tnv"
  kernel_args = [
    "kvm-intel.nested=1",
  ]

  # custom... may break
  controller_networkds = [ "${file("network.yaml.tmpl")}" ]
  worker_networkds = [
    "${file("network.yaml.tmpl")}",
    "${file("network.yaml.tmpl")}",
  ]
}
