# civetweb-docker

To run the full bundle and to build new artifacts:
```
./build_n_run_civet.sh
```
To run only civetweb and reuse the existing artifact:
```
./run_civet.sh
```

Port 8080 will be exposed on all interfaces
So this should work:
```
curl localhost:8080
```