FROM ubuntu:bionic
MAINTAINER Abiel empoleom@gmail.com

#Clone the GradleRio repo and install the toolchain
RUN apt-get update && apt-get install -y git openjdk-11-jdk googletest && git clone https://github.com/wpilibsuite/GradleRIO.git && cd GradleRIO/examples/cpp && ./gradlew installRoboRioToolchain && cd / && rm -Rf GradleRIO && rm -rf /var/lib/apt/lists/*