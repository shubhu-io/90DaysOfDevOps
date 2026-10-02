# ==============================================================================
# Master Catalog Builder for 92 Days of DevOps (Day 00 -> Day 91)
# 100% Unique Metadata: Commands, Architecture, HUD Metrics, Failure & Fixes
# Author: Shubham Mane (https://github.com/shubhu-io)
# ==============================================================================

$catalogPath = Join-Path $PSScriptRoot 'master_catalog_all_92.json'
Write-Host "Constructing 92-Day Unique Master Catalog..."

$days = [System.Collections.Generic.List[PSObject]]::new()

function New-DayItem {
    param(
        [int]$Day,
        [string]$DayStr,
        [string]$Project,
        [string]$Domain,
        [string]$Tool,
        [string]$Cli,
        [array]$Hud,
        [array]$ArchNodes,
        [array]$ArchSpecs,
        [array]$ConceptPillars,
        [string]$Axiom,
        [array]$TerminalOutput,
        [array]$WhatBroke,
        [array]$HowFixed,
        [array]$JsonTelemetry
    )

    $item = [PSCustomObject]@{
        day = $Day
        dayStr = $DayStr
        project = $Project
        domain = $Domain
        tool = $Tool
        cli = $Cli
        hud = $Hud
        archNodes = $ArchNodes
        archSpecs = $ArchSpecs
        conceptPillars = $ConceptPillars
        axiom = $Axiom
        terminalOutput = $TerminalOutput
        whatBroke = $WhatBroke
        howFixed = $HowFixed
        jsonTelemetry = $JsonTelemetry
    }
    $script:days.Add($item)
}

# ==============================================================================
# PHASE 1: FOUNDATIONS & LINUX (Days 00 - 15)
# ==============================================================================

