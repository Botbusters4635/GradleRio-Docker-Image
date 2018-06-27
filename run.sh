#!/bin/bash
docker run -v $(pwd):/buildFolder botbusters/gradlerio-docker:2018 bash -c "cd /buildFolder && ./gradlew $1"
