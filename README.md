# Installing ECK with Terraform on GCP

On this page you will find a how to spin up ECK using terraform. The main idea is to have a Kubernetes cluster up and running with a ECK quickstart running only 3 commands.

## Demo
https://user-images.githubusercontent.com/16880741/164702566-aa2b0c7b-d92f-43bf-b41a-6929432ce1e3.mp4

## Features
_Every feature will be deployed via terraform_

- Install GKE (Google Kubernetes Enginee) cluster 
- It will contain 1 node pool with 3 nodes (One in each zone) running on region **europe-west1**
- It contains a helm provider that will be responsible to install the ECK operator
- Elasticsearch cluster with 3 nodes
- One Kibana instance

## Requirements
Before starting you should have the following commands installed:

- [terraform](https://www.terraform.io/downloads)
- [gcloud](https://cloud.google.com/sdk/docs/install)

## Let's play
As you probably know, terraform is an infrastructure as code tool, which means we can describe our infrastructure desire into a file and apply it via terraform.
Here, we are going to spin up a GKE cluster with 3 nodes running on europe-west1 region, the machines we are going to use is **e2-standard-4** which will give us 4vCPU nad 16GB of memory in each node.

First, you have to authenticate into Google Cloud console, to so run the following command,
`gcloud auth application-default login`

Once you are logged it, you should export 2 variables, the Kubernetes config path AND the Google project you are going to use
`export KUBE_CONFIG_PATH=~/.kube/config && export GOOGLE_PROJECT=elastic-support-k8s-dev`

Now, you can run
`terraform init`

It will load the providers and configuration. Right after that, you should run
`terraform plan`

It will show you everything that will be created by terraform, take a moment to check this output.
Once you are ready, you just need to run:
`terraform apply -parallelism=1`

It will apply your changes in sequence.

## Wrapping up
Now, to clean up everything you just need to run
`terraform destroy`
