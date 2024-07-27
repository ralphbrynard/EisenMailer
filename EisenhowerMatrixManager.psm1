function Add-Task {
    param (
        [Parameter(Mandatory = True)]
        [string],

        [Parameter(Mandatory = True)]
        [string]
    )

    \ = "config.json"
    if (Test-Path \) {
        \ = Get-Content \ | ConvertFrom-Json
    } else {
        \ = @{
            do = @()
            decide = @()
            delegate = @()
            delete = @()
        }
    }

    if (\.\) {
        \.\ += \
        \ | ConvertTo-Json | Set-Content \
        Write-Host "Task added to \ category."
    } else {
        Write-Host "Invalid category."
    }
}

function Remove-Task {
    param (
        [Parameter(Mandatory = True)]
        [string],

        [Parameter(Mandatory = True)]
        [string]
    )

    \ = "config.json"
    if (Test-Path \) {
        \ = Get-Content \ | ConvertFrom-Json
    } else {
        Write-Host "Configuration file not found."
        return
    }

    if (\.\) {
        \.\ = \.\ | Where-Object { \ -ne \ }
        \ | ConvertTo-Json | Set-Content \
        Write-Host "Task removed from \ category."
    } else {
        Write-Host "Invalid category."
    }
}

function Show-Config {
    \ = "config.json"
    if (Test-Path \) {
        \ = Get-Content \ | ConvertFrom-Json
        \
    } else {
        Write-Host "Configuration file not found."
    }
}

Export-ModuleMember -Function Add-Task, Remove-Task, Show-Config
