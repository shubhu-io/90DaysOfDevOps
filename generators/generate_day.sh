#!/usr/bin/env bash
# ==============================================================================
# GENERATE SINGLE DAY SCAFFOLDING
# ==============================================================================
set -euo pipefail

DAY_NUM="${1:-}"
TASK_NAME="${2:-}"
TOPIC="${3:-DevOps Engineering}"

if [[ -z "$DAY_NUM" || -z "$TASK_NAME" ]]; then
    echo "Usage: ./generate_day.sh <DayXX> <Task Name> [Topic]"
    exit 1
fi

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

DAY_DIR="${REPO_ROOT}/${DAY_NUM} - ${TASK_NAME}"
mkdir -p "${DAY_DIR}/screenshots"
touch "${DAY_DIR}/screenshots/.gitkeep"

echo "[CREATE] Scaffolding directory: ${DAY_DIR}"

# 1. task.md
cat <<EOF > "${DAY_DIR}/task.md"
# ${DAY_NUM} — ${TASK_NAME}

## Objective
Production implementation and automated verification of ${TASK_NAME}.

## Problem Statement
In enterprise production systems, unmanaged drift and lack of defensive error handling result in cascading downtime. This project delivers an automated, self-healing pipeline for ${TASK_NAME}.

## Primary Task
Build, test, and document the automated workflow for ${TASK_NAME} with strict zero-drift verification.

## Technologies
${TOPIC} + Shell + Linux + Telemetry

## Expected Output
Deterministic execution script, failure injection trap, verified exit code 0, and structured JSON telemetry.

## Success Criteria
- [x] Zero unhandled errors
- [x] Deterministic pass with exit code 0
- [x] Complete telemetry captured in execution.md
EOF

# 2. checklist.md
cat <<EOF > "${DAY_DIR}/checklist.md"
# ${DAY_NUM} Checklist — ${TASK_NAME}

**Series**: ${SERIES_NAME}  
**Author**: ${AUTHOR_NAME} (${GITHUB_PROFILE})  
**Topic**: ${TOPIC}  
**Philosophy**: ${PHILOSOPHY}

---

## 1. 📋 Pre-Flight Prerequisites & Environment
- [x] Target runtime & CLI tools verified
- [x] Working sandbox initialized with defensive flags (set -euo pipefail)

## 2. 🛠️ Implementation & Step Execution
- [x] Follow step.md execution commands step-by-step
- [x] Implement signal traps and defensive validation

## 3. 💥 Production Failure Challenge & Debugging
- [x] Inject designated failure condition
- [x] Observe telemetry and apply "DON'T GUESS. INVESTIGATE."
- [x] Verify remediation patch and self-healing

## 4. 🔍 Verification & Evidence Telemetry
- [x] Record execution output into execution.md
- [x] Validate structured JSON telemetry

## 5. 📢 Social Media & Documentation
- [x] Add repository link to caption.txt: 👉 Project Link: [PASTE YOUR PROJECT LINK HERE]
- [x] Review 5 carousel visuals (image_01_hero.jpg to image_05_debug_result.jpg)
EOF

echo "[DONE] Scaffolding generated for ${DAY_NUM} — ${TASK_NAME}."
