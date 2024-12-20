# Define the common tags for all resources
locals {
  common_tags = {
    Team    = "Dev"
    Env     = "Prod"
  }
}