# DAY 00
New-DayItem -Day 0 -DayStr "Day00" `
    -Project "DevOps Challenge Tracker & Workspace" `
    -Domain "DevOps Scaffolding & Engineering Foundations" `
    -Tool "DEVOPS TOOLCHAIN RUNNER" `
    -Cli "bash verify_toolchain.sh --all --strict --json" `
    -Hud @(
        @{ title="TOTAL DAYS"; val="92 MODULES"; sub="Day 00 -> Day 91"; col="#00f2fe" },
        @{ title="VISUAL ASSETS"; val="460 IMAGES"; sub="100% 4:5 Vertical PNG"; col="#10b981" },
        @{ title="TOOLCHAINS"; val="18 PLATFORMS"; sub="Docker, K8s, TF, Linux"; col="#38bdf8" },
        @{ title="AUDIT GATES"; val="100% PASS"; sub="Strict Exit Code 0"; col="#00f2fe" },
        @{ title="FAIL INJECTIONS"; val="91 SCENARIOS"; sub="Root Cause Verified"; col="#10b981" },
        @{ title="LEAD ENGINEER"; val="SHUBHAM MANE"; sub="github.com/shubhu-io"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. REPO SCAFFOLD"; sub="Git Tree Init"; tag="GIT_INIT" },
        @{ name="2. ENV VALIDATOR"; sub="Toolchain Check"; tag="PREFLIGHT" },
        @{ name="3. CORE ENGINE"; sub="Workspace Daemon"; tag="WORKSPACE" },
        @{ name="4. AUDIT SENTINEL"; sub="CI Markdown Lint"; tag="CI_GATE" },
        @{ name="5. TELEMETRY SINK"; sub="Progress Matrix"; tag="TRACKER" }
    ) `
    -ArchSpecs @(
        "• Repository Scaffolding: Deterministic 92-day directory hierarchy with standard schemas",
        "• Preflight Checks: Automated verification of Git, Docker, Kubernetes, Terraform & AWS CLI",
        "• Quality Gates: Strict markdown linting and XML validation on all generated SVG diagrams",
        "• State Tracking: Single-source-of-truth progress matrix updated deterministically",
        "• Compliance: 100% adherence to enterprise Git repository architecture standards"
    ) `
    -ConceptPillars @(
        @{ title="1. SCAFFOLDING"; desc="Directory Generation`nStrict Naming Standard`nTask Metadata Schema`nGit Tracking Setup" },
        @{ title="2. PREFLIGHT"; desc="Toolchain Assertions`nDependency Validation`nPython & Shell Runtimes`nZero Host Drift" },
        @{ title="3. QUALITY GATE"; desc="Markdown Anchor Check`nSVG XML Integrity`nCode Syntax Linting`nPre-Commit Hooks" },
        @{ title="4. COMPENDIUM"; desc="Progress Matrix Synced`nTelemetry Emitted`nPublic Portfolio Sync`nVerified Exit Code 0" }
    ) `
    -Axiom "A 90-day engineering challenge without automated verification is just wishful thinking.`nDeterministic workspace governance and pre-commit checks eliminate human bookkeeping drift.`nEngineering excellence begins before the first line of application code is committed." `
    -TerminalOutput @(
        @("shubham@prod-sre:~/workspace$ bash verify_toolchain.sh --all --strict --json", "#38bdf8"),
        @("[2026-10-02 17:00:01] [INIT] Initializing 90 Days of DevOps workspace verification...", "#94a3b8"),
        @("[CHECK: GIT]        Git v2.44+ detected • branch: main • clean working tree", "#4ade80"),
        @("[CHECK: DOCKER]     Docker Engine 26.0+ • BuildKit enabled • socket healthy", "#4ade80"),
        @("[CHECK: K8S]        kubectl v1.30+ • client/server API negotiated • contexts OK", "#4ade80"),
        @("[CHECK: TERRAFORM]  Terraform v1.8+ • providers cached • remote state backend ready", "#4ade80"),
        @("[CHECK: LINUX]      Ubuntu 24.04 LTS (Kernel 6.8.0) • eBPF & cgroups v2 active", "#4ade80"),
        @("[AUDIT: REPO]       92 Day directories verified against master architecture specification", "#4ade80"),
        @("[AUDIT: ASSETS]     460 Ultra-High Definition 1200x1500 visual assets validated", "#4ade80"),
        @("[EVIDENCE] Writing master progress telemetry to ./overall-progress.md ...", "#fbbf24"),
        @("[SUCCESS] All 18 pre-flight developer tools passed automated readiness verification.", "#4ade80"),
        @("[SUCCESS] Campaign initialization completed deterministically with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Unchecked directory naming drift broke markdown link anchors across documentation",
        "• Inconsistent relative file paths caused broken references in index tables",
        "• Malformed SVG XML syntax escaped pre-commit inspection",
        "• Non-standardized task.md headers prevented automated progress aggregation",
        "• Toolchain version mismatches caused build failures in downstream CI runners"
    ) `
    -HowFixed @(
        "• Engineered deterministic PowerShell/Bash directory scaffolding engine",
        "• Enforced strict System.Xml.XmlDocument validation in pre-commit git hooks",
        "• Built automated link verification test suite asserting 100% reference resolution",
        "• Implemented standardized task.md and caption.txt metadata extraction schemas",
        "• Validated all 92 day workspaces with single-command master verification runner"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 0,",
        "  `"campaign`": `"90 Days of DevOps (2026 -> 2027)`",",
        "  `"author`": `"Shubham Mane`",",
        "  `"modules_scaffolded`": 92,",
        "  `"visual_assets_validated`": 460,",
        "  `"toolchains_verified`": [`"git`", `"docker`", `"k8s`", `"terraform`", `"linux`"],",
        "  `"zero_drift_status`": true,",
        "  `"status`": `"PORTFOLIO_LAUNCH_ONLINE`",",
        "  `"exit_code`": 0",
        "}"
    )

# DAY 01
New-DayItem -Day 1 -DayStr "Day01" `
    -Project "Linux Server Health Monitor" `
    -Domain "Linux, Shell & DevOps Foundations" `
    -Tool "LINUX SYSTEM MONITOR" `
    -Cli "bash monitor.sh --strict --threshold-cpu=80 --json" `
    -Hud @(
        @{ title="CPU UTIL"; val="14.2% (16 Cores)"; sub="Load: 0.42, 0.38, 0.31"; col="#00f2fe" },
        @{ title="RAM BUFFER"; val="4.1 GB / 32 GB"; sub="Buff/Cache: 9.4 GB Free"; col="#10b981" },
        @{ title="NVMe DISK"; val="24% (1.3 TB Free)"; sub="I/O Latency: 0.18ms"; col="#38bdf8" },
        @{ title="INODES"; val="342K / 12.8M (3%)"; sub="Zero Inode Exhaustion"; col="#00f2fe" },
        @{ title="ZOMBIES"; val="0 PROCESSES"; sub="SIGCHLD Handled Clean"; col="#10b981" },
        @{ title="UPTIME"; val="48 DAYS 14 HRS"; sub="Zero Kernel Panic"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. KERNEL /PROC"; sub="loadavg, meminfo"; tag="SYS_PROBE" },
        @{ name="2. BASH MONITOR"; sub="set -euo pipefail"; tag="MONITOR_DAEMON" },
        @{ name="3. THRESHOLD ENGINE"; sub="CPU > 80, Inode > 90"; tag="ASSERT_GATE" },
        @{ name="4. EMERGENCY BUFFER"; sub="Ramdisk Fallback"; tag="RECOVERY" },
        @{ name="5. METRIC SINK"; sub="health_report.json"; tag="TELEMETRY" }
    ) `
    -ArchSpecs @(
        "• Data Collection: Direct kernel metrics polled from /proc/loadavg and /proc/meminfo without overhead",
        "• Storage Isolation: Telemetry logs written to dedicated tmpfs ramdisk to survive 100% root disk fill",
        "• Inode Protection: Proactive monitoring of filesystem inode exhaustion alongside raw block capacity",
        "• Signal Handling: Trapped SIGTERM and ERR signals to emit emergency webhook before process exit",
        "• Determinism: Strict threshold assertions exiting 0 on healthy and 1 on SLA breach"
    ) `
    -ConceptPillars @(
        @{ title="1. /PROC PROBES"; desc="/proc/loadavg`n/proc/meminfo`n/proc/stat CPU ticks`ndf -i inode audit" },
        @{ title="2. DEFENSIVE TRAP"; desc="set -euo pipefail`ntrap 'emergency_log' ERR`ntmpfs isolated buffer`nZero stdout leak" },
        @{ title="3. THRESHOLD ASSERT"; desc="CPU > 80% Alert`nRAM Free < 15% Trap`nDisk Usage > 85% Warning`nInode > 90% Block" },
        @{ title="4. JSON EVIDENCE"; desc="telemetry_report.json`nTimestamped RFC3339`nPrometheus node_exporter`nDeterministic Exit 0" }
    ) `
    -Axiom "If your monitoring daemon crashes when disk reaches 100%, you don't have monitoring—you have an illusion.`nAlways isolate telemetry logging to volatile memory or dedicated partitions.`nDeterministic exit codes allow upstream orchestrators to initiate automated self-healing." `
    -TerminalOutput @(
        @("shubham@prod-sre:~$ bash monitor.sh --strict --threshold-cpu=80 --json", "#38bdf8"),
        @("[2026-10-02 17:05:01] [INFO] Reading kernel parameters from /proc filesystem...", "#94a3b8"),
        @("[PROBE: CPU]    1-min load: 0.42 (16 physical cores available) -> [OK: 14.2%]", "#4ade80"),
        @("[PROBE: MEM]    Total: 32768MB | Free: 18420MB | Buff/Cache: 9410MB -> [HEALTHY]", "#4ade80"),
        @("[PROBE: DISK]   Mount: / (NVMe) | Used: 24% | Inodes: 3% used -> [NORMAL]", "#4ade80"),
        @("[PROBE: UPTIME] System running for 48d 14h 22m without kernel errors -> [OK]", "#4ade80"),
        @("[CHECK: TRAP]   Signal traps verified on SIGHUP, SIGINT, SIGTERM, and ERR -> [ARMED]", "#4ade80"),
        @("[EVIDENCE] Writing structured telemetry to /var/log/health_report.json ...", "#fbbf24"),
        @("[SUCCESS] All system resource boundaries verified within operational SLA.", "#4ade80"),
        @("[SUCCESS] Health daemon run finished deterministically with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Silent disk exhaustion caused monitoring script to abort without alerting SRE on-call",
        "• Probe wrote logs to the same partition it monitored; 100% disk killed the alerting daemon",
        "• Raw df block checks passed while inode table hit 100%, rejecting all new files",
        "• Zombie processes accumulated unnoticed due to unhandled SIGCHLD signals",
        "• Memory fragmentation triggered sudden OOM killer termination on critical services"
    ) `
    -HowFixed @(
        "• Isolated monitoring telemetry to volatile tmpfs ramdisk (/run/shm/telemetry)",
        "• Added dual-metric disk checks evaluating both block allocation and inode capacity",
        "• Enforced set -euo pipefail with signal traps emitting emergency out-of-band alerts",
        "• Configured reserved memory headroom (vm.min_free_kbytes=65536) in sysctl.conf",
        "• Implemented automated child process reaping handling SIGCHLD asynchronously"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 1,",
        "  `"project`": `"Linux Server Health Monitor`",",
        "  `"cpu_util_pct`": 14.2,",
        "  `"mem_available_mb`": 18420,",
        "  `"disk_used_pct`": 24,",
        "  `"inode_used_pct`": 3,",
        "  `"zombies`": 0,",
        "  `"isolation_layer`": `"tmpfs_ramdisk`",",
        "  `"status`": `"HEALTHY_VERIFIED`",",
        "  `"exit_code`": 0",
        "}"
    )

# DAY 02
New-DayItem -Day 2 -DayStr "Day02" `
    -Project "Linux Process & Socket Auditor" `
    -Domain "Linux System Internals & Networking" `
    -Tool "KERNEL SOCKET AUDITOR" `
    -Cli "ss -tulpn --summary && lsof -i :8080" `
    -Hud @(
        @{ title="SOCKET STATE"; val="412 ESTABLISHED"; sub="0 In CLOSE_WAIT Trap"; col="#00f2fe" },
        @{ title="TIME_WAIT"; val="84 SOCKETS"; sub="tcp_tw_reuse Active"; col="#10b981" },
        @{ title="FD LIMIT"; val="1024 / 65536 (1.5%)"; sub="ulimit -n Optimized"; col="#38bdf8" },
        @{ title="ORPHAN FDS"; val="0 DETACHED"; sub="lsof +L1 Verified Clean"; col="#00f2fe" },
        @{ title="ZOMBIE REAPER"; val="SIGCHLD ARMED"; sub="Surgical Kill Enabled"; col="#10b981" },
        @{ title="NETLINK PROBE"; val="ss KERNEL API"; sub="Zero Netstat Deprecation"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. KERNEL TCP TABLE"; sub="Netlink Socket API"; tag="NETLINK" },
        @{ name="2. SS CONNECTOR"; sub="ss -tulpn state"; tag="SOCKET_PROBE" },
        @{ name="3. FD ANALYZER"; sub="/proc/<pid>/fd"; tag="FD_SCANNER" },
        @{ name="4. REAPER ENGINE"; sub="SIGTERM -> SIGKILL"; tag="REAPER" },
        @{ name="5. AUDIT EXPORTER"; sub="socket_audit.json"; tag="TELEMETRY" }
    ) `
    -ArchSpecs @(
        "• Netlink Querying: Uses kernel-space netlink sockets via ss instead of deprecated /proc/net/tcp scanning",
        "• File Descriptor Tracking: Correlates active TCP sockets with open file handles in /proc/<pid>/fd",
        "• Socket Exhaustion Defense: Monitors ephemeral port depletion and CLOSE_WAIT connection leaks",
        "• Zombie Mitigation: Automated reaper sends graceful SIGTERM followed by surgical SIGKILL after 5s",
        "• Security Hardening: Tunes /etc/security/limits.conf soft/hard FD bounds defensively"
    ) `
    -ConceptPillars @(
        @{ title="1. NETLINK PROBES"; desc="ss -tan state established`nss -tan state close-wait`nTCP window audit`nEphemeral port range" },
        @{ title="2. /PROC/<PID>/FD"; desc="lsof -i :8080`nls -l /proc/$pid/fd`nDetect leaked handles`nCatch deleted sockets" },
        @{ title="3. REAPER LOGIC"; desc="Detect zombie PPID=1`nSend SIGTERM to parent`nEnforce 5s grace period`nIssue surgical SIGKILL" },
        @{ title="4. KERNEL TUNING"; desc="fs.file-max = 2097152`nsoft/hard nofile 65535`ntcp_tw_reuse = 1`nDeterministic Exit 0" }
    ) `
    -Axiom "A rogue socket stuck in CLOSE_WAIT will bring down a microservice cluster faster than a DDoS attack.`nCLOSE_WAIT is an application-level bug; TIME_WAIT is a network-tuning issue.`nAlways monitor kernel file descriptor tables before hitting OS-level EMFILE exhaustion." `
    -TerminalOutput @(
        @("shubham@prod-sre:~$ ss -tulpn | awk '{print $1,$2,$5}' | head -n 8", "#38bdf8"),
        @("[2026-10-02 17:08:12] [INIT] Auditing kernel TCP connection tables and socket states...", "#94a3b8"),
        @("Netid  State       Local Address:Port", "#fbbf24"),
        @("tcp    LISTEN      0.0.0.0:22               (sshd, pid=812)", "#4ade80"),
        @("tcp    LISTEN      127.0.0.1:5432           (postgres, pid=1420)", "#4ade80"),
        @("tcp    LISTEN      0.0.0.0:8080             (app-server, pid=3142)", "#4ade80"),
        @("tcp    LISTEN      127.0.0.1:9090           (prometheus, pid=1980)", "#4ade80"),
        @("[CHECK: SOCKETS]   Established: 412 | TIME_WAIT: 84 | CLOSE_WAIT: 0 -> [OPTIMAL]", "#4ade80"),
        @("[CHECK: FDS]       Process 3142 using 82 / 65536 file descriptors -> [HEALTHY]", "#4ade80"),
        @("[CHECK: ZOMBIES]   Scanning process tree for defunct processes: 0 found -> [OK]", "#4ade80"),
        @("[EVIDENCE] Exporting socket audit metrics to ./socket_audit.json ...", "#fbbf24"),
        @("[SUCCESS] Kernel connection tables verified healthy with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Unclosed HTTP connection pool created 4,200 orphaned sockets stuck in CLOSE_WAIT",
        "• Application breached ulimit -n limit, throwing 'Too many open files' (EMFILE) panic",
        "• Host kernel refused all new incoming TCP handshakes while CPU stayed at 5%",
        "• Zombie processes accumulated under PID 1, exhausting Linux pid_max capacity",
        "• Stale file descriptors held onto deleted log files, preventing disk space reclamation"
    ) `
    -HowFixed @(
        "• Configured explicit HTTP connection pool timeouts and socket close handlers",
        "• Elevated system-wide and user limits in /etc/security/limits.conf (nofile: 65536)",
        "• Automated ss socket state probe alerting when CLOSE_WAIT count exceeds 25",
        "• Deployed zombie reaper script cleaning up orphaned processes asynchronously",
        "• Tuned net.ipv4.tcp_tw_reuse=1 to safely recycle TIME_WAIT sockets under heavy load"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 2,",
        "  `"project`": `"Linux Process & Socket Auditor`",",
        "  `"established_sockets`": 412,",
        "  `"close_wait_leaks`": 0,",
        "  `"time_wait_sockets`": 84,",
        "  `"open_file_descriptors`": 82,",
        "  `"max_file_descriptors`": 65536,",
        "  `"zombie_processes`": 0,",
        "  `"status`": `"SOCKET_TABLES_CLEAN`",",
        "  `"exit_code`": 0",
        "}"
    )

# DAY 03
New-DayItem -Day 3 -DayStr "Day03" `
    -Project "Automated Log Rotation & Archive Daemon" `
    -Domain "System Administration & Storage Operations" `
    -Tool "LOGROTATE COMPRESSION DAEMON" `
    -Cli "logrotate -d /etc/logrotate.d/production-app" `
    -Hud @(
        @{ title="ROTATION POLICY"; val="HOURLY / SIZE-BASED"; sub="Trigger: > 500 MB"; col="#00f2fe" },
        @{ title="GZIP COMPRESSION"; val="88% RATIO"; sub="1.4 GB -> 168 MB"; col="#10b981" },
        @{ title="RETENTION WINDOW"; val="30-DAY COMPLIANCE"; sub="Auto-Prune Active"; col="#38bdf8" },
        @{ title="ATOMIC HANDLER"; val="copytruncate ACTIVE"; sub="Zero Dropped Lines"; col="#00f2fe" },
        @{ title="STORAGE SAVED"; val="38.4 GB / DAY"; sub="Secondary Tier Move"; col="#10b981" },
        @{ title="INODE RECLAIM"; val="100% RELEASED"; sub="lsof +L1: Zero Orphan"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. ACTIVE STDOUT"; sub="/var/log/app.log"; tag="LOG_SOURCE" },
        @{ name="2. LOGROTATE DAEMON"; sub="Hourly Cron Job"; tag="ROTATOR" },
        @{ name="3. GZIP COMPRESSOR"; sub="Parallel gzip -9"; tag="COMPRESSOR" },
        @{ name="4. ARCHIVE STORAGE"; sub="Secondary Volume"; tag="COLD_STORAGE" },
        @{ name="5. AUDIT SENTINEL"; sub="Retention Pruner"; tag="PRUNER" }
    ) `
    -ArchSpecs @(
        "• Rotation Triggers: Multi-tiered evaluation using hourly schedules and 500MB size threshold gates",
        "• Atomic Truncation: copytruncate guarantees active daemons continue writing without lost descriptors",
        "• Compression Engine: Parallel multi-threaded gzip achieves 88% reduction in disk storage overhead",
        "• Retention Lifecycle: Automatic deletion of compressed log segments older than 30 days",
        "• Orphan Cleanup: Post-rotation inspection using lsof +L1 ensures deleted files release disk blocks"
    ) `
    -ConceptPillars @(
        @{ title="1. SIZE & SCHEDULE"; desc="logrotate configuration`nsize 500M trigger`nhourly rotation interval`nmissingok directive" },
        @{ title="2. ATOMIC TRUNCATE"; desc="copytruncate enabled`nCopy active buffer`nTruncate original in-place`nZero file handle lost" },
        @{ title="3. GZIP PIPELINE"; desc="compress & delaycompress`nParallel pigz execution`n88% disk space saved`nPreserve timestamps" },
        @{ title="4. COLD ARCHIVE"; desc="rotate 30 retention`nSync to Glacier tier`nReclaim raw storage`nDeterministic Exit 0" }
    ) `
    -Axiom "Uncompressed application logs are the #1 cause of self-inflicted production SEV-1 outages.`nNever use raw rm to delete an active log file; running processes will hold onto the unlinked inode.`nAlways implement atomic copytruncate to preserve continuous logging during rotation." `
    -TerminalOutput @(
        @("shubham@prod-sre:~$ logrotate -d /etc/logrotate.d/production-app", "#38bdf8"),
        @("[2026-10-02 17:10:00] [DEBUG] Reading logrotate configuration: /etc/logrotate.d/production-app", "#94a3b8"),
        @("reading config file /etc/logrotate.d/production-app", "#94a3b8"),
        @("Allocating hash table for names, 2 entries minimum", "#94a3b8"),
        @("Handling 1 logs", "#4ade80"),
        @("rotating pattern: /var/log/app/*.log 524288000 bytes (30 rotations)", "#4ade80"),
        @("empty log files are not rotated, old logs are removed", "#4ade80"),
        @("considering log /var/log/app/access.log", "#94a3b8"),
        @("  log does not need rotating (log size 142MB is below 500MB threshold)", "#fbbf24"),
        @("considering log /var/log/app/error.log", "#94a3b8"),
        @("  log needs rotating (log size 612MB is above 500MB threshold)", "#4ade80"),
        @("rotating log /var/log/app/error.log, log->rotateCount is 30", "#4ade80"),
        @("renaming /var/log/app/error.log to /var/log/app/error.log.1", "#4ade80"),
        @("compressing log with: /bin/gzip", "#4ade80"),
        @("[SUCCESS] Log rotation dry-run validated cleanly with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Naive bash cron script used plain rm to delete a 45 GB active access.log file",
        "• The active Nginx daemon held open file descriptors, keeping all 45 GB locked on disk",
        "• df showed 100% full partition while du showed disk empty, baffling junior on-call engineers",
        "• Database write-ahead logs crashed due to disk write rejection, dropping user transactions",
        "• Uncompressed text logs saturated available disk in less than 48 hours of high traffic"
    ) `
    -HowFixed @(
        "• Replaced ad-hoc deletion scripts with hardened enterprise logrotate configuration",
        "• Implemented copytruncate directive to safely zero out open log files in place",
        "• Enabled gzip compression with delaycompress to optimize immediate write performance",
        "• Added lsof +L1 check to automated monitoring to alert on unlinked open file handles",
        "• Scheduled automated secondary backup sync before cold log segment purging"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 3,",
        "  `"project`": `"Automated Log Rotation & Archive Daemon`",",
        "  `"rotated_files`": 1,",
        "  `"bytes_reclaimed`": 641728512,",
        "  `"compression_ratio`": 0.88,",
        "  `"retention_days`": 30,",
        "  `"unlinked_orphans`": 0,",
        "  `"status`": `"STORAGE_RECLAIMED`",",
        "  `"exit_code`": 0",
        "}"
    )

# DAY 04
New-DayItem -Day 4 -DayStr "Day04" `
    -Project "Git Pre-Commit Hook Security Scanner" `
    -Domain "DevSecOps & Code Quality" `
    -Tool "GITLEAKS / PRE-COMMIT GATE" `
    -Cli "gitleaks protect --staged --verbose --redact" `
    -Hud @(
        @{ title="HOOK GATE"; val="PRE-COMMIT ARMED"; sub=".git/hooks/pre-commit"; col="#00f2fe" },
        @{ title="SECRETS LEAKED"; val="0 DETECTED"; sub="TruffleHog & Gitleaks"; col="#10b981" },
        @{ title="REGEX RULES"; val="142 ENTERPRISE"; sub="AWS, JWT, SSH, API Keys"; col="#38bdf8" },
        @{ title="SCAN LATENCY"; val="184ms (P99)"; sub="Developer SLA: < 500ms"; col="#00f2fe" },
        @{ title="STAGED COMMITS"; val="18 FILES SCANNED"; sub="Zero Bypass Allowed"; col="#10b981" },
        @{ title="SHA INTEGRITY"; val="CLEAN GIT TREE"; sub="Zero Force-Push Drift"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. DEV STAGING"; sub="git add file.py"; tag="STAGING" },
        @{ name="2. PRE-COMMIT HOOK"; sub="Hook Executable"; tag="TRIGGER" },
        @{ name="3. GITLEAKS SCANNER"; sub="Entropy & Regex"; tag="SCANNER" },
        @{ name="4. COMMIT ABORT GATE"; sub="Exit 1 on Match"; tag="ABORT_TRAP" },
        @{ name="5. SECURE REPO"; sub="Signed Git Commit"; tag="CLEAN_REPO" }
    ) `
    -ArchSpecs @(
        "• Shift-Left Defense: Scans staged git diffs on developer machine before commit objects are written",
        "• Multi-Engine Detection: Combines Shannon entropy analysis with 142 enterprise regex patterns",
        "• Non-Zero Exit Trap: Returns exit code 1 to instantly abort git commit upon credential detection",
        "• Performance Target: Scans complete staging trees in under 200ms to eliminate developer friction",
        "• Centralized Governance: Hook managed declaratively via .pre-commit-config.yaml with auto-updates"
    ) `
    -ConceptPillars @(
        @{ title="1. GIT DIFF HOOK"; desc="git diff --staged`nCatch added chunks`nIgnore deleted lines`nZero network lag" },
        @{ title="2. ENTROPY & REGEX"; desc="Shannon entropy check`nAKIA AWS Key pattern`nPrivate key PEM headers`nHigh-randomness tokens" },
        @{ title="3. REJECTION GATE"; desc="Abort commit tree`nEcho red alert banner`nMask secret in output`nExit code 1 trap" },
        @{ title="4. CLEAN REPO TREE"; desc="Zero tainted history`nPrevent secret leaks`nDeveloper notified`nDeterministic Exit 0" }
    ) `
    -Axiom "Once an API key is committed to Git history, changing the password is easy—finding where it leaked is impossible.`nDefense against credential leakage must happen locally at the developer terminal before git push.`nAutomated pre-commit gates turn security compliance into an invisible developer reflex." `
    -TerminalOutput @(
        @("shubham@prod-sre:~/repo$ gitleaks protect --staged --verbose --redact", "#38bdf8"),
        @("[2026-10-02 17:12:04] [INIT] Evaluating git staged diff against 142 security rules...", "#94a3b8"),
        @("[GITLEAKS] Scanning 18 staged files across commit tree...", "#94a3b8"),
        @("[PASS] src/api/router.py: No high-entropy tokens or credentials detected", "#4ade80"),
        @("[PASS] config/production.yaml: Environment references sanitized with ${ENV_VAR}", "#4ade80"),
        @("[PASS] tests/test_auth.py: Mock tokens match test regex fixture whitelist", "#4ade80"),
        @("[SCAN: ENTROPY] Max entropy score: 3.14 bits (Threshold: 4.50 bits) -> [SAFE]", "#4ade80"),
        @("[CHECK: KEY_PATTERNS] AWS_KEY: 0 | GITHUB_PAT: 0 | RSA_PRIV: 0 | SLACK_HOOK: 0", "#4ade80"),
        @("[SUCCESS] 0 leaks found across 1,842 scanned lines of staged code.", "#4ade80"),
        @("[SUCCESS] Pre-commit security verification passed with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Developer accidentally staged .env containing AWS production access keys via git add -A",
        "• Default git configuration committed credentials without warning or inspection",
        "• Repository pushed to public remote, triggering automated bot scraping within 4 minutes",
        "• Cloud credentials abused to spawn rogue GPU instances before security team revoked keys",
        "• Git history required destructive git-filter-repo purge, corrupting colleague branches"
    ) `
    -HowFixed @(
        "• Configured client-side Git pre-commit hook enforcing mandatory Gitleaks scanner execution",
        "• Added .env*, *.pem, *.key, and credentials.json to enterprise global .gitignore template",
        "• Integrated TruffleHog high-entropy detection to catch unformatted high-entropy tokens",
        "• Installed pre-receive server-side hook on GitHub to block commits if local hook was bypassed",
        "• Automated immediate AWS IAM credential revocation webhook upon detection alert"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 4,",
        "  `"project`": `"Git Pre-Commit Hook Security Scanner`",",
        "  `"staged_files_scanned`": 18,",
        "  `"secrets_detected`": 0,",
        "  `"max_entropy_score`": 3.14,",
        "  `"scan_duration_ms`": 184,",
        "  `"hook_type`": `"pre-commit`",",
        "  `"status`": `"COMMITS_VERIFIED_CLEAN`",",
        "  `"exit_code`": 0",
        "}"
    )

# DAY 05
New-DayItem -Day 5 -DayStr "Day05" `
    -Project "Python Infrastructure API Inspector" `
    -Domain "Site Reliability Engineering & Automation" `
    -Tool "PYTHON SRE INSPECTOR" `
    -Cli "python3 inspect_api.py --endpoint=https://api.internal/health --strict" `
    -Hud @(
        @{ title="HTTP STATUS"; val="200 OK"; sub="Protocol: HTTP/2 TLS 1.3"; col="#00f2fe" },
        @{ title="SSL CERTIFICATE"; val="84 DAYS VALID"; sub="Let's Encrypt Authority"; col="#10b981" },
        @{ title="LATENCY P99"; val="3.8ms"; sub="DNS: 0.8ms • TCP: 1.2ms"; col="#38bdf8" },
        @{ title="SCHEMA CONTRACT"; val="100% VALID"; sub="Strict Pydantic Assert"; col="#00f2fe" },
        @{ title="TLS CIPHERS"; val="CHACHA20-POLY1305"; sub="Zero Weak Ciphers"; col="#10b981" },
        @{ title="DEFENSIVE RETRY"; val="EXP BACKOFF"; sub="3 Retries • Jitter Active"; col="#c084fc" }
    ) `
    -ArchNodes @(
        @{ name="1. SRE RUNNER"; sub="inspect_api.py"; tag="PROBE_CLIENT" },
        @{ name="2. TLS HANDSHAKE"; sub="SSL Cert & Cipher"; tag="SECURITY_GATE" },
        @{ name="3. INGRESS API"; sub="NGINX Gateway"; tag="INGRESS" },
        @{ name="4. PYDANTIC GATE"; sub="JSON Schema Validator"; tag="SCHEMA_VALIDATOR" },
        @{ name="5. METRICS SINK"; sub="api_health.json"; tag="TELEMETRY" }
    ) `
    -ArchSpecs @(
        "• Network Diagnostics: Deconstructs latency into DNS lookup, TCP connect, and TLS handshake phases",
        "• Certificate Auditing: Inspects x509 expiration dates and alerts if validity window drops below 14 days",
        "• Contract Verification: Enforces strict Pydantic model assertions against returned JSON payloads",
        "• Resilient Transport: Implements exponential backoff retry with random jitter on 5xx status codes",
        "• Machine Telemetry: Emits RFC3339 timestamped JSON health reports for automated incident routing"
    ) `
    -ConceptPillars @(
        @{ title="1. TIMING PROFILER"; desc="DNS Lookup: 0.8ms`nTCP Handshake: 1.2ms`nTLS 1.3 Negotiate: 1.8ms`nTTFB: 3.8ms" },
        @{ title="2. SSL AUDITOR"; desc="x509 Validity Check`nTLS 1.3 Cipher Suite`nIssuer Authority Chain`nRevocation Status OCSP" },
        @{ title="3. SCHEMA ASSERT"; desc="Pydantic Model Parse`nStrict Type Assert`nReject Unknown Keys`nDrop Invalid Payloads" },
        @{ title="4. TELEMETRY SINK"; desc="Structured JSON Log`nPrometheus Metric Out`nExit Code 0 Healthy`nAlert Webhook on 5xx" }
    ) `
    -Axiom "An API health check that only tests HTTP 200 is dangerously blind to payload corruption.`nAlways validate TLS handshake latency, certificate expiration, and JSON schema contract.`nDeterministic client-side inspection catches upstream API degradation before user traffic fails." `
    -TerminalOutput @(
        @("shubham@prod-sre:~$ python3 inspect_api.py --endpoint=https://api.internal/health --strict", "#38bdf8"),
        @("[2026-10-02 17:15:22] [INIT] Initiating infrastructure API probe to https://api.internal/health", "#94a3b8"),
        @("[PROBE: DNS]     Resolved api.internal to 10.0.4.12 in 0.82ms", "#4ade80"),
        @("[PROBE: TLS]     TLS 1.3 (TLS_AES_256_GCM_SHA384) established in 1.84ms", "#4ade80"),
        @("[PROBE: CERT]    x509 Certificate valid until 2026-12-25 (84 days remaining) -> [HEALTHY]", "#4ade80"),
        @("[PROBE: HTTP]    HTTP/2 200 OK received in 3.81ms (TTFB: 2.10ms) -> [SLA OPTIMAL]", "#4ade80"),
        @("[PROBE: SCHEMA]  Pydantic schema validation: 12 fields asserted, 0 errors -> [VALID]", "#4ade80"),
        @("[PROBE: HEADERS] Strict-Transport-Security & X-Content-Type-Options present -> [SECURE]", "#4ade80"),
        @("[EVIDENCE] Writing telemetry record to ./api_health_report.json ...", "#fbbf24"),
        @("[SUCCESS] All 6 API operational criteria verified cleanly with exit code: 0", "#4ade80")
    ) `
    -WhatBroke @(
        "• Production microservice returned HTTP 200 OK with empty body due to silent database timeout",
        "• Naive curl -I health check reported service healthy while all end-user transactions failed",
        "• Expired intermediate SSL certificate blocked all mobile clients despite origin server uptime",
        "• DNS resolution timeouts caused cascading thread pool starvation across dependent services",
        "• API response schema changed unexpectedly, breaking downstream JSON deserialization"
    ) `
    -HowFixed @(
        "• Built comprehensive Python inspector asserting both HTTP status and strict JSON schema",
        "• Added proactive SSL certificate expiration alerts triggering 30 days before expiration",
        "• Implemented granular latency instrumentation tracking DNS, TCP, TLS, and TTFB phases",
        "• Enforced circuit breakers with exponential backoff retry to prevent thundering herds",
        "• Emitted machine-readable telemetry JSON to trigger automated canary rollbacks"
    ) `
    -JsonTelemetry @(
        "{",
        "  `"day`": 5,",
        "  `"project`": `"Python Infrastructure API Inspector`",",
        "  `"endpoint`": `"https://api.internal/health`",",
        "  `"status_code`": 200,",
        "  `"dns_latency_ms`": 0.82,",
        "  `"tls_latency_ms`": 1.84,",
        "  `"ttfb_ms`": 2.10,",
        "  `"cert_days_valid`": 84,",
        "  `"schema_valid`": true,",
        "  `"status`": `"API_PROBE_PASSED`",",
        "  `"exit_code`": 0",
        "}"
    )

Write-Host "Constructed Days 00-05... Proceeding with subsequent modules..."
