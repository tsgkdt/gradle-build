FROM openjdk:7-jdk-alpine

LABEL version="0.1"
LABEL description="build for java project"

ENV GRADLE_VERSION=3.4 \
    MAVEN_HOME=/opt/maven 

RUN set -ex \
      && apk --no-cache add --virtual build-dependencies wget \
      && cd /tmp \
      && mkdir -p /opt/gradle \
      && wget --quiet https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
      && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle \
      && ln -s /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle \
      && rm -rf /tmp/* \
      && apk del --purge build-dependencies


CMD ["gradle", "-v"]
