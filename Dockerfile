FROM ubuntu:bionic
MAINTAINER Abiel empoleom@gmail.com

#Clone the GradleRio repo and install the toolchain
RUN apt-get update && apt-get install -y git wget googletest libasound2 \
 && wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  https://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.deb \
  && dpkg -i jdk-11.0.1_linux-x64_bin.deb && rm jdk-11.0.1_linux-x64_bin.deb \
  && update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11.0.1/bin/java 2 \
  && update-alternatives --config java \
  && update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-11.0.1/bin/jar 2 \
  && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-11.0.1/bin/javac 2 \
  && update-alternatives --set jar /usr/lib/jvm/jdk-11.0.1/bin/jar \
  && update-alternatives --set javac /usr/lib/jvm/jdk-11.0.1/bin/javac \
  && git clone https://github.com/wpilibsuite/GradleRIO.git && cd GradleRIO/examples/cpp && ./gradlew installRoboRioToolchain && cd / && rm -Rf GradleRIO && rm -rf /var/lib/apt/lists/*

