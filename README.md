# builder-java
---
A Docker image with some tools to build Java and Node projects (**runs rootless**).

The intended scenario is to this image ona CI/CD such as GitHub, Gitlab, Jenkins to build and deploy Java microservices (SpringBoot, Micronaut, Quarkus).


For now, the only arch supported is **x64**. In the future, I might add support for ARM **aarch64**.

This image purposely runs **without root access**, the user:group is **runner:runner** and its GID:PID is **1000:1000**.

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

# Adding more tools / inheriting
To install new software using the Alpine package manager (apk), you first need to change the user to **root**, install the desired packages then return the user back to **runner**.

Your Dockerfile:
```sh
FROM -it ghcr.io/raonigabriel/builder-java:latest

USER root
RUN apk --no-cache add cargo py3-pip caddy ttyd

USER runner
```


## License

Released under the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html)

## Disclaimer
* This code comes with no warranty. Use it at your own risk.
* I don't like Apple. Fuck off, fan-boys.
* I don't like left-winged snowflakes. Fuck off, code-covenant. 
* I will call my branches the old way. Long live **master**, fuck-off renaming.
