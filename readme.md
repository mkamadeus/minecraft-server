# My Personal Minecraft Server Setup

![Minecraft](https://img.shields.io/badge/Minecraft-1.17.0-green?logo=minecraft)
![tf badge](https://img.shields.io/badge/Terraform-1.0.0-blueviolet?logo=terraform)
![docker badge](https://img.shields.io/badge/Docker-20.10.6-blue?logo=docker)

## Aim

Able to provision a Fabric Minecraft Server with datapacks and mods, using Terraform to multiple providers. Currently targetting for provisioning Vultr instance.

## Features

- Automatic provisioning using Terraform
- Using the [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server/) image
- Automated initial SSH key generation
- (WIP) Backup of worlds

## Provisioning

To provision a new Vultr instance:

```bash
terraform apply -var "api_key=XXX"
```

## Notice

**Untested to any kind of provisioning. Currently needs actual testing.**
