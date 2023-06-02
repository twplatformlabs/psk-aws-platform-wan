output "core_network_id" {
  value       = aws_networkmanager_core_network.core_network[0].id
}

output "core_network_arn" {
  value       = aws_networkmanager_core_network.core_network[0].arn
}

output "resource_share_arn" {
  value       = aws_ram_resource_share.core_network_resource_share[0].arn
}