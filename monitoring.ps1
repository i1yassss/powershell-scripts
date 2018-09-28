# List of IPs.
$IP = $(1..20 | %{"192.168.1.$_"})

# Pings each host in list of IPs.
foreach ($IP in $IP){
  if (Test-Connection -ComputerName $IP -Count 1 -ErrorAction SilentlyContinue){
  	Try{
		$compName = ForEach-Object {([system.net.dns]::GetHostByAddress($IP)).hostname }
    }
	catch{
		$ErrorMessage = $_.Exception.Message
        $compName = 'Unknown'
    }
    Write-Host "$compName $IP is up"
  }
  else{
	echo "$IP unreachable"
  }
}