# Use trixie / debian 13
FROM debian:trixie-slim

# Update packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget jq

# Download JLineup executable
RUN wget --no-verbose -O jlineup-cli.jar "https://repo1.maven.org/maven2/de/otto/jlineup-cli/4.14.2/jlineup-cli-4.14.2.jar"

# Install Chrome & Firefox
RUN apt-get install -yf firefox-esr libjpeg-progs \
    && wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    #&& wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb \
    #&& wget -O chrome.deb --no-verbose https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb \
    && apt-get install -y ./chrome.deb \
    && rm ./chrome.deb

# Install jre to execute JLineup
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -yf default-jre-headless

# Copy endpoint.sh to image
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
