FROM ubuntu:bionic
MAINTAINER Abiel empoleom@gmail.com

#Clone the GradleRio repo and install the toolchain
RUN apt-get update && apt-get install -y build-essential make git wget googletest libasound2 gradle \
 && wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  https://download.oracle.com/otn-pub/java/jdk/11.0.2+7/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.deb \
  && dpkg -i jdk-11.0.2_linux-x64_bin.deb && rm jdk-11.0.2_linux-x64_bin.deb \
  && update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11.0.2/bin/java 2 \
  && update-alternatives --config java \
  && update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-11.0.2/bin/jar 2 \
  && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-11.0.2/bin/javac 2 \
  && update-alternatives --set jar /usr/lib/jvm/jdk-11.0.2/bin/jar \
  && update-alternatives --set javac /usr/lib/jvm/jdk-11.0.2/bin/javac

RUN git clone https://github.com/wpilibsuite/GradleRIO.git 

COPY build.gradle GradleRIO/examples/cpp/build.gradle
COPY gradle/wrapper/gradle-wrapper.jar GradleRIO/examples/cpp/gradle/wrapper/gradle-wrapper.jar
COPY gradle/wrapper/gradle-wrapper.properties GradleRIO/examples/cpp/gradle/wrapper/gradle-wrapper.properties

RUN cd GradleRIO/examples/cpp && ./gradlew installRoboRioToolchain && ./gradlew downloadAll && ./gradlew build && cd / && rm -Rf GradleRIO && rm -rf /var/lib/apt/lists/*

