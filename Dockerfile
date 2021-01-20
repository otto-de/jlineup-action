# Container image that runs your code
FROM debian:buster-slim

RUN mkdir -p /usr/share/man/man1
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && apt-get install -yf default-jre-headless firefox-esr libjpeg-progs \
    && wget --no-verbose -O jlineup-cli.jar "https://oss.sonatype.org/service/local/artifact/maven/redirect?r=releases&g=de.otto&a=jlineup-cli&v=LATEST&e=jar" \
    #&& wget --no-verbose -O /jlineup-cli.jar "https://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots&g=de.otto&a=jlineup-cli&e=jar&v=LATEST" \
    && wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    #&& wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb \
    #&& wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb \
    && apt-get install -y ./chrome.deb \
    && rm ./chrome.deb

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
