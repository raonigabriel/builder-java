FROM alpine:3.15.0

RUN apk --no-cache add \
# Installs common tools
    bash=5.1.16-r0 openssh-client-default=8.8_p1-r1 git=2.34.1-r0 curl=7.80.0-r0 openssl=1.1.1l-r8 docker-cli=20.10.11-r0 jq=1.6-r1 \
# Installs Node tools
    yarn=1.22.17-r0 npm=8.1.3-r0 \
# Installs Java tools
    openjdk17-jmods=17.0.2_p8-r0 maven=3.8.3-r0 gradle=7.2-r0 && \
# Installs container-structure-test
    curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && \
    chmod +x container-structure-test-linux-amd64 && \ 
    mv container-structure-test-linux-amd64 /bin/container-structure-test && \
# Installs hadolint
    curl -LO  https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 && \
    chmod +x hadolint-Linux-x86_64 && \ 
    mv hadolint-Linux-x86_64 /bin/hadolint && \
# Add group and user
   addgroup runner && adduser -G runner -s /bin/bash -D runner && chmod g+rw /home && \
# Configure a nice terminal
    echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /home/runner/.bashrc && \
# Fake poweroff (stops the container from the inside by sending SIGHUP to PID 1)
    echo "alias poweroff='kill -1 1'" >> /home/runner/.bashrc

WORKDIR /home/runner
USER runner
ENTRYPOINT ["/bin/bash"]
