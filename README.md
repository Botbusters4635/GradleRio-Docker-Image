# GradleRIO Docker Image

### Description
This Docker image contains the necessary packages to compile programs for FRC Robots that use GradleRio.

### Instructions

1. Install the script
```bash
make install
```
2. Run the build (In your program directory)
```bash
Gradlerio-Docker build
```

### Manual Instalation

1. Pull the docker image
```bash
docker pull botbusters/gradlerio-docker:2018
```

2. Run the docker image
```bash
docker run -v [ABSOLUTE PATH TO PROGRAM DIR HERE]:/buildFolder botbusters/gradlerio-docker:2018 bash -c "cd /buildFolder && ./gradlew [GRADLE TARGET]"
```
