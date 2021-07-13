# My Personal Minecraft Server Setup

![Minecraft](https://img.shields.io/badge/Minecraft-1.17.0-green?logo=minecraft)
![tf badge](https://img.shields.io/badge/Terraform-1.0.0-blueviolet?logo=terraform)
![docker badge](https://img.shields.io/badge/Docker-20.10.6-blue?logo=docker)

## Aim

Able to provision a Fabric Minecraft Server with datapacks and mods, using Terraform to multiple providers. I most likely will jump from one provider to another, this would be great for me. To make changes to the server, for me it's enough to just SSH to the server and restart it manually (happens rarely). Currently targetting for provisioning Vultr instance.

## Features

- Automatic provisioning using Terraform
- Automated initial SSH key generation
- Using the [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server/) image
- Able to use mods and datapacks easily
- (WIP) Backup of worlds

## Provisioning

Make sure what to provision before actually provisioning by typing:

```bash
terraform plan -var "api_key=XXX"
```

To provision a new Vultr instance:

```bash
terraform apply -var "api_key=XXX"
```

Some files will be generated (including the `game.zip`, containing the game files).

To delete the provisioned instance:

```bash
terraform destroy -var "api_key=XXX"
```

## Note

Tested provisioning on Vultr.
