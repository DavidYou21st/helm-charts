<!--- app-name: blog-chart -->

# blog-chart

## David You. Helm Repo

## Introduction

Helm Charts provided by David You. 

This chart bootstraps a [blog-chart Open Source](https://github.com/DavidYou21st/charts) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.23+
- Helm 3.8.0+

## Installing the Chart

To install the chart with the release name `my-blog`:

```bash
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm repo add davidyou https://github.com/davidYou21st/charts/
$ helm repo update
$ helm dep build
$ helm dependency update
$ helm pull davidyou/blog-chart --untar
$ helm install my-blog ./blog-chart
```

These commands deploy blog-chart Open Source on the Kubernetes cluster in the default configuration.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-blog` deployment:

```bash
$ helm delete my-blog
```