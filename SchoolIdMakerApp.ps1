$ErrorActionPreference = "Stop"

try {
    $appDirectory = Join-Path ([Environment]::GetFolderPath("LocalApplicationData")) "SchoolIdMaker"
    $appFile = Join-Path $appDirectory "index.html"
    if (-not (Test-Path -LiteralPath $appFile -PathType Leaf)) {
        throw "The app files could not be prepared. Try reinstalling School ID Maker."
    }

    $edgePaths = @(
        (Join-Path $env:ProgramFiles "Microsoft\Edge\Application\msedge.exe"),
        (Join-Path ${env:ProgramFiles(x86)} "Microsoft\Edge\Application\msedge.exe")
    )
    $edge = $edgePaths | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | Select-Object -First 1
    if (-not $edge) {
        throw "Microsoft Edge is required to run School ID Maker. Install or repair Edge, then try again."
    }

    $appUrl = ([Uri]$appFile).AbsoluteUri
    Start-Process -FilePath $edge -ArgumentList @("--app=$appUrl")
}
catch {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        $_.Exception.Message,
        "School ID Maker",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Error
    ) | Out-Null
}
