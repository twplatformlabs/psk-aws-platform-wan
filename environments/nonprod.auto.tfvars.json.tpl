{
    "aws_region": "us-east-1",
    "aws_account_id": "{{ op://platform/aws-sandbox/aws-account-id }}",
    "aws_assume_role": "PSKRoles/PSKPlatformWANRole",
  
    "use_cloud_wan": true,
    "cloud_wan_name": "Nonprod",
    "cloud_wan_share_principles": ["{{ op://platform/aws-production/aws-account-id }}"]
}