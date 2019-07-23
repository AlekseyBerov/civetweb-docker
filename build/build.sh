docker build -t cmaker/v1 .
docker run --mount src="$(pwd)/outcome",target=/tmp/outcome,type=bind cmaker/v1
