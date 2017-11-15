# salt-docker
An easy test environment for saltstack

## Salt Versions
- 2017.7.2 [(reference link)](https://repo.saltstack.com/index.html)

## Docker images
- salt-master [(reference link)] (https://hub.docker.com/r/jackytung/salt-master/)
- salt-minion [(reference link)] (https://hub.docker.com/r/jackytung/salt-minion/)

## Salt cluster with docker compose
The test enviroment is using 1 master and 4 minion.
The docker-compose.yml.example simulates different component and different environment.

Master: 1

Minion: dev (mgr/worker), sta (mgr/worker)

You can build your own test environment by revising docker-compose.yml.example

```
git clone https://github.com/JackyTung/salt-docker
cd salt-docker 
mv docker-compose.yml.example docker-compose.yml
docker-compose up
```

After docker-compose up, go to salt-master container, and test the communication with minions
```
salt '*' test.ping
```

And play with default example
```
salt '*' state.apply state.apply prepare
salt '*' state.apply state.show_top
salt 'project*dev' state.apply say_something saltenv=dev
```

## Environment Variables
Env variables are used to set config on startup.

- SALT_GRAINS - set minion grains as json, defaults is none
- LOG_LEVEL - log level, defaults is INFO

## Volumes

Following paths can be mounted from the container.
The /srv provide the simple states example, you can change to your own test case.

- /etc/salt - Master/Minion config
- /srv - states, states/orch, pillar, reactor, formula,

### Build salt-master & salt-minion on your own
execute ./build.sh

change following variable if you need
- $REPO is the repository
- $TAG is the salt version
- $CONTAINER is the name of image

### Reference
https://github.com/jacksoncage/salt-docker
