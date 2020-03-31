yc config set token AgAAAAA4656546456546546456456456456
yc config set cloud-id b00000000000000000000
yc config set folder-id b0000000000000000000
yc config set compute-default-zone ru-central1-a


$instance_id = "0000000000000000"
$user="Administrator"
$password = 'password';


yc compute instance start $instance_id

do {
    Write-Host "Получение IP адреса..."
    Start-Sleep -Seconds 5
    $answer = yc compute instance get --full $instance_id --format json
    $answer
    $data = $answer | ConvertFrom-Json
    $ip = $data.network_interfaces.primary_v4_address.one_to_one_nat.address

} while (-Not ($ip -match "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$"))

cmdkey /generic:TERMSRV/$ip /user:$user /pass:$password
mstsc /v:$ip






