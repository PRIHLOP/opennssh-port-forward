# OpenSSH Port Forwarder

Docker container for port forwarding to service on remote host over SSH tunnel.

## Launch with docker-compose

- Install of [docker-compose](https://docs.docker.com/compose/install/) is required.

- Clone [this](https://github.com/PRIHLOP/openssh-port-forward) repository.

- Before launch - copy `env_dist` file to `.env` and fill variables in it.

- For start execute command `docker-compose up -d`.

## Launch with docker-compose from GitHub Container Registry

- Install of [docker-compose](https://docs.docker.com/compose/install/) is required.

- Create file `docker-compose.yml` with the next content:

```yml
openssh-port-forwarder:
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

## Launch with `docker run` command from GitHub Container Registry

Launch in one string:

```bash
    docker run -d \
    -v ~/.ssh:/home/.ssh \
    -p 80:80 \
    -e SSHKEY=id_rsa \
    -e TUNNEL_HOST=user@host \
    -e LOCAL_PORT=80 \
    -e REMOTE_HOST=127.0.0.1 \
    -e REMOTE_PORT=8080 \
    ghcr.io/prihlop/openssh-port-forward:master
```
