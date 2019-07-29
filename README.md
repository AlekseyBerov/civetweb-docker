# civetweb-docker

Build image specifying the image name:
```
docker build -t civet/v1 .
```
Run the image:
```
./run_civet.sh
```

Port 8080 will be exposed on all interfaces

This should work:
```
curl localhost:8080
```
