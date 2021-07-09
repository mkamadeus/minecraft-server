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

  # Make zip of required files
  provisioner "local-exec" {
    command = "zip game.zip config datapacks mods scripts docker-compose.yml .env"
  }

  # Copy zip
  provisioner "file" {
    source      = "./game.zip"
    destination = "~/game.zip"
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

# SSH keys
resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "vultr_ssh_key" "minecraft_ssh_key" {
  name = "mc-ssh-key"
  ssh_key = tls_private_key.generated.public_key_openssh
  
  provisioner "local-exec" {
    command = "echo '${tls_private_key.generated.private_key_pem}' > ./key.pem"
  }
}

