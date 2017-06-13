// Configure the matchbox provider
provider "matchbox" {
  endpoint    = "${var.matchbox_rpc_endpoint}"
  client_cert = "${file("./certs/client.crt")}"
  client_key  = "${file("./certs/client.key")}"
  ca          = "${file("./certs/ca.crt")}"
}
