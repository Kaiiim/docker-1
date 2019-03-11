# Docker


Introduction to Docker

## Setup docker-machine:
```
export MACHINE_STORAGE_PATH=/tmp
docker-machine create default
eval $(docker-machine env default)
```


## Setup docker-for-mac at 42:
```
cd ~ && rm -rf Library/com.docker.docker
mkdir /goinfre/docker
ln -s /goinfre/docker Library/com.docker.docker
