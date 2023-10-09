
```sh
# Build
docker build . -t test
docker build . -t test --progress=plain
```

```sh
# Run
docker run --rm --name test -p 3000:3000 test
docker run --rm --name test -it test sh
docker run --name test -it -p 3000:3000 test
```

```sh
# Kill
docker kill test
docker rm test
```