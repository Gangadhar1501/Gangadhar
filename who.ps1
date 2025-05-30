function Get-LoggedInUserActivity {
    Write-Host "`n=== Logged-In Users (like 'who') ===`n"
    query user
    Write-Host "`n=== Session Info (like 'users') ===`n"
    Get-CimInstance -Class Win32_LoggedOnUser |
    ForEach-Object {
        $user = $_.Antecedent -replace '^.*Domain="([^"]+)",Name="([^"]+)".*$', '$1\$2'
        Write-Output $user
    } | Sort-Object -Unique
    Write-Host "`n=== Active User Processes (like 'w') ===`n"
    Get-Process | ForEach-Object {
        try {
            $proc = Get-WmiObject Win32_Process -Filter "ProcessId = $($_.Id)"
            $owner = $proc.GetOwner()
            [PSCustomObject]@{
                User        = "$($owner.Domain)\$($owner.User)"
                Process     = $_.ProcessName
                StartTime   = $_.StartTime
                PID         = $_.Id
            }
        } catch {}
    } | Where-Object { $_.User -ne $null } | Sort-Object User | Format-Table -AutoSize
}












