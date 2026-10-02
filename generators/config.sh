#!/usr/bin/env bash
# ==============================================================================
# 90 DAYS OF DEVOPS (2026 → 2027) — MASTER CONFIGURATION
# ==============================================================================

export SERIES_NAME="90 Days of DevOps (2026 → 2027 Edition)"
export AUTHOR_NAME="Shubham Mane"
export AUTHOR_ROLE="Cloud • DevOps • AI • SRE Engineer"
export GITHUB_PROFILE="https://github.com/shubhu-io"
export REPO_BASE="https://github.com/shubhu-io/90-days-of-devops"
export PHILOSOPHY="BUILD • BREAK • DEBUG • SHARE"
export CORE_AXIOM="DON'T GUESS. INVESTIGATE."

# Root Paths
export REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PLAN_FILE="${REPO_ROOT}/90-day-plan.md"
export PROGRESS_FILE="${REPO_ROOT}/progress.md"
export OVERALL_PROGRESS_FILE="${REPO_ROOT}/overall-progress.md"
export GENERATORS_DIR="${REPO_ROOT}/generators"

# Visual Theme Colors
export COLOR_PRIMARY="#00f2fe"
export COLOR_SECONDARY="#3b82f6"
export COLOR_ACCENT="#8b5cf6"
export COLOR_SUCCESS="#10b981"
export COLOR_WARNING="#f59e0b"
export COLOR_DANGER="#ef4444"
export COLOR_BG_DARK="#030712"

echo "[CONFIG] Loaded 90 Days of DevOps configurations for ${AUTHOR_NAME}."
