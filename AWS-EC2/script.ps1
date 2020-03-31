# Виртуальная машина Bizagi

aws configure set aws_access_key_id KEY_ID
aws configure set aws_secret_access_key ACCESS_KEY
aws configure set region eu-north-1
aws configure set output json
$instance_id = "i-00000000000000"
$user="Administrator"
$password = 'Password';

aws ec2 start-instances --instance-ids $instance_id

do {
    Write-Host "Получение IP адреса..."
    Start-Sleep -Seconds 5
    $ip = aws ec2 describe-instances --query Reservations[].Instances[].PublicIpAddress --instance-ids $instance_id --output text;

} while (-Not ($ip -match "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$"))

cmdkey /generic:TERMSRV/$ip /user:$user /pass:$password
mstsc /v:$ip

