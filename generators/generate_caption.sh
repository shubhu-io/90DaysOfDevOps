#!/usr/bin/env bash
# ==============================================================================
# GENERATE LINKEDIN CAPTION (WITH DEDICATED PROJECT LINK SLOT)
# ==============================================================================
set -euo pipefail

DAY_NUM="${1:-Day01}"
TASK_NAME="${2:-Linux Server Health Monitor}"
TOPIC="${3:-Linux System Administration}"

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

cat <<EOF
🚀 DAY ${DAY_NUM#Day} / 90: ${TASK_NAME}

Today's milestone focuses on ${TOPIC}.
In production engineering, theory is cheap. Real SREs solve problems by getting their hands dirty:

🔥 WHAT WE BUILT TODAY:
• Production architecture for ${TASK_NAME}
• Automated zero-drift validation engine
• Defensive signal traps & deterministic failure handling

💥 WHAT BROKE (FAILURE INJECTION):
We intentionally injected production failure into the pipeline.
No guessing allowed. We inspected raw kernel signals and traces to identify the exact bottleneck.

🔍 ROOT CAUSE & RESOLUTION:
• Core Rule: DON'T GUESS. INVESTIGATE.
• Remediation applied, self-healing triggered, and full telemetry emitted.
• Final Verification: Exit Code 0 with structured JSON logs.

👉 Project Link: [PASTE YOUR PROJECT LINK HERE]
🔗 Master Repository: ${REPO_BASE}
👤 Author: ${AUTHOR_NAME} (${GITHUB_PROFILE})

#DevOps #SRE #CloudEngineering #Kubernetes #Linux #Automation #PlatformEngineering #90DaysOfDevOps
EOF
