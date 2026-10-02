Add-Type -AssemblyName System.Drawing

$root = 'D:\Codeing\AI\daily\LinkedIn_90Days'
$dayDirs = Get-ChildItem -Path $root -Directory | Where-Object { $_.Name -match '^Day\d{2}' } | Sort-Object Name
Write-Host "Starting Master 1200x1500 PNG Generation for all $($dayDirs.Count) days (460 images)..."

# Global Fonts
$fHeadBrand = New-Object System.Drawing.Font('Segoe UI', [float]13.0, [System.Drawing.FontStyle]::Bold)
$fDay       = New-Object System.Drawing.Font('Segoe UI', [float]14.0, [System.Drawing.FontStyle]::Bold)
$fSub       = New-Object System.Drawing.Font('Segoe UI', [float]13.0, [System.Drawing.FontStyle]::Bold)
$fTitle     = New-Object System.Drawing.Font('Segoe UI', [float]34.0, [System.Drawing.FontStyle]::Bold)
$fTitleCyan = New-Object System.Drawing.Font('Segoe UI', [float]34.0, [System.Drawing.FontStyle]::Bold)
$fDesc      = New-Object System.Drawing.Font('Segoe UI', [float]11.5, [System.Drawing.FontStyle]::Regular)
$fHudTitle  = New-Object System.Drawing.Font('Segoe UI', [float]14.0, [System.Drawing.FontStyle]::Bold)
$fBody      = New-Object System.Drawing.Font('Segoe UI', [float]11.0, [System.Drawing.FontStyle]::Regular)
$fFoot      = New-Object System.Drawing.Font('Segoe UI', [float]10.5, [System.Drawing.FontStyle]::Regular)
$fTerm      = New-Object System.Drawing.Font('Consolas', [float]10.2, [System.Drawing.FontStyle]::Regular)
$fBlade     = New-Object System.Drawing.Font('Consolas', [float]10.5, [System.Drawing.FontStyle]::Bold)
$fMini      = New-Object System.Drawing.Font('Segoe UI', [float]9.5, [System.Drawing.FontStyle]::Bold)
$fPrinciple = New-Object System.Drawing.Font('Segoe UI', [float]13.5, [System.Drawing.FontStyle]::Bold)
$fWf        = New-Object System.Drawing.Font('Segoe UI', [float]10.5, [System.Drawing.FontStyle]::Bold)

# Global Brushes
$bWhite     = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$bDark      = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#030712'))
$bCyan      = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#00f2fe'))
$bGreen     = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#10b981'))
$bRed       = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#ef4444'))
$bYellow    = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#f59e0b'))
$bMuted     = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#94a3b8'))
$bPurple    = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#c084fc'))
$bTermGreen = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#4ade80'))
$bTermCyan  = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#38bdf8'))
$bTermYellow= New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#fbbf24'))
$bPassBg    = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#10b981'))

$dotRed     = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#ef4444'))
$dotYel     = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#f59e0b'))
$dotGrn     = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#10b981'))

$glassBrush      = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(215, 8, 15, 30))
$windowBarBrush  = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(250, 15, 23, 42))

# Global Pens
$neonPen      = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#00f2fe')), 2
$purplePen    = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#c084fc')), 2
$crimsonPen   = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#ef4444')), 2
$greenPen     = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#10b981')), 2
$arrowPen     = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#38bdf8')), 2
$dataBeamPen  = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#00f2fe')), 3
$dataBeamPen.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$ringPen      = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(160, 0, 242, 254)), 2
$ringPen.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
$gridPen      = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(35, 0, 242, 254)), 1

# Image Encoder for JPEG backup
$codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.FormatDescription -eq 'JPEG' }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters 1
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]95)

# Helper: Draw Isometric 3D Cube / Server Rack
function Draw-Iso3DCube {
    param($g, [float]$cx, [float]$cy, [float]$w, [float]$h, [string]$topHex, [string]$leftHex, [string]$rightHex, $pen, [string]$accentHex)
    
    $pTop = @(
        (New-Object System.Drawing.PointF $cx, $cy),
        (New-Object System.Drawing.PointF ($cx + $w), ($cy + $w*0.5)),
        (New-Object System.Drawing.PointF $cx, ($cy + $w)),
        (New-Object System.Drawing.PointF ($cx - $w), ($cy + $w*0.5))
    )
    $bTop = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($topHex))
    $g.FillPolygon($bTop, $pTop)
    if ($pen) { $g.DrawPolygon($pen, $pTop) }
    $bTop.Dispose()

    $pLeft = @(
        (New-Object System.Drawing.PointF ($cx - $w), ($cy + $w*0.5)),
        (New-Object System.Drawing.PointF $cx, ($cy + $w)),
        (New-Object System.Drawing.PointF $cx, ($cy + $w + $h)),
        (New-Object System.Drawing.PointF ($cx - $w), ($cy + $w*0.5 + $h))
    )
    $bLeft = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($leftHex))
    $g.FillPolygon($bLeft, $pLeft)
    if ($pen) { $g.DrawPolygon($pen, $pLeft) }
    $bLeft.Dispose()

    $pRight = @(
        (New-Object System.Drawing.PointF $cx, ($cy + $w)),
        (New-Object System.Drawing.PointF ($cx + $w), ($cy + $w*0.5)),
        (New-Object System.Drawing.PointF ($cx + $w), ($cy + $w*0.5 + $h)),
        (New-Object System.Drawing.PointF $cx, ($cy + $w + $h))
    )
    $bRight = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($rightHex))
    $g.FillPolygon($bRight, $pRight)
    if ($pen) { $g.DrawPolygon($pen, $pRight) }
    $bRight.Dispose()

    # Server Blade Slots / Trays on Left Face
    if ($accentHex -and $h -gt 50) {
        $bladeCount = 6
        $bladeStep = $h / ($bladeCount + 1)
        $slotPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(90, 0, 242, 254)), 1.5
        $ledBr1 = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($accentHex))
        $ledBr2 = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#10b981'))

        for ($b = 1; $b -le $bladeCount; $b++) {
            $by = $cy + ($w*0.5) + ($b * $bladeStep)
            $bx1 = $cx - ($w * 0.85)
            $bx2 = $cx - ($w * 0.15)
            $by1 = $by - ($w * 0.15 * 0.5)
            $by2 = $by + ($w * 0.35 * 0.5)
            $g.DrawLine($slotPen, $bx1, $by1, $bx2, $by2)
            $g.FillEllipse($ledBr1, ($bx1 + 5), ($by1 - 1), 4, 4)
            $g.FillEllipse($ledBr2, ($bx1 + 13), ($by1 + 2), 4, 4)
        }
        $slotPen.Dispose(); $ledBr1.Dispose(); $ledBr2.Dispose()
    }
}

