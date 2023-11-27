variable "REGISTRY" {
  default = ""
}

variable "TAG" {
  default = ""
}

variable "MAJOR" {
  default = ""
}

variable "MINOR" {
  default = ""
}

variable "PATCH" {
  default = ""
}

group "default" {
  targets = [
    "base",
    "base-debian",
    "debian-build",
    "debian-build-python",
    "debian-node",
    "docker",
    "docker-node",
    // "java",
    "kando-openldap",
    "keycloak",
    "kube-commands",
    "kube-commands-aws",
    "kube-commands-psql",
    "kube-commands-terraform",
    "kube-commands-terraform-aws",
    "loki",
    "node",
    "podman",
    // "postgres-age",
    "terraform"
  ]
}

target "base" {
  context    = "base"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/base:${TAG}",
    "${REGISTRY}/base:${MAJOR}",
    "${REGISTRY}/base:${MINOR}",
    "${REGISTRY}/base:${PATCH}",
  ]
}

target "base-debian" {
  context    = "base"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/base-debian:${TAG}",
    "${REGISTRY}/base-debian:${MAJOR}",
    "${REGISTRY}/base-debian:${MINOR}",
    "${REGISTRY}/base-debian:${PATCH}",
  ]
}

target "debian-build" {
  context    = "debian-build"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-build:${TAG}",
    "${REGISTRY}/debian-build:${MAJOR}",
    "${REGISTRY}/debian-build:${MINOR}",
    "${REGISTRY}/debian-build:${PATCH}",
  ]
}

target "debian-build-python" {
  context    = "debian-build-python"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-build-python:${TAG}",
    "${REGISTRY}/debian-build-python:${MAJOR}",
    "${REGISTRY}/debian-build-python:${MINOR}",
    "${REGISTRY}/debian-build-python:${PATCH}",
  ]
}

target "debian-node" {
  context    = "debian-node"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/debian-node:${TAG}",
    "${REGISTRY}/debian-node:${MAJOR}",
    "${REGISTRY}/debian-node:${MINOR}",
    "${REGISTRY}/debian-node:${PATCH}",
  ]
}

target "docker" {
  context    = "docker"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/docker:${TAG}",
    "${REGISTRY}/docker:${MAJOR}",
    "${REGISTRY}/docker:${MINOR}",
    "${REGISTRY}/docker:${PATCH}",
  ]
  contexts = {
    base = "target:base"
  }
}

target "docker-node" {
  context    = "docker-node"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/docker-node:${TAG}",
    "${REGISTRY}/docker-node:${MAJOR}",
    "${REGISTRY}/docker-node:${MINOR}",
    "${REGISTRY}/docker-node:${PATCH}",
  ]
  contexts = {
    node = "target:node"
  }
}

target "java" {
  context    = "java"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/java:${TAG}",
    "${REGISTRY}/java:${MAJOR}",
    "${REGISTRY}/java:${MINOR}",
    "${REGISTRY}/java:${PATCH}",
  ]
  contexts = {
    base-debian = "target:base-debian"
  }
}

target "kando-openldap" {
  context    = "kando-openldap"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kando-openldap:${TAG}",
    "${REGISTRY}/kando-openldap:${MAJOR}",
    "${REGISTRY}/kando-openldap:${MINOR}",
    "${REGISTRY}/kando-openldap:${PATCH}",
  ]
}

target "keycloak" {
  context    = "keycloak"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/keycloak:${TAG}",
    "${REGISTRY}/keycloak:${MAJOR}",
    "${REGISTRY}/keycloak:${MINOR}",
    "${REGISTRY}/keycloak:${PATCH}",
  ]
}

target "kube-commands" {
  context    = "kube-commands"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/kube-commands:${TAG}",
    "${REGISTRY}/kube-commands:${MAJOR}",
    "${REGISTRY}/kube-commands:${MINOR}",
    "${REGISTRY}/kube-commands:${PATCH}",
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
    "${REGISTRY}/kube-commands-aws:${TAG}",
    "${REGISTRY}/kube-commands-aws:${MAJOR}",
    "${REGISTRY}/kube-commands-aws:${MINOR}",
    "${REGISTRY}/kube-commands-aws:${PATCH}",
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
    "${REGISTRY}/kube-commands-psql:${MAJOR}",
    "${REGISTRY}/kube-commands-psql:${MINOR}",
    "${REGISTRY}/kube-commands-psql:${PATCH}",
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
    "${REGISTRY}/kube-commands-terraform:${MAJOR}",
    "${REGISTRY}/kube-commands-terraform:${MINOR}",
    "${REGISTRY}/kube-commands-terraform:${PATCH}",
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
    "${REGISTRY}/kube-commands-terraform-aws:${MAJOR}",
    "${REGISTRY}/kube-commands-terraform-aws:${MINOR}",
    "${REGISTRY}/kube-commands-terraform-aws:${PATCH}",
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
    "${REGISTRY}/loki:${MAJOR}",
    "${REGISTRY}/loki:${MINOR}",
    "${REGISTRY}/loki:${PATCH}",
  ]
}

target "node" {
  context    = "node"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/node:${TAG}",
    "${REGISTRY}/node:${MAJOR}",
    "${REGISTRY}/node:${MINOR}",
    "${REGISTRY}/node:${PATCH}",
  ]
}

target "podman" {
  context    = "podman"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/podman:${TAG}",
    "${REGISTRY}/podman:${MAJOR}",
    "${REGISTRY}/podman:${MINOR}",
    "${REGISTRY}/podman:${PATCH}",
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
    "${REGISTRY}/postgres-age:${MAJOR}",
    "${REGISTRY}/postgres-age:${MINOR}",
    "${REGISTRY}/postgres-age:${PATCH}",
  ]
}

target "terraform" {
  context    = "terraform"
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  tags = [
    "${REGISTRY}/terraform:${TAG}",
    "${REGISTRY}/terraform:${MAJOR}",
    "${REGISTRY}/terraform:${MINOR}",
    "${REGISTRY}/terraform:${PATCH}",
  ]
  contexts = {
    base = "target:base"
  }
}
