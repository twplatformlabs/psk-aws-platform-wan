locals {
    global_network_name = "PSK${var.cloud_wan_name}GlobalNetwork"
    core_network_name   = "PSK${var.cloud_wan_name}CoreNetwork"
}

resource "aws_networkmanager_global_network" "global_network" {
  count  = var.use_cloud_wan ? 1 : 0

  tags = {
    "Name"     = local.global_network_name
  }
}

resource "aws_networkmanager_core_network" "core_network" {
  count  = var.use_cloud_wan ? 1 : 0

  create_base_policy = false
  global_network_id = aws_networkmanager_global_network.global_network[0].id
  tags = {
    "Name"     = local.core_network_name
  }
}

resource "aws_networkmanager_core_network_policy_attachment" "policy_attachment" {
  count  = var.use_cloud_wan ? 1 : 0

  core_network_id = aws_networkmanager_core_network.core_network[0].id
  policy_document = file("policy/PSK${var.cloud_wan_name}CoreNetworkPolicy.json")
}

resource "aws_ram_resource_share" "core_network_resource_share" {
  count  = var.use_cloud_wan ? 1 : 0

  name                      = "PSK${var.cloud_wan_name}CoreNetworkResourceShare"
  allow_external_principals = false
}

resource "aws_ram_resource_association" "core_network_resource_share_association" {
  count  = var.use_cloud_wan ? 1 : 0

  resource_arn       = aws_networkmanager_core_network.core_network[0].arn
  resource_share_arn = aws_ram_resource_share.core_network_resource_share[0].arn
}

resource "aws_ram_principal_association" "core_network_resource_share_principal" {
  for_each = toset(var.cloud_wan_share_principles)

  principal          = each.key
  resource_share_arn = aws_ram_resource_share.core_network_resource_share[0].arn
}