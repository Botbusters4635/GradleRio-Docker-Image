#!/bin/bash
docker run -v $(pwd):/buildFolder botbusters/gradlerio-docker:2019 bash -c "cd /buildFolder && ./gradlew $1"
