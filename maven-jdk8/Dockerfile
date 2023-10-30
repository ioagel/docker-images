FROM eclipse-temurin:8-jdk-jammy
ARG MAVEN_VERSION
ENV M2_HOME=/opt/maven \
    MAVEN_HOME=/opt/maven
ENV PATH="${M2_HOME}/bin:${JAVA_HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apt -qq update && \
    apt -qq -y --no-install-recommends install wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://dlcdn.apache.org/maven/maven-3/"${MAVEN_VERSION}"/binaries/apache-maven-"${MAVEN_VERSION}"-bin.tar.gz -P /tmp && \
    tar xf /tmp/apache-maven-*.tar.gz -C /opt && \
    ln -s /opt/apache-maven-"${MAVEN_VERSION}" /opt/maven \
