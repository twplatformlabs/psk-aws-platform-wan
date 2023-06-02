{
    "aws_region": "us-east-1",
    "aws_account_id": "{{ op://empc-lab/aws-dps-2/aws-account-id }}",
    "aws_assume_role": "PSKRoles/PSKPlatformWANRole",
  
    "use_cloud_wan": true,
    "cloud_wan_name": "Nonprod",
    "cloud_wan_share_principles": ["{{ op://empc-lab/aws-dps-1/aws-account-id }}"]
}