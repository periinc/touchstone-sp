FROM ubuntu:16.04
MAINTAINER Peri Inc. "info@periinc.com"

ENV TERM=xterm

#Set Locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#Set EST Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Set Terminal
ENV TERM=xterm


### Basic Configuration
RUN apt-get -q update --fix-missing
RUN apt-get install -q -y software-properties-common wget curl

RUN apt-get install -qq -y git vim zip

#Install jdk1.8.x
RUN wget \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -qO- \
    "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz" | tar -zx -C /opt/

ENV JAVA_HOME /opt/jdk1.8.0_144
ENV PATH $JAVA_HOME/bin:$PATH

RUN echo ${JAVA_HOME}

#Install Gradle
ENV MVN_VERSION 3.5.0

RUN mkdir /opt/mvn
RUN cd /opt/mvn && \
curl -sLO http://www-eu.apache.org/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.zip && \
unzip apache-maven-${MVN_VERSION}-bin.zip


ENV MVN_HOME /opt/gradle/apache-maven-${MVN_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin