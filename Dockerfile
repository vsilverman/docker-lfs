FROM jenkins/jenkins:2.190.3-jdk11

LABEL maintainer="mark.earl.waite@gmail.com"

USER root

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  locales \
  wget

# For Git LFS
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && apt-get install -y git-lfs && git lfs install

# Enable en_US.UTF-8 locale and generate
RUN sed -i 's/. en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && ( [ -e /usr/share/locale/locale.alias ] || ln -s /etc/locale.alias /usr/share/locale/locale.alias ) \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8

USER jenkins

# COPY ref ${REF}

ENV CASC_JENKINS_CONFIG ${JENKINS_HOME}/jenkins.yaml

RUN git lfs install
