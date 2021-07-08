terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.3.3"
    }
  }
}

provider "vultr" {
  api_key     = var.api_key
  retry_limit = 3
}

# Minecraft instance
resource "vultr_instance" "minecraft" {
  plan     = var.plan
  region   = var.region
  os_id    = var.os_id
  label    = var.label
  tag      = var.tag
  hostname = var.hostname

  # Copy scripts
  provisioner "file" {
    source      = "./scripts"
    destination = "~/scripts"
  }

  # Copy required files for server
  provisioner "file" {
    source      = "./game-config"
    destination = "~/game-config"
  }

  provisioner "file" {
    source      = "./.env"
    destination = "~/.env"
  }

  provisioner "file" {
    source      = "./docker-compose.yml"
    destination = "~/docker-compose.yml"
  }

  provisioner "remote-exec" {
    scripts = [
      "~/scripts/install-docker.sh",
      "~/scripts/setup-minecraft.sh"
    ]
  }

}

resource "vultr_instance_ipv4" "minecraft_ipv4" {
  instance_id = vultr_instance.minecraft.id
  reboot      = "false"
}

# Firewall settings
resource "vultr_firewall_group" "minecraft_firewall_group" {
  description = "Minecraft server firewall group"
}

resource "vultr_firewall_rule" "minecraft_firewall_rule" {
  firewall_group_id = vultr_firewall_group.minecraft_firewall_group.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "25565"
  notes             = "Minecraft basic TCP firewall rule"
}


