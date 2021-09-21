FROM alpine
RUN apk update && apk add openssh-client

ENTRYPOINT ssh -o StrictHostKeyChecking=no -i  /home/.ssh/$SSHKEY \
-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
-N \
$TUNNEL_HOST
