variable "ALPINE_VERSION" {}
variable "DEBIAN_VERSION" {}
variable "KEYCLOAK_VERSION" {}
variable "NODEJS_VERSION" {}
variable "OPENJDK_VERSION" {}
variable "OPENLDAP_VERSION" {}
variable "PERCONA_VERSION" {}
variable "POSTGRES_VERSION" {}
variable "PYTHON_VERSION" {}
variable "REGISTRY" {}

variable "MAJOR" {}
variable "MINOR" {}
variable "PATCH" {}
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
    "${REGISTRY}/base:latest",
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
    "${REGISTRY}/base-debian:latest",
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
    "${REGISTRY}/debian-build:latest",
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
    "${REGISTRY}/debian-build-python:latest",
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
    "${REGISTRY}/debian-node:latest",
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
    "${REGISTRY}/docker:latest",
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
    "${REGISTRY}/docker-node:latest",
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
    "${REGISTRY}/kanukopia:latest",
    "${REGISTRY}/kanukopia:${DEBIAN_VERSION}",
  ]
  contexts = {
    base-debian = "target:base-debian"
  }
}

target "kanukopia-openldap" {
  context    = "kanukopia-openldap"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kanukopia-openldap:latest",
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
    "${REGISTRY}/keycloak:latest",
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
    "${REGISTRY}/kube-commands:latest",
    "${REGISTRY}/kube-commands:${ALPINE_VERSION}",
  ]
  contexts = {
    base = "target:base"
  }
}

target "kube-commands-aws" {
  context    = "kube-commands-aws"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands-aws:latest",
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
    "${REGISTRY}/kube-commands-psql:latest",
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
    "${REGISTRY}/kube-commands-terraform:latest",
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
    "${REGISTRY}/kube-commands-terraform-aws:latest",
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
    "${REGISTRY}/loki:latest",
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
    "${REGISTRY}/node:latest",
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
    "${REGISTRY}/openjdk:latest",
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
    "${REGISTRY}/podman:latest",
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
    "${REGISTRY}/postgres-age:latest",
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
    "${REGISTRY}/terraform:latest",
    "${REGISTRY}/terraform:${ALPINE_VERSION}",
  ]
  contexts = {
    base = "target:base"
  }
}
