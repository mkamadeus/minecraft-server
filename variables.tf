variable "api_key" {
  type        = string
  description = "Vultr API key"
}

variable "plan" {
  type        = string
  description = "Vultr instance plan slug"
  default     = "vdc-1c-2gb"
}

variable "region" {
  type        = string
  description = "Vultr instance region slug"
  default     = "sea"
}

variable "os_id" {
  type        = string
  description = "Vultr OS ID slug"
  default     = "167"
}

variable "label" {
  type        = string
  description = "Vultr instance label"
  default     = "minecraft-server"
}

variable "tag" {
  type        = string
  description = "Vultr instance tag"
  default     = "minecraft"
}

variable "hostname" {
  type        = string
  description = "Vultr instance tag"
  default     = "minecraft"
}
