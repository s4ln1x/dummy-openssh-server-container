# dummy-openssh-server

Just a container file for a dummy container with an openssh server

## How to create the image?

```bash
podman build -f worker.containerfile -t <<<IMAGE_NAME>>>
```

## How to run the container?

```bash
podman run -d --cap-add AUDIT_WRITE -p 22000:22 --expose 22 --name <<<CONTAINER_NAME>>> -t <<<IMAGE_NAME>>>
```

## How to add the ssh keys to container?

```bash
ssh-keygen -t ed25519 -C <<<Comment>>> -f <<<path/to/file>>>
podman cp <<<path/to/file>>> <<</desire/user/home/.ssh/>>>
```

## How to connect?

First add your ssh keys accordingly to the containers and next just do an ssh like the one below

```bash
ssh -p 22000 -i <<</path/to/key>>> dummy@localhost
```