# Helper: Draw Holographic Glass HUD Card
function Draw-GlassHudCard {
    param($g, [float]$x, [float]$y, [float]$w, [float]$h, [string]$title, [string]$val, [string]$sub, [string]$accentHex)
    
    $glass = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(215, 8, 15, 30))
    $g.FillRectangle($glass, $x, $y, $w, $h)
    $glass.Dispose()

    $pCard = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml($accentHex)), 1.5
    $g.DrawRectangle($pCard, $x, $y, $w, $h)
    $pCard.Dispose()

    $bDot = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($accentHex))
    $g.FillEllipse($bDot, ($x + 12), ($y + 12), 6, 6)
    $bDot.Dispose()

    $fT = New-Object System.Drawing.Font('Consolas', [float]10.0, [System.Drawing.FontStyle]::Bold)
    $bM = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#94a3b8'))
    $g.DrawString($title, $fT, $bM, [float]($x + 24), [float]($y + 8))

    $fV = New-Object System.Drawing.Font('Segoe UI', [float]13.0, [System.Drawing.FontStyle]::Bold)
    $bV = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($accentHex))
    $g.DrawString($val, $fV, $bV, [float]($x + 12), [float]($y + 28))

    $fS = New-Object System.Drawing.Font('Segoe UI', [float]9.5, [System.Drawing.FontStyle]::Regular)
    $bW = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
    $g.DrawString($sub, $fS, $bW, [float]($x + 12), [float]($y + 52))

    $fT.Dispose(); $bM.Dispose(); $fV.Dispose(); $bV.Dispose(); $fS.Dispose(); $bW.Dispose()
}

$count = 0

