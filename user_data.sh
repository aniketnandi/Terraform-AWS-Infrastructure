#!/bin/bash
# Bootstraps an Apache web server on Amazon Linux 2023.
set -euxo pipefail

dnf update -y
dnf install -y httpd

TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<HTML
<!doctype html>
<html>
  <head><title>${project_name}</title></head>
  <body>
    <h1>Deployed with Terraform</h1>
    <p>Project: ${project_name} (${environment})</p>
    <p>Instance: $INSTANCE_ID in $AZ</p>
  </body>
</html>
HTML

systemctl enable --now httpd
