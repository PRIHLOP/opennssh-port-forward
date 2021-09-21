# OpenSSH Port Forwarder

Docker container for port forwarding to service on remote host over SSH tunnel.

## Launch with docker-compose

- Install of [docker-compose](https://docs.docker.com/compose/install/) is required.

- Clone this repository.

- Before launch - copy `env_dist` file to `.env` and fill variables in it.

- For start execute command `docker-compose up -d`.

## Launch from Docker Hub with docker-compose

- Install of [docker-compose](https://docs.docker.com/compose/install/) is required.

- Create file `docker-compose.yml` with the next content:

```openssh-port-forwarder:
  image: ghcr.io/prihlop/openssh-port-forward:master
  ports:
    - $LOCAL_PORT:$LOCAL_PORT
  environment:
    - SSHKEY=$SSHKEY 
    - TUNNEL_HOST=$TUNNEL_HOST
    - LOCAL_PORT=$LOCAL_PORT
    - REMOTE_HOST=$REMOTE_HOST
    - REMOTE_PORT=$REMOTE_PORT
  volumes:
    - $PATH_TO_SSH_KEY:/home/.ssh
  restart: unless-stopped
```

- Create file `.env` with the next content and edit variables to your:

```SSHKEY=id_rsa
TUNNEL_HOST=user@host
LOCAL_PORT=80
REMOTE_HOST=127.0.0.1
REMOTE_PORT=8080
PATH_TO_SSH_KEY=~/.ssh
```

- Start container with command `docker-compose up -d`.
