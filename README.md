# Quick GCP Cloud Build CI pipeline to makes a Packer Docker Registry artifact in GCR.IO then builds a GCE Golden Image via Packer with Vault binary installed.

From CLOUD SHELL or your local SDK

Clone this repo:<br>
$ git clone https://github.com/sveronneau/cloudbuild-packer-container

Go to the directory that has the source code for the packer Docker image:<br>
$ cd cloudbuild-packer-container

Build the Docker image via Cloud Build:<br>
$ gcloud builds submit --config cloudbuild.yaml .

# VARIABLES<br>
<b>Dockerfile:</b><br>
ARG PACKER_VERSION=<i>Packer version</i><br>
ARG PACKER_VERSION_SHA256SUM=<i>SHA256SUM value from_https://releases.hashicorp.com/packer/x.x.x/packer_x.x.x_SHA256SUMS

