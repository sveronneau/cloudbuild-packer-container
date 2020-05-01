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
ARG PACKER_VERSION_SHA256SUM=<i>SHA256SUM value from https://releases.hashicorp.com/packer/x.x.x/packer_x.x.x_SHA256SUMS</i>

substitutions:
  _PACKER_VERSION: 1.5.5
  _PACKER_VERSION_SHA256SUM: 07f28a1a033f4bcd378a109ec1df6742ac604e7b122d0316d2cddb3c2f6c24d1