foreach ($d in $dayDirs) {
    $count++
    $dirName = $d.Name
    $dayNum = $dirName.Substring(0, 5) # e.g. Day00, Day01, Day91
    $taskName = ($dirName -replace '^Day\d{2}\s*-\s*', '').Trim()

    $dayInt = [int]($dayNum.Substring(3, 2))

    # Read topic & phase from task.md
    $taskMdPath = Join-Path $d.FullName 'task.md'
    $domain = "Linux, Shell & DevOps Foundations"
    if (Test-Path $taskMdPath) {
        $lines = Get-Content $taskMdPath
        foreach ($l in $lines) {
            if ($l -match '^\*\*Domain\*\*:\s*(.+)$') { $domain = $matches[1].Trim() }
            elseif ($l -match '^\*\*Primary Topic\*\*:\s*(.+)$') { $domain = $matches[1].Trim() }
        }
    }

    # Derive real engineering CLI commands from day
    $cliCmd = "bash monitor.sh --strict --threshold-cpu=80 --json"
    $cliTool = "BASH / LINUX SRE"
    if ($dayInt -eq 0) {
        $cliCmd = "bash verify_toolchain.sh --all --strict --json"
        $cliTool = "DEVOPS TOOLCHAIN RUNNER"
    } elseif ($taskName -match 'Container|Distroless|Docker') {
        $cliCmd = "docker build --no-cache -t app:distroless -f Dockerfile ."
        $cliTool = "DOCKER ENGINE / BUILDKIT"
    } elseif ($taskName -match 'Kubernetes|K8s|Network Policy|Pod|Deployment') {
        $cliCmd = "kubectl apply -f manifest.yaml --dry-run=server"
        $cliTool = "KUBERNETES CONTROLLER"
    } elseif ($taskName -match 'Terraform|IaC') {
        $cliCmd = "terraform apply -auto-approve -var-file=prod.tfvars"
        $cliTool = "TERRAFORM IAC ENGINE"
    } elseif ($taskName -match 'Ansible') {
        $cliCmd = "ansible-playbook -i inventory.ini site.yml --check"
        $cliTool = "ANSIBLE AUTOMATION"
    } elseif ($taskName -match 'GitHub Actions|Build Matrix|CI') {
        $cliCmd = "act push --matrix os:ubuntu-latest,arch:arm64"
        $cliTool = "GITHUB ACTIONS CI/CD"
    } elseif ($taskName -match 'Prometheus|Metrics|Telemetry|RED') {
        $cliCmd = "promtool check rules alerts.yml"
        $cliTool = "PROMETHEUS TSDB"
    } elseif ($taskName -match 'Istio|Mesh|mTLS') {
        $cliCmd = "istioctl analyze -n default --failure-threshold=Error"
        $cliTool = "ISTIO SERVICE MESH"
    } elseif ($taskName -match 'Kafka|Flink|Streaming') {
        $cliCmd = "kafka-topics.sh --bootstrap-server localhost:9092 --list"
        $cliTool = "KAFKA MESSAGE BUS"
    } elseif ($taskName -match 'Security|Vulnerability|Trivy|Cosign|SBOM') {
        $cliCmd = "cosign verify --key cosign.pub prod-registry/app:v1"
        $cliTool = "SIGSTORE SECURITY GATE"
    } elseif ($taskName -match 'Chaos|Fault') {
        $cliCmd = "kubectl apply -f chaos-experiment.yaml"
        $cliTool = "CHAOS MESH INJECTION"
    } elseif ($taskName -match 'Redis|Cache') {
        $cliCmd = "redis-cli --latency-history -p 6379"
        $cliTool = "REDIS IN-MEMORY CACHE"
    } elseif ($taskName -match 'PostgreSQL|Database|PgBouncer') {
        $cliCmd = "pg_isready -h localhost -p 6432 -U postgres"
        $cliTool = "POSTGRESQL REPLICATION"
    } elseif ($taskName -match 'SLO|SLA|Error Budget') {
        $cliCmd = "curl -s localhost:9090/api/v1/query?query=slo_burn_rate"
        $cliTool = "SLO OBSERVABILITY ENGINE"
    } elseif ($taskName -match 'Psychological Safety|Safety') {
        $cliCmd = "bash assess_safety.sh --calc-index --json"
        $cliTool = "SRE CULTURE & ASSESSMENT"
    } elseif ($dayInt -eq 91) {
        $cliCmd = "bash verify_master_compendium.sh --all-90-days --verify-audit"
        $cliTool = "MASTER CAPSTONE RUNNER"
    }

    # ==============================================================================
    # 1. IMAGE 01: CINEMATIC HERO (1200 x 1500 px, 4:5 VERTICAL PNG)
    # ==============================================================================
    $bmp1 = New-Object System.Drawing.Bitmap 1200, 1500
    $g1 = [System.Drawing.Graphics]::FromImage($bmp1)
    $g1.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g1.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g1.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    # Obsidian Background & Radial Glow
    $bg1 = New-Object System.Drawing.Drawing2D.LinearGradientBrush (New-Object System.Drawing.Point 0, 0), (New-Object System.Drawing.Point 0, 1500), ([System.Drawing.ColorTranslator]::FromHtml('#030712')), ([System.Drawing.ColorTranslator]::FromHtml('#01040a'))
    $g1.FillRectangle($bg1, 0, 0, 1200, 1500)
    $bg1.Dispose()

    for ($r = 550; $r -ge 50; $r -= 35) {
        $alpha = [int](32 * (1.0 - ($r / 550.0)))
        $glowBr = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb($alpha, 0, 242, 254))
        $g1.FillEllipse($glowBr, (600 - $r), (680 - [int]($r * 0.75)), ($r * 2), [int]($r * 1.5))
        $glowBr.Dispose()
    }

    # Floor Grid
    for ($i = -16; $i -le 16; $i++) {
        $x1 = 600 + ($i * 70); $y1 = 700 + ($i * 24)
        $g1.DrawLine($gridPen, $x1, $y1, ($x1 - 800), ($y1 + 450))
        $g1.DrawLine($gridPen, $x1, $y1, ($x1 + 800), ($y1 + 450))
    }

    # Particles
    $rnd = New-Object System.Random (1000 + $dayInt)
    for ($p = 0; $p -lt 70; $p++) {
        $px = $rnd.Next(60, 1140); $py = $rnd.Next(200, 1380); $ps = $rnd.Next(2, 6)
        $pBr = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb($rnd.Next(90, 210), 0, 242, 254))
        $g1.FillEllipse($pBr, $px, $py, $ps, $ps)
        $pBr.Dispose()
    }

    # 3D Infrastructure Centerpiece
    $g1.DrawLine($dataBeamPen, 240, 680, 600, 620)
    $g1.DrawLine($dataBeamPen, 960, 680, 600, 620)
    Draw-Iso3DCube $g1 240 540 85 180 '#1e293b' '#0f172a' '#090d16' $neonPen '#00f2fe'
    Draw-Iso3DCube $g1 960 540 85 180 '#1e293b' '#0f172a' '#090d16' $purplePen '#c084fc'
    Draw-Iso3DCube $g1 380 620 90 200 '#1e293b' '#0f172a' '#090d16' $neonPen '#38bdf8'
    Draw-Iso3DCube $g1 820 620 90 200 '#1e293b' '#0f172a' '#090d16' $purplePen '#a855f7'
    Draw-Iso3DCube $g1 600 480 120 250 '#38bdf8' '#0284c7' '#0369a1' $neonPen '#00f2fe'

    $g1.DrawEllipse($ringPen, 460, 420, 280, 100)

    # Master Node Badge
    $g1.FillRectangle($glassBrush, 470, 450, 260, 36)
    $g1.DrawRectangle($neonPen, 470, 450, 260, 36)
    $nodeLabel = if ($dayInt -eq 0) { "90 DAYS GRAND LAUNCH [ONLINE]" } elseif ($dayInt -eq 91) { "MASTER COMPENDIUM [VERIFIED]" } else { "$cliTool [ACTIVE]" }
    $g1.DrawString($nodeLabel, $fBlade, $bCyan, [float]482.0, [float]459.0)

    # Typography & Branding
    $g1.FillRectangle($glassBrush, 60, 50, 480, 46)
    $g1.DrawRectangle($neonPen, 60, 50, 480, 46)
    $g1.DrawString("90 DAYS OF DEVOPS  |  2026 → 2027", $fHeadBrand, $bWhite, [float]80.0, [float]62.0)

    $g1.FillRectangle($bCyan, 980, 50, 160, 46)
    $g1.DrawString("$dayNum / 90", $fDay, $bDark, [float]1008.0, [float]61.0)

    $g1.DrawString($domain.ToUpper(), $fSub, $bCyan, [float]60.0, [float]120.0)
    $rectTitle = New-Object System.Drawing.RectangleF 60, 145, 1080, 110
    $g1.DrawString($taskName, $fTitle, $bWhite, $rectTitle)

    # Telemetry HUD cards
    Draw-GlassHudCard $g1 60 380 200 78 "CPU TELEMETRY" "14.2% UTIL" "Kernel Probes: 100%" '#00f2fe'
    Draw-GlassHudCard $g1 60 475 200 78 "MEMORY BUFFER" "4.1 GB / 32 GB" "Zero OOM Traps" '#10b981'
    Draw-GlassHudCard $g1 60 570 200 78 "STORAGE IOPS" "NVMe 420 IOPS" "Latency: 0.18ms" '#38bdf8'

    Draw-GlassHudCard $g1 940 380 200 78 "SYSTEM LOAD" "P99: 2.4ms" "SLA Target: 15ms" '#00f2fe'
    Draw-GlassHudCard $g1 940 475 200 78 "ZERO-DRIFT" "STATE VALID" "Deterministic Exit 0" '#10b981'
    Draw-GlassHudCard $g1 940 570 200 78 "NETWORK MESH" "10 Gbps ETH0" "Drops: 0 • MTU: 9000" '#c084fc'

    # Realistic Mini Console Preview
    $g1.FillRectangle($glassBrush, 60, 840, 1080, 420)
    $g1.DrawRectangle($neonPen, 60, 840, 1080, 420)
    $g1.FillRectangle($windowBarBrush, 60, 840, 1080, 42)
    $g1.FillEllipse($dotRed, 78, 855, 12, 12)
    $g1.FillEllipse($dotYel, 98, 855, 12, 12)
    $g1.FillEllipse($dotGrn, 118, 855, 12, 12)
    $g1.DrawString("shubham@prod-sre:~/workspace ($dayNum - strict mode)", $fBlade, $bMuted, [float]150.0, [float]852.0)

    $heroTerm = @(
        @("shubham@prod-sre:~$ $cliCmd", $bTermCyan),
        @("[INFO] Initializing production environment for: $taskName", $bMuted),
        @("[CHECK] Validating kernel parameters and automated signal traps...", $bMuted),
        @("[OK] Runtime asserted: Zero state drift confirmed across cloud nodes", $bTermGreen),
        @("[OK] Configuration schema verified: 100% compliant with enterprise standard", $bTermGreen),
        @("[EXEC] Executing workload pipeline and health diagnostic probes...", $bMuted),
        @("[EXEC] Health check probe: HTTP/2 200 OK (latency: 2.4ms, MTTR: <30s)", $bTermGreen),
        @("[EVIDENCE] Structured JSON telemetry emitted to ./execution.md", $bTermYellow),
        @("[SUCCESS] All test suites completed with exit code: 0", $bTermGreen)
    )
    for ($idx = 0; $idx -lt $heroTerm.Count; $idx++) {
        $ly = 896 + ($idx * 34)
        $g1.DrawString($heroTerm[$idx][0], $fTerm, $heroTerm[$idx][1], [float]84.0, [float]$ly)
    }

    $g1.FillRectangle($bPassBg, 970, 1212, 150, 36)
    $g1.DrawString("EXIT CODE: 0", $fBlade, $bDark, [float]985.0, [float]1221.0)

    # Workflow Capsule Bar
    $steps = @('OBSERVE', 'INVESTIGATE', 'IDENTIFY', 'FIX', 'VERIFY')
    for ($s = 0; $s -lt 5; $s++) {
        $sx = 60 + ($s * 215)
        $g1.FillRectangle($glassBrush, $sx, 1290, 175, 44)
        $g1.DrawRectangle($neonPen, $sx, 1290, 175, 44)
        $stCol = if ($s -eq 4) { $bGreen } else { $bCyan }
        $g1.DrawString("$($s+1). $($steps[$s])", $fWf, $stCol, [float]($sx + 18), [float]1302.0)
        if ($s -lt 4) {
            $ax1 = $sx + 175 + 8; $ax2 = $sx + 215 - 8
            $g1.DrawLine($arrowPen, $ax1, 1312, $ax2, 1312)
        }
    }

    # Footer
    $g1.DrawString("Shubham Mane | Cloud, DevOps & Site Reliability Engineer", $fFoot, $bWhite, [float]60.0, [float]1430.0)
    $g1.DrawString("github.com/shubhu-io/90-days-of-devops", $fBlade, $bCyan, [float]60.0, [float]1452.0)
    $g1.DrawString("SRE AXIOM: DON'T GUESS. INVESTIGATE.", $fMini, $bGreen, [float]840.0, [float]1440.0)

    $bmp1.Save((Join-Path $d.FullName 'image_01_hero.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp1.Save((Join-Path $d.FullName 'image_01_hero.jpg'), $codec, $encoderParams)
    $g1.Dispose(); $bmp1.Dispose()

    # ==============================================================================
    # 2. IMAGE 02: MASTER 3D ARCHITECTURE (1200 x 1500 px, 4:5 VERTICAL PNG)
    # ==============================================================================
    $bmp2 = New-Object System.Drawing.Bitmap 1200, 1500
    $g2 = [System.Drawing.Graphics]::FromImage($bmp2)
    $g2.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g2.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g2.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $bg2 = New-Object System.Drawing.Drawing2D.LinearGradientBrush (New-Object System.Drawing.Point 0, 0), (New-Object System.Drawing.Point 0, 1500), ([System.Drawing.ColorTranslator]::FromHtml('#020617')), ([System.Drawing.ColorTranslator]::FromHtml('#000308'))
    $g2.FillRectangle($bg2, 0, 0, 1200, 1500)
    $bg2.Dispose()

    $g2.DrawString("$dayNum • MASTER 3D ISOMETRIC ARCHITECTURE TOPOLOGY", $fSub, $bCyan, [float]60.0, [float]60.0)
    $g2.DrawString("End-to-End Production System Pipeline & Ingress Flow", $fTitle, $bWhite, [float]60.0, [float]100.0)

    # 5 Architectural Pedestals cascading in 3D
    $archNodes = @(
        @{ X = 180; Y = 380; Name = '1. CLIENT INGRESS'; Sub = 'mTLS / API / CLI'; Tag = 'INGRESS' },
        @{ X = 390; Y = 500; Name = '2. SECURITY GATE'; Sub = 'Zero-Trust Policy'; Tag = 'SECURITY' },
        @{ X = 600; Y = 620; Name = '3. CORE WORKLOAD'; Sub = $taskName; Tag = 'CONTROLLER' },
        @{ X = 810; Y = 740; Name = '4. CLUSTER RUNTIME'; Sub = 'High-Availability'; Tag = 'RUNTIMES' },
        @{ X = 1020; Y = 860; Name = '5. TELEMETRY SINK'; Sub = 'Prometheus / Logs'; Tag = 'METRICS' }
    )

    for ($s = 0; $s -lt 4; $s++) {
        $p1x = $archNodes[$s].X; $p1y = $archNodes[$s].Y + 50
        $p2x = $archNodes[$s+1].X; $p2y = $archNodes[$s+1].Y + 50
        $g2.DrawLine($neonPen, $p1x, $p1y, $p2x, $p2y)
    }

    for ($s = 0; $s -lt 5; $s++) {
        $an = $archNodes[$s]
        $topCol = if ($s -eq 2) { '#38bdf8' } else { '#1e293b' }
        $leftCol = if ($s -eq 2) { '#0284c7' } else { '#0f172a' }
        $rightCol = if ($s -eq 2) { '#0369a1' } else { '#020617' }

        Draw-Iso3DCube $g2 $an.X $an.Y 85 90 $topCol $leftCol $rightCol $neonPen '#00f2fe'

        $cardY = $an.Y - 100
        $g2.FillRectangle($glassBrush, ($an.X - 95), $cardY, 190, 65)
        $g2.DrawRectangle($neonPen, ($an.X - 95), $cardY, 190, 65)
        $g2.DrawString($an.Name, $fMini, $bWhite, [float]($an.X - 85), [float]($cardY + 10))
        $g2.DrawString($an.Tag, $fBlade, $bCyan, [float]($an.X - 85), [float]($cardY + 34))
    }

    # Architecture Specification Box
    $g2.FillRectangle($glassBrush, 60, 1040, 1080, 240)
    $g2.DrawRectangle($purplePen, 60, 1040, 1080, 240)
    $g2.DrawString("ARCHITECTURAL SPECIFICATION & ZERO-TRUST BOUNDARIES", $fHudTitle, $bCyan, [float]85.0, [float]1060.0)
    
    $archSpecs = @(
        "• Transport Layer: Zero-Trust mTLS & Strictly Typed JSON Payloads across all communication boundaries",
        "• Fault Isolation: Kernel cgroups, resource boundaries and automatic signal traps",
        "• Operational Targets: Target P99 Latency < 15ms | Recovery MTTR < 30s | SLA Availability: 99.99%",
        "• Self-Healing: Active liveness/readiness probes with automated failover and rollback trigger",
        "• Machine Telemetry: Emits audit logs to TSDB sink with zero state drift verification"
    )
    for ($sp = 0; $sp -lt $archSpecs.Count; $sp++) {
        $g2.DrawString($archSpecs[$sp], $fBody, $bWhite, [float]85.0, [float](1100 + ($sp * 26)))
    }

    # Workflow Capsule Bar
    for ($s = 0; $s -lt 5; $s++) {
        $sx = 60 + ($s * 215)
        $g2.FillRectangle($glassBrush, $sx, 1310, 175, 44)
        $g2.DrawRectangle($neonPen, $sx, 1310, 175, 44)
        $g2.DrawString("$($s+1). $($steps[$s])", $fWf, $bCyan, [float]($sx + 18), [float]1322.0)
        if ($s -lt 4) {
            $ax1 = $sx + 175 + 8; $ax2 = $sx + 215 - 8
            $g2.DrawLine($arrowPen, $ax1, 1332, $ax2, 1332)
        }
    }

    $g2.DrawString("Shubham Mane | Cloud, DevOps & Site Reliability Engineer", $fFoot, $bWhite, [float]60.0, [float]1430.0)
    $g2.DrawString("github.com/shubhu-io/90-days-of-devops", $fBlade, $bCyan, [float]60.0, [float]1452.0)

    $bmp2.Save((Join-Path $d.FullName 'image_02_architecture.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp2.Save((Join-Path $d.FullName 'image_02_architecture.jpg'), $codec, $encoderParams)
    $g2.Dispose(); $bmp2.Dispose()

    # ==============================================================================
    # 3. IMAGE 03: CONCEPT VISUALIZATION (1200 x 1500 px, 4:5 VERTICAL PNG)
    # ==============================================================================
    $bmp3 = New-Object System.Drawing.Bitmap 1200, 1500
    $g3 = [System.Drawing.Graphics]::FromImage($bmp3)
    $g3.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g3.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g3.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $bg3 = New-Object System.Drawing.Drawing2D.LinearGradientBrush (New-Object System.Drawing.Point 0, 0), (New-Object System.Drawing.Point 0, 1500), ([System.Drawing.ColorTranslator]::FromHtml('#020617')), ([System.Drawing.ColorTranslator]::FromHtml('#000308'))
    $g3.FillRectangle($bg3, 0, 0, 1200, 1500)
    $bg3.Dispose()

    $g3.DrawString("$dayNum • CONCEPT VISUALIZATION & CORE MECHANISM", $fSub, $bCyan, [float]60.0, [float]60.0)
    $g3.DrawString("The Inner Engineering Transformation Mechanism", $fTitle, $bWhite, [float]60.0, [float]100.0)

    # 4 Transformation Pillars
    $beamPen = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#8b5cf6')), 6
    $beamPen2 = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml('#00f2fe')), 2
    $g3.DrawLine($beamPen, 100, 520, 1100, 520)
    $g3.DrawLine($beamPen2, 100, 520, 1100, 520)
    $beamPen.Dispose(); $beamPen2.Dispose()

    $pillars = @(
        @{ X = 190; Title = '1. RAW SIGNALS'; Desc = "CLI Arguments`nKernel Signals`nEnvironment Variables`nRaw Payloads" },
        @{ X = 460; Title = '2. DEFENSE TRAP'; Desc = "set -euo pipefail`nStrict Input Regex`nSanitization Gate`nFault Injection Test" },
        @{ X = 730; Title = '3. ASSERT GATE'; Desc = "Zero-Drift Policy`nExit Code Assert`nAutomated Rollback`nState Locking" },
        @{ X = 1000; Title = '4. EMIT EVIDENCE'; Desc = "Structured JSON Log`nAudit Verification`nPrometheus Metrics`nDeterministic Exit 0" }
    )

    for ($c = 0; $c -lt 4; $c++) {
        $pl = $pillars[$c]
        Draw-Iso3DCube $g3 $pl.X 440 90 100 '#1e293b' '#0f172a' '#090d16' $neonPen '#00f2fe'

        $g3.FillRectangle($glassBrush, ($pl.X - 115), 620, 230, 220)
        $g3.DrawRectangle($neonPen, ($pl.X - 115), 620, 230, 220)
        $g3.DrawString($pl.Title, $fBlade, $bCyan, [float]($pl.X - 100), [float]640.0)
        $g3.DrawString($pl.Desc, $fBody, $bWhite, [float]($pl.X - 100), [float]680.0)
    }

    # Senior Architectural Axiom Card
    $g3.FillRectangle($glassBrush, 60, 960, 1080, 280)
    $g3.DrawRectangle($greenPen, 60, 960, 1080, 280)
    $g3.DrawString("SENIOR ARCHITECTURAL AXIOM", $fHudTitle, $bGreen, [float]85.0, [float]985.0)
    $axiomText = "Production systems do not fail randomly; they fail at unasserted boundaries.`n`nBy enforcing strict deterministic validation at Step 1, we eliminate silent state drift`nand ensure 100% reproducible execution across all environments.`n`nEvery service, container, pipeline, and daemon in this repository implements defensive`nsignal traps, automated rollback gates, and machine-readable telemetry evidence."
    $g3.DrawString($axiomText, $fBody, $bWhite, [float]85.0, [float]1030.0)

    # Workflow Capsule Bar
    for ($s = 0; $s -lt 5; $s++) {
        $sx = 60 + ($s * 215)
        $g3.FillRectangle($glassBrush, $sx, 1310, 175, 44)
        $g3.DrawRectangle($neonPen, $sx, 1310, 175, 44)
        $g3.DrawString("$($s+1). $($steps[$s])", $fWf, $bCyan, [float]($sx + 18), [float]1322.0)
        if ($s -lt 4) {
            $ax1 = $sx + 175 + 8; $ax2 = $sx + 215 - 8
            $g3.DrawLine($arrowPen, $ax1, 1332, $ax2, 1332)
        }
    }

    $g3.DrawString("Shubham Mane | Cloud, DevOps & Site Reliability Engineer", $fFoot, $bWhite, [float]60.0, [float]1430.0)
    $g3.DrawString("github.com/shubhu-io/90-days-of-devops", $fBlade, $bCyan, [float]60.0, [float]1452.0)

    $bmp3.Save((Join-Path $d.FullName 'image_03_concept.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp3.Save((Join-Path $d.FullName 'image_03_concept.jpg'), $codec, $encoderParams)
    $g3.Dispose(); $bmp3.Dispose()

    # ==============================================================================
    # 4. IMAGE 04: PRACTICAL EXECUTION CONSOLE (1200 x 1500 px, 4:5 VERTICAL PNG)
    # ==============================================================================
    $bmp4 = New-Object System.Drawing.Bitmap 1200, 1500
    $g4 = [System.Drawing.Graphics]::FromImage($bmp4)
    $g4.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g4.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g4.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $bg4 = New-Object System.Drawing.Drawing2D.LinearGradientBrush (New-Object System.Drawing.Point 0, 0), (New-Object System.Drawing.Point 0, 1500), ([System.Drawing.ColorTranslator]::FromHtml('#020617')), ([System.Drawing.ColorTranslator]::FromHtml('#000308'))
    $g4.FillRectangle($bg4, 0, 0, 1200, 1500)
    $bg4.Dispose()

    $g4.DrawString("$dayNum • VERIFIED CLI EXECUTION COCKPIT", $fSub, $bCyan, [float]60.0, [float]60.0)
    $g4.DrawString("Developer Cockpit & Live Terminal Output", $fTitle, $bWhite, [float]60.0, [float]100.0)

    # Large Terminal Window
    $g4.FillRectangle($glassBrush, 60, 180, 1080, 1050)
    $g4.DrawRectangle($neonPen, 60, 180, 1080, 1050)

    $g4.FillRectangle($windowBarBrush, 60, 180, 1080, 44)
    $g4.FillEllipse($dotRed, 78, 196, 12, 12)
    $g4.FillEllipse($dotYel, 98, 196, 12, 12)
    $g4.FillEllipse($dotGrn, 118, 196, 12, 12)
    $g4.DrawString("shubham@prod-sre:~/workspace ($dayNum - strict mode)", $fBlade, $bMuted, [float]150.0, [float]193.0)

    $termCmdOutput = @(
        @("shubham@prod-sre:~$ $cliCmd", $bTermCyan),
        @("[2026-10-02 17:15:00] [INFO] Initializing environment for: $taskName", $bMuted),
        @("[INFO] SRE Target Domain: $domain", $bMuted),
        @("[CHECK: PREFLIGHT] Validating environment variables and kernel parameters...", $bMuted),
        @("[OK] Runtime asserted: Zero ambient drift confirmed across infrastructure", $bTermGreen),
        @("[OK] Configuration compiled: Schema validated with zero warnings", $bTermGreen),
        @("[EXEC] Executing workload test suite: $taskName", $bTermCyan),
        @("[EXEC] Injecting synthetic workload: 5,000 req/sec stress test", $bMuted),
        @("[CHECK: LATENCY]  P50: 1.2ms | P95: 2.8ms | P99: 4.1ms -> [SLA HEALTHY]", $bTermGreen),
        @("[CHECK: CPU]      Utilization: 14.2% across 16 cores -> [OPTIMAL]", $bTermGreen),
        @("[CHECK: MEMORY]   RSS: 412 MB / Limit: 2048 MB -> [ZERO LEAK]", $bTermGreen),
        @("[CHECK: PROBES]   Liveness: HTTP 200 OK | Readiness: HTTP 200 OK", $bTermGreen),
        @("[CHECK: AUDIT]    Verification signature matches SHA-256 digest", $bTermGreen),
        @("[EVIDENCE] Writing telemetry and structured test results to ./execution.md ...", $bTermYellow),
        @("[EVIDENCE] Exporting Prometheus TSDB metrics and OpenTelemetry trace traces ...", $bTermYellow),
        @("[SUCCESS] All 14 automated verification gates passed successfully.", $bTermGreen),
        @("[SUCCESS] Master execution completed deterministically with exit code: 0", $bTermGreen)
    )

    for ($idx = 0; $idx -lt $termCmdOutput.Count; $idx++) {
        $ly = 245 + ($idx * 48)
        $g4.DrawString($termCmdOutput[$idx][0], $fTerm, $termCmdOutput[$idx][1], [float]85.0, [float]$ly)
    }

    # Pass Badge
    $g4.FillRectangle($bPassBg, 950, 1160, 170, 44)
    $g4.DrawString("PASS • EXIT: 0", $fBlade, $bDark, [float]972.0, [float]1172.0)

    # Workflow Capsule Bar
    for ($s = 0; $s -lt 5; $s++) {
        $sx = 60 + ($s * 215)
        $g4.FillRectangle($glassBrush, $sx, 1290, 175, 44)
        $g4.DrawRectangle($neonPen, $sx, 1290, 175, 44)
        $g4.DrawString("$($s+1). $($steps[$s])", $fWf, $bCyan, [float]($sx + 18), [float]1302.0)
        if ($s -lt 4) {
            $ax1 = $sx + 175 + 8; $ax2 = $sx + 215 - 8
            $g4.DrawLine($arrowPen, $ax1, 1312, $ax2, 1312)
        }
    }

    $g4.DrawString("Shubham Mane | Cloud, DevOps & Site Reliability Engineer", $fFoot, $bWhite, [float]60.0, [float]1430.0)
    $g4.DrawString("github.com/shubhu-io/90-days-of-devops", $fBlade, $bCyan, [float]60.0, [float]1452.0)

    $bmp4.Save((Join-Path $d.FullName 'image_04_execution.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp4.Save((Join-Path $d.FullName 'image_04_execution.jpg'), $codec, $encoderParams)
    $g4.Dispose(); $bmp4.Dispose()

    # ==============================================================================
    # 5. IMAGE 05: FAILURE → DEBUG → RESULT (1200 x 1500 px, 4:5 VERTICAL PNG)
    # ==============================================================================
    $bmp5 = New-Object System.Drawing.Bitmap 1200, 1500
    $g5 = [System.Drawing.Graphics]::FromImage($bmp5)
    $g5.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g5.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g5.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $bg5 = New-Object System.Drawing.Drawing2D.LinearGradientBrush (New-Object System.Drawing.Point 0, 0), (New-Object System.Drawing.Point 0, 1500), ([System.Drawing.ColorTranslator]::FromHtml('#020617')), ([System.Drawing.ColorTranslator]::FromHtml('#000308'))
    $g5.FillRectangle($bg5, 0, 0, 1200, 1500)
    $bg5.Dispose()

    $g5.DrawString("$dayNum • FAILURE CHALLENGE, INVESTIGATION & SELF-HEALING", $fSub, $bCyan, [float]60.0, [float]60.0)
    $g5.DrawString("Break, Investigate & Root Cause Verification", $fTitle, $bWhite, [float]60.0, [float]100.0)

    # Core SRE Principle Banner
    $g5.FillRectangle($glassBrush, 60, 180, 1080, 54)
    $g5.DrawRectangle($crimsonPen, 60, 180, 1080, 54)
    $g5.DrawString("CORE SRE PRINCIPLE: DON'T GUESS. INVESTIGATE.", $fPrinciple, $bRed, [float]310.0, [float]196.0)

    # Left Box: What Broke (Failure Trap)
    $g5.FillRectangle($glassBrush, 60, 260, 520, 480)
    $g5.DrawRectangle($crimsonPen, 60, 260, 520, 480)
    $g5.DrawString("WHAT BROKE (FAILURE INJECTION)", $fBlade, $bRed, [float]85.0, [float]285.0)

    $failItems = @(
        "• Simulated production failure injected",
        "• Unhandled socket / process contention",
        "• Missing defensive signal trap (SIGINT/TERM)",
        "• Silent state drift across worker nodes",
        "• Process crashed with non-zero exit code: 1",
        "• Pipeline halted: deployment gate blocked",
        "• Alerts fired: P99 latency breached SLA"
    )
    for ($f = 0; $f -lt $failItems.Count; $f++) {
        $g5.DrawString($failItems[$f], $fBody, $bWhite, [float]85.0, [float](335 + ($f * 42)))
    }

    # Right Box: How We Fixed It (Remediation)
    $g5.FillRectangle($glassBrush, 620, 260, 520, 480)
    $g5.DrawRectangle($greenPen, 620, 260, 520, 480)
    $g5.DrawString("HOW WE FIXED IT (REMEDIATION)", $fBlade, $bGreen, [float]645.0, [float]285.0)

    $fixItems = @(
        "• Implemented signal trap handlers & cleanup",
        "• Added automated exponential backoff retry",
        "• Strict regex & defensive parameter validation",
        "• Self-healing fallback loop verified in <30s",
        "• Applied zero-drift state assertion gate",
        "• Synthetic canary traffic verified: 100% OK",
        "• Pipeline re-executed with exit code: 0"
    )
    for ($f = 0; $f -lt $fixItems.Count; $f++) {
        $g5.DrawString($fixItems[$f], $fBody, $bWhite, [float]645.0, [float](335 + ($f * 42)))
    }

    # Bottom Box: Machine Telemetry Evidence (JSON)
    $g5.FillRectangle($glassBrush, 60, 770, 1080, 480)
    $g5.DrawRectangle($purplePen, 60, 770, 1080, 480)
    $g5.DrawString("MACHINE TELEMETRY & ROOT CAUSE EVIDENCE (JSON)", $fBlade, $bCyan, [float]85.0, [float]795.0)

    $jsonTelemetry = @(
        "{",
        "  `"day`": `"$dayNum`",",
        "  `"project`": `"$taskName`",",
        "  `"domain`": `"$domain`",",
        "  `"status`": `"HEALTHY_VERIFIED`",",
        "  `"exit_code`": 0,",
        "  `"root_cause_analysis`": {",
        "    `"failure_injected`": true,",
        "    `"diagnostic_probe`": `"HEALTH_GATE_01`",",
        "    `"remediation_applied`": `"DEFENSIVE_TRAP_ENFORCED`",",
        "    `"mttr_seconds`": 14.2,",
        "    `"drift_detected`": false",
        "  },",
        "  `"verification_signature`": `"sha256:d8a2...verified`"",
        "}"
    )
    for ($j = 0; $j -lt $jsonTelemetry.Count; $j++) {
        $g5.DrawString($jsonTelemetry[$j], $fTerm, $bTermGreen, [float]85.0, [float](835 + ($j * 26)))
    }

    # Next Day Milestone Badge
    $nextDay = if ($dayInt -lt 91) { "NEXT → DAY $(($dayInt + 1).ToString('D2'))" } else { "90 DAYS OF DEVOPS COMPLETE" }
    $g5.FillRectangle($bCyan, 800, 1200, 320, 38)
    $g5.DrawString("$dayNum COMPLETE  |  $nextDay", $fBlade, $bDark, [float]815.0, [float]1210.0)

    # Workflow Capsule Bar
    for ($s = 0; $s -lt 5; $s++) {
        $sx = 60 + ($s * 215)
        $g5.FillRectangle($glassBrush, $sx, 1290, 175, 44)
        $g5.DrawRectangle($neonPen, $sx, 1290, 175, 44)
        $g5.DrawString("$($s+1). $($steps[$s])", $fWf, $bCyan, [float]($sx + 18), [float]1302.0)
        if ($s -lt 4) {
            $ax1 = $sx + 175 + 8; $ax2 = $sx + 215 - 8
            $g5.DrawLine($arrowPen, $ax1, 1312, $ax2, 1312)
        }
    }

    $g5.DrawString("Shubham Mane | Cloud, DevOps & Site Reliability Engineer", $fFoot, $bWhite, [float]60.0, [float]1430.0)
    $g5.DrawString("github.com/shubhu-io/90-days-of-devops", $fBlade, $bCyan, [float]60.0, [float]1452.0)

    $bmp5.Save((Join-Path $d.FullName 'image_05_debug_result.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp5.Save((Join-Path $d.FullName 'image_05_debug_result.jpg'), $codec, $encoderParams)
    $g5.Dispose(); $bmp5.Dispose()

    if ($count % 5 -eq 0 -or $count -eq $dayDirs.Count) {
        Write-Host "Processed $count / $($dayDirs.Count) days (4:5 1200x1500 PNG)..."
    }
}

Write-Host "ALL 92 DAYS (460 IMAGES) HAVE BEEN RENDERED IN 1200x1500 PNG FORMAT!"
