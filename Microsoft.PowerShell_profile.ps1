Set-Location C:\

$foregroundColor = 'Green'
$time = Get-Date
$curUser= (Get-ChildItem Env:\USERNAME).Value
$curComp= (Get-ChildItem Env:\COMPUTERNAME).Value

Write-Host "Hello, $curUser!" -ForegroundColor $foregroundColor
Write-Host "Today is $($time.ToLongDateString())" -ForegroundColor $foregroundColor
Write-Host "Computer Name: $curComp" -ForegroundColor $foregroundColor
Write-Host ""

function Prompt {
    
    "> "
    
    IF (([Security.Principal.WindowsPrincipal] ` [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
    {
    $host.ui.RawUI.WindowTitle = "PowerShell   $curUser (Administrator)   $((Get-Location).Path)"
    }
    Else
    {
    $host.ui.RawUI.WindowTitle = "PowerShell   $curUser   $((Get-Location).Path)"
    }
    Return " "
    
    }