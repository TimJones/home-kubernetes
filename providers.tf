// Configure the matchbox provider
provider "matchbox" {
  endpoint    = "matchbox.home.es.tnv:8081"
  client_cert = "${file("./certs/client.crt")}"
  client_key  = "${file("./certs/client.key")}"
  ca          = "${file("./certs/ca.crt")}"
}

provider "local" {
  version = "~> 1.0"
  alias = "default"
}

provider "null" {
  version = "~> 1.0"
  alias = "default"
}

provider "template" {
  version = "~> 1.0"
  alias = "default"
}

provider "tls" {
  version = "~> 1.0"
  alias = "default"
}
