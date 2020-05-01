# Quick GCP Cloud Build CI pipeline to makes a Packer Docker artifact in GCR.IO which then builds a GCE Golden Image Disk via Packer with HasiCorp Vault binary installed.

From CLOUD SHELL or your local SDK or a Build Trigger in Cloud Build.

Clone this repo:<br>
$ git clone https://github.com/sveronneau/cloudbuild-packer-container

Go to the directory that has the source code for the packer Docker image:<br>
$ cd cloudbuild-packer-container

Build the Docker image via Cloud Build:<br>
$ gcloud builds submit --config cloudbuild.yaml .

# VARIABLES<br>
<b>Dockerfile:</b><br>
FROM alpine:<i>version</i>
ARG PACKER_VERSION=<i>Packer version</i><br>
ARG PACKER_VERSION_SHA256SUM=<i>SHA256SUM value from_https://releases.hashicorp.com/packer/x.x.x/packer_x.x.x_SHA256SUMS</i>

