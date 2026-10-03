# ==============================================================================
# POWERSHELL VALIDATOR FOR ALL 92 DAYS
# ==============================================================================
$root = Split-Path -Parent $PSScriptRoot
$dayDirs = Get-ChildItem -Path $root -Directory | Where-Object { $_.Name -match '^Day\d{2}' } | Sort-Object Name

Write-Host "======================================================================"
Write-Host "VALIDATING ALL $($dayDirs.Count) DAYS (DAY 00 TO DAY 91)"
Write-Host "======================================================================"

$requiredFiles = @(
    'task.md', 'step.md', 'execution.md', 'caption.md', 'caption.txt',
    'image-prompts.md', 'checklist.md', 'README.md',
    'image_01_hero.jpg', 'image_02_architecture.jpg', 'image_03_concept.jpg', 'image_04_execution.jpg', 'image_05_debug_result.jpg',
    'linkedin_hero_1200x1500.jpg',
    'linkedin_graphic.jpg'
)

$passed = 0
$failed = 0

Add-Type -AssemblyName System.Drawing

foreach ($d in $dayDirs) {
    $missing = @()
    foreach ($f in $requiredFiles) {
        if (-not (Test-Path (Join-Path $d.FullName $f))) { $missing += $f }
    }
    if (-not (Test-Path (Join-Path $d.FullName 'screenshots'))) { $missing += 'screenshots/' }

    $cap = Get-Content (Join-Path $d.FullName 'caption.txt') -Raw
    if (-not ($cap -match '👉 Project Link: \[PASTE YOUR PROJECT LINK HERE\]' -or $cap -match '👉 https://github\.com/shubhu-io/90DaysOfDevOps')) {
        $missing += 'caption.txt (link slot)'
    }

    $heroJpg = Join-Path $d.FullName 'image_01_hero.jpg'
    if (Test-Path $heroJpg) {
        try {
            $img = [System.Drawing.Image]::FromFile($heroJpg)
            if ($img.Width -ne 1200 -or $img.Height -ne 1500) {
                $missing += "image_01_hero.jpg ($($img.Width)x$($img.Height) != 1200x1500)"
            }
            $img.Dispose()
        } catch {
            $missing += "image_01_hero.jpg (unreadable)"
        }
    }

    if ($missing.Count -eq 0) {
        $passed++
    } else {
        $failed++
        Write-Host "[$($d.Name)] FAILED: $($missing -join ', ')" -ForegroundColor Red
    }
}

Write-Host "======================================================================"
Write-Host "AUDIT COMPLETE: $passed / $($dayDirs.Count) Days Passed (Failed: $failed)" -ForegroundColor Green
Write-Host "======================================================================"
