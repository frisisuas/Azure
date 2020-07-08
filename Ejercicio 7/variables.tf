variable "location" {
  type = string
  default = "eastus2"
}
variable "usuario" {
  type = string
  default = "usuario"
}
variable "password" {
  type = string
  default = "P4$$w0rd12345"
}
#-------añadimos la variable ssh con el contenido de la clave publica----
variable "ssh" {
  type = string
  default = "<substituir por ssh-rsa ... loquesea@email.com de tu clave publica>"
}
