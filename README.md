Quick GCP Cloud Build CI pipeline to make a Packer Docker Registry artifact in GCR.IO

From CLOUD SHELL or your local SDK

Clone this repo:<br>
$ git clone https://github.com/sveronneau/cloudbuild-packer-container

Go to the directory that has the source code for the packer Docker image:<br>
$ cd cloudbuild-packer-container

Build the Docker image via Cloud Build:<br>
$ gcloud builds submit --config cloudbuild.yaml .

This builds the Docker image with packer in it and stores it in GCR.io. Your next step is to go in the GCE folder and actually create a build trigger that will create the Golden Image.
