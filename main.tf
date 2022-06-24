provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "tf-test" {
  name     = "tf-main-rg"
  location = "uksouth"
}


resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf-test.location
  resource_group_name = azurerm_resource_group.tf-test.name
  ip_address_type     = "Public"
  dns_name_label      = "cne1985weatherapi"
  os_type             = "Linux"
  container {
    name   = "weatherapi"
    image  = "cne1985/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}