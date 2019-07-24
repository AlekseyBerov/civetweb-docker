#!/bin/bash

docker build -t cmaker/v1 -f Dockerfile.build .
docker run --mount src="$(pwd)/artifacts",target=/tmp/artifacts,type=bind cmaker/v1

docker build -t civet/v1 -f Dockerfile.serve .
docker run -d -p 8080:8080 civet/v1
