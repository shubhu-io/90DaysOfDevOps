# ==============================================================================
# 90 DAYS OF DEVOPS — 2026 → 2027
# PREMIUM GRAPHICAL DEVOPS VISUALS — AI GENERATION & BATCH PIPELINE
# Author: Shubham Mane (https://github.com/shubhu-io)
# ==============================================================================
param(
    [int]$Day = -1,
    [int]$StartDay = -1,
    [int]$EndDay = -1,
    [switch]$All
)

$baseDir = $PSScriptRoot

Write-Host "==========================================================================" -ForegroundColor Cyan
Write-Host " 90 DAYS OF DEVOPS — PREMIUM GRAPHICAL DEVOPS VISUALS PIPELINE" -ForegroundColor White
Write-Host " Author: Shubham Mane | BUILD • BREAK • DEBUG • VERIFY" -ForegroundColor Yellow
Write-Host "==========================================================================" -ForegroundColor Cyan

# Determine Target Days
$targetDays = @()
if ($Day -ge 0) {
    $targetDays = @($Day)
} elseif ($StartDay -ge 0 -and $EndDay -ge $StartDay) {
    $targetDays = $StartDay..$EndDay
} elseif ($All) {
    $targetDays = 0..90
} else {
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  .\generate_all_visuals_ai.ps1 -Day 1             # Single Day" -ForegroundColor Gray
    Write-Host "  .\generate_all_visuals_ai.ps1 -StartDay 1 -EndDay 5 # Range" -ForegroundColor Gray
    Write-Host "  .\generate_all_visuals_ai.ps1 -All              # All 91 Days" -ForegroundColor Gray
    exit 0
}

Write-Host "Target Days to Process: $($targetDays -join ', ')" -ForegroundColor Green

foreach ($d in $targetDays) {
    $dayPadded = "{0:D2}" -f $d
    $folder = Get-ChildItem -Directory -Path $baseDir -Filter "Day${dayPadded}*"
    if (-not $folder) {
        $folder = Get-ChildItem -Directory -Path $baseDir -Filter "Day${d}*"
    }
    if (-not $folder) {
        Write-Warning "Directory not found for Day $d"
        continue
    }

    $dayPath = $folder[0].FullName
    $promptsFile = Join-Path $dayPath "image-prompts.md"
    
    if (Test-Path $promptsFile) {
        Write-Host "[$dayPadded] Prompts Verified: $promptsFile" -ForegroundColor Cyan
        Write-Host "     -> Image 01: Cinematic Hero" -ForegroundColor Gray
        Write-Host "     -> Image 02: 3D Technical Architecture" -ForegroundColor Gray
        Write-Host "     -> Image 03: Concept Visualization Mechanism" -ForegroundColor Gray
        Write-Host "     -> Image 04: Real Terminal & Execution Flow" -ForegroundColor Gray
        Write-Host "     -> Image 05: Debugging + Result: Don't Guess. Investigate." -ForegroundColor Gray
    } else {
        Write-Warning "image-prompts.md missing in $dayPath"
    }
}

Write-Host "==========================================================================" -ForegroundColor Cyan
Write-Host "All specified days verified and ready for AI batch generation!" -ForegroundColor Green
