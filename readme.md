# My Personal Minecraft Server Setup

![Minecraft](https://img.shields.io/badge/Minecraft-1.18.1-green?logo=minecraft)
![tf badge](https://img.shields.io/badge/Ansible-2.9.6-lightgray?logo=ansible)
![docker badge](https://img.shields.io/badge/Docker-20.10.6-blue?logo=docker)

### Aim

Able to automate the provisioning of a Fabric Minecraft Server with datapacks, mods, configuration, etc.
Achieved by using `ansible`.

### Features

- Using the [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server/) image
- Easy to change configuration via `.env`
- Able to use mods and datapacks easily by inserting them to respective folders
- Backup of worlds
- Ability to start and stop server remotely

### Requirements

On local machine:

- `ansible` & `ansible-playbook`
- Zipping utility (`zip` or `tar`)

On remote machine:

- Zipping utility (`zip` or `tar`)
- Docker and docker-compose
- Python 3 & Python Docker API (`pip install docker`)

### Provisioning Server

Make sure you have the hosts setup on `/etc/ansible/hosts`.
Example has been provided in `hosts.example`.

Commands:

```bash
./bootstrap.sh (setup|start|stop|reset|backup)
# setup -- setting up server files, copying from local to remote
# start -- starting server (aka docker-compose up)
# stop -- stopping server (aka docker-compose down)
# reset -- resetting server files and configs in remote
# backup -- zipping world in remote and copy to local
```

## Future Goal

- Able to switch between worlds.
