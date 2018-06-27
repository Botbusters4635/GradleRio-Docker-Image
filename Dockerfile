FROM ubuntu:artful
MAINTAINER Abiel empoleom@gmail.com

#Initial apt-get update
RUN apt-get update

#Install dirmngr
RUN apt-get -y install dirmngr

#Add WPILib Repository and install the frc-toolchain
RUN echo "deb http://ppa.launchpad.net/wpilib/toolchain/ubuntu artful main" >> /etc/apt/sources.list && \
	 echo "deb-src http://ppa.launchpad.net/wpilib/toolchain/ubuntu artful main" >> /etc/apt/sources.list && \
	 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D51C1F785D5D961140546F3AA06B9F8D55FC4DAE && \
	 apt-get update && \
	 apt-get -y install frc-toolchain

#Install java
RUN apt-get -y install default-jdk
