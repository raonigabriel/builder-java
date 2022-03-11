# builder-java
---
A Docker image with some tools to build Java and Node projects.

The intended scenario is to this image ona CI/CD such as GitHub, Gitlab, Jenkins to build and deploy Java microservices (SpringBoot, Micronaut, Quarkus).


For now, the only arch supported is **x64**. In the future, I might add support for ARM **aarch64**.

# Features
* bash
* openssh-client
* git
* curl
* openssl
* docker-cli
* jq
* yarn
* npm
* openjdk17 (with jmods)
* maven
* gradle
* container-structure-test
* hadolint

# Usage
```sh
docker run --rm -it ghcr.io/raonigabriel/builder-java:latest
```

Optionally, bind-mount the docker socket to be able to build images:
```sh
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/raonigabriel/builder-java:latest
```

## License

Released under the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html)

## Disclaimer
* This code comes with no warranty. Use it at your own risk.
* I don't like Apple. Fuck off, fan-boys.
* I don't like left-winged snowflakes. Fuck off, code-covenant. 
* I will call my branches the old way. Long live **master**, fuck-off renaming.
