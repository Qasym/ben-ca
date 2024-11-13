FROM openjdk:17-jdk-slim

ENV JAVA_HOME /usr/local/openjdk-17
ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    nano \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://services.gradle.org/distributions/gradle-7.5.1-bin.zip -P /tmp && \
    unzip /tmp/gradle-7.5.1-bin.zip -d /opt && \
    ln -s /opt/gradle-7.5.1/bin/gradle /usr/bin/gradle && \
    rm /tmp/gradle-7.5.1-bin.zip

WORKDIR /workspace

COPY *.jar /workspace/

# just in case something defaults to 8080
EXPOSE 8080
EXPOSE 2001
EXPOSE 2002
EXPOSE 2003
EXPOSE 2004


ENTRYPOINT ["sh", "-c", "java -jar /workspace/*.jar"]
