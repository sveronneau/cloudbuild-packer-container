storage "raft" {
  path    = "/opt/vault/data/"
  node_id = "_HOSTNAME"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
  tls_disable = true
}

seal "gcpckms" {
  credentials = "/opt/vault/config/sa-kms-unseal.json"
  project     = "tj4h-common"
  region      = "northamerica-northeast1"
  key_ring    = "vault-keyring"
  crypto_key  = "vault-key"
}

disable_mlock = true
api_addr = "http://_HOSTNAME:8200"
cluster_addr = "http://_HOSTNAME:8201"
ui = true
