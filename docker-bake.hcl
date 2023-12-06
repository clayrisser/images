variable "ALPINE_VERSION" {}
variable "DEBIAN_VERSION" {}
variable "KANISTER_VERSION" {}
variable "KEYCLOAK_VERSION" {}
variable "KOPIA_VERSION" {}
variable "KUBECTL_VERSION" {}
variable "NODEJS_VERSION" {}
variable "OPENJDK_VERSION" {}
variable "OPENLDAP_VERSION" {}
variable "PERCONA_VERSION" {}
variable "POSTGRES_VERSION" {}
variable "PYTHON_VERSION" {}
variable "REGISTRY" {}

variable "TAG" {}

group "default" {
  targets = [
    "base",
    "base-debian",
    "debian-build",
    "debian-build-python",
    "debian-nodejs",
    "docker",
    "docker-nodejs",
    "kanukopia",
    "kanukopia-openldap",
    "keycloak",
    "kube-commands",
    "kube-commands-aws",
    "kube-commands-psql",
    "kube-commands-terraform",
    "kube-commands-terraform-aws",
    "loki",
    "nodejs",
    "openjdk",
    "podman",
    "postgres-age",
    "terraform",
  ]
}

target "base" {
  context    = "base"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/base:${TAG}",
    "${REGISTRY}/base:${ALPINE_VERSION}",
  ]
  args = {
    ALPINE_VERSION = "${ALPINE_VERSION}"
  }
}

target "base-debian" {
  context    = "base-debian"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/base-debian:${TAG}",
    "${REGISTRY}/base-debian:${DEBIAN_VERSION}",
  ]
  args = {
    DEBIAN_VERSION = "${DEBIAN_VERSION}"
  }
}

target "debian-build" {
  context    = "debian-build"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-build:${TAG}",
    "${REGISTRY}/debian-build:${DEBIAN_VERSION}",
  ]
  args = {
    DEBIAN_VERSION = "${DEBIAN_VERSION}"
  }
}

target "debian-build-python" {
  context    = "debian-build-python"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-build-python:${TAG}",
    "${REGISTRY}/debian-build-python:${PYTHON_VERSION}-${DEBIAN_VERSION}",
  ]
  args = {
    DEBIAN_VERSION = "${DEBIAN_VERSION}"
    PYTHON_VERSION = "${PYTHON_VERSION}"
  }
}

target "debian-nodejs" {
  context    = "debian-nodejs"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-node:${TAG}",
    "${REGISTRY}/debian-node:${NODEJS_VERSION}-${DEBIAN_VERSION}",
  ]
  args = {
    DEBIAN_VERSION = "${DEBIAN_VERSION}"
    NODEJS_VERSION = "${NODEJS_VERSION}"
  }
}

target "docker" {
  context    = "docker"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/docker:${TAG}",
    "${REGISTRY}/docker:${ALPINE_VERSION}",
  ]
  contexts = {
    base = "target:base"
  }
}

target "docker-nodejs" {
  context    = "docker-nodejs"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/docker-node:${TAG}",
    "${REGISTRY}/docker-node:${NODEJS_VERSION}-${ALPINE_VERSION}",
  ]
  contexts = {
    nodejs = "target:nodejs"
  }
}

target "kanukopia" {
  context    = "kanukopia"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kanukopia:${TAG}",
    "${REGISTRY}/kanukopia:${KANISTER_VERSION}",
    "${REGISTRY}/kanukopia:${KANISTER_VERSION}-${DEBIAN_VERSION}",
  ]
  args = {
    DEBIAN_VERSION   = "${DEBIAN_VERSION}"
    KANISTER_VERSION = "${KANISTER_VERSION}"
    KOPIA_VERSION    = "${KOPIA_VERSION}"
    KUBECTL_VERSION  = "${KUBECTL_VERSION}"
  }
}

target "kanukopia-openldap" {
  context    = "kanukopia-openldap"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kanukopia-openldap:${TAG}",
    "${REGISTRY}/kanukopia-openldap:${OPENLDAP_VERSION}",
  ]
  args = {
    OPENLDAP_VERSION = "${OPENLDAP_VERSION}"
  }
}

target "keycloak" {
  context    = "keycloak"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/keycloak:${TAG}",
    "${REGISTRY}/keycloak:${KEYCLOAK_VERSION}",
  ]
  args = {
    KEYCLOAK_VERSION = "${KEYCLOAK_VERSION}"
  }
}

target "kube-commands" {
  context    = "kube-commands"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands:${TAG}",
    "${REGISTRY}/kube-commands:${ALPINE_VERSION}",
  ]
  args = {
    ALPINE_VERSION = "${ALPINE_VERSION}"
  }
}

target "kube-commands-aws" {
  context    = "kube-commands-aws"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands-aws:${TAG}",
    "${REGISTRY}/kube-commands-aws:${ALPINE_VERSION}",
  ]
  contexts = {
    kube-commands = "target:kube-commands"
  }
}

target "kube-commands-psql" {
  context    = "kube-commands-psql"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands-psql:${TAG}",
    "${REGISTRY}/kube-commands-psql:${ALPINE_VERSION}",
  ]
  contexts = {
    kube-commands = "target:kube-commands"
  }
}

target "kube-commands-terraform" {
  context    = "kube-commands-terraform"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands-terraform:${TAG}",
    "${REGISTRY}/kube-commands-terraform:${ALPINE_VERSION}",
  ]
  contexts = {
    kube-commands = "target:kube-commands"
  }
}

target "kube-commands-terraform-aws" {
  context    = "kube-commands-terraform-aws"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands-terraform-aws:${TAG}",
    "${REGISTRY}/kube-commands-terraform-aws:${ALPINE_VERSION}",
  ]
  contexts = {
    kube-commands-aws = "target:kube-commands-aws"
  }
}

target "loki" {
  context    = "loki"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/loki:${TAG}",
    "${REGISTRY}/loki:${NODEJS_VERSION}-${DEBIAN_VERSION}",
  ]
  contexts = {
    debian-nodejs = "target:debian-nodejs"
  }
}

target "nodejs" {
  context    = "nodejs"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/node:${TAG}",
    "${REGISTRY}/node:${NODEJS_VERSION}-${ALPINE_VERSION}",
  ]
  args = {
    ALPINE_VERSION = "${ALPINE_VERSION}"
    NODEJS_VERSION = "${NODEJS_VERSION}"
  }
}

target "openjdk" {
  context    = "openjdk"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/openjdk:${TAG}",
    "${REGISTRY}/openjdk:${OPENJDK_VERSION}-${DEBIAN_VERSION}",
  ]
  contexts = {
    base-debian = "target:base-debian"
  }
  args = {
    OPENJDK_VERSION = "${OPENJDK_VERSION}"
  }
}

target "podman" {
  context    = "podman"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/podman:${TAG}",
    "${REGISTRY}/podman:${ALPINE_VERSION}",
  ]
  contexts = {
    base = "target:base"
  }
}

target "postgres-age" {
  context    = "postgres-age"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/postgres-age:${TAG}",
    "${REGISTRY}/postgres-age:${PERCONA_VERSION}-ppg${POSTGRES_VERSION}",
  ]
  args = {
    PERCONA_VERSION  = "${PERCONA_VERSION}"
    POSTGRES_VERSION = "${POSTGRES_VERSION}"
  }
}

target "terraform" {
  context    = "terraform"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/terraform:${TAG}",
    "${REGISTRY}/terraform:${ALPINE_VERSION}",
  ]
  contexts = {
    base = "target:base"
  }
}
