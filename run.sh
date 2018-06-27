#!/bin/bash
docker run -v $(pwd):/buildFolder frc/gradle-rio:latest bash -c "cd /buildFolder && ./gradlew $1"
