$ErrorActionPreference = "Stop"

$required = @("PGHOST", "PGPORT", "PGDATABASE", "PGUSER", "PGPASSWORD")
foreach ($name in $required) {
    if (-not (Test-Path "Env:$name")) {
        throw "Не задана переменная $name"
    }
}

if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
    throw "psql не найден в PATH"
}

$evidenceDir = Join-Path $PSScriptRoot "..\evidence"
New-Item -ItemType Directory -Force -Path $evidenceDir | Out-Null
$outputFile = Join-Path $evidenceDir "smoke-test.txt"

psql -v ON_ERROR_STOP=1 -f "$PSScriptRoot\..\db\smoke_test.sql" 2>&1 | Tee-Object -FilePath $outputFile
