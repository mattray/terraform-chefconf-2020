# Configure the Chef provider
provider "chef" {
  server_url = var.chef_server_url

  # You can set up a "Client" within the Chef Server management console.
  client_name  = var.chef_user_name
  key_material = file(var.chef_user_key)
}

resource "chef_data_bag" "example" {
  name = "example-data-bag"
}

# Create a Chef Environment
resource "chef_environment" "chefconf-demo" {
  name = "chefconf-demo"
}

# Create a Chef Role
resource "chef_role" "ccrole" {
  name = "ccrole"

  run_list = [
    "recipe[chefconf]",
  ]
}

resource "chef_data_bag_item" "example" {
  data_bag_name = "example-data-bag"

  content_json = <<EOT
{
    "id": "example-item",
    "any_arbitrary_data": "howdy"
}
EOT
}
