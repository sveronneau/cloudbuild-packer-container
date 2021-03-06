# Quick GCP Cloud Build CI pipeline to makes a Packer Docker artifact in GCR.IO which then builds a GCE Golden Image Disk via Packer with HashiCorp Vault binary installed.

From CLOUD SHELL or your local SDK or a Build Trigger (Check PNG file) in Cloud Build.

<b>Clone this repo:</b><br>
$ git clone https://github.com/sveronneau/cloudbuild-packer-container <br>
$ cd cloudbuild-packer-container

<b>Mandatory:</b><br>
* Make sure you have a secret setup in Secret Manager that contains the JSON value of a Service Account with Project Editor role.<br>
* Update the <i>Variables</i> to fit your requirements.

<b>Enable the Cloud Build API:</b><br>
* Go in CloudBuild UI and enable it https://console.cloud.google.com/cloud-build <br>

<b>Make sure the CloudBuil service account something@cloudbuild.gserviceaccount.com as the folowing roles:</br></b>
* Cloud Build Service Account<br>
* Compute Admin<br>
* Secret Manager Secret Accessor

<b>Launch the cloud Build job:</b><br>
$ gcloud builds submit --config cloudbuild.yaml .

# Setting up a Service Account and Secret Manager<br>
* In GCP, go to https://console.cloud.google.com/iam-admin/serviceaccounts and create a Service Account with Project Editor role.  Then create a key and download the JSON version.<br>
* in GCP, go to https://console.cloud.google.com/security/secret-manager and create a secret and upload the JSON file from the previous step for content.

# Variables<br>
<b>Dockerfile:</b><br>
FROM alpine:<i>version</i><br>
ARG PACKER_VERSION=<i>Packer version</i><br>
ARG PACKER_VERSION_SHA256SUM=<i>SHA256SUM value from https://releases.hashicorp.com/packer/x.x.x/packer_x.x.x_SHA256SUMS</i>

<b>cloudbuild.yml</b><br>
_PACKER_VERSION:<i>Same as Dockerfile</i><br>
_PACKER_VERSION_SHA256SUM: <i>Same as Dockerfile</i><br>
SECRET_MANAGER_NAME: <i>Name of the secret you created in GCP Secret Manager</i>

<b>vault.json</b><br>
 "vault": "<i>Vault version</i>"
 
<b>modules/config/vault-node-config.hcl</b><br>
project = <i>GCP Project_ID of GCP KMS</i><br>
Zone = <i>Zone of GCP KMS</i><br>
key_ring = <i>KMS Keyring</i><br>
crypto_key = <i>KMS Key</i>
