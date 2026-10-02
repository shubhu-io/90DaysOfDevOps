#!/usr/bin/env bash
# ==============================================================================
# VALIDATE INTEGRITY OF A SINGLE DAY FOLDER
# ==============================================================================
set -euo pipefail

TARGET_DIR="${1:-.}"
source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

echo "[VALIDATE] Auditing: ${TARGET_DIR}"

REQUIRED_FILES=(
    "task.md"
    "step.md"
    "execution.md"
    "caption.md"
    "caption.txt"
    "image-prompts.md"
    "checklist.md"
    "README.md"
    "image_01_hero.jpg"
    "image_02_architecture.jpg"
    "image_03_concept.jpg"
    "image_04_execution.jpg"
    "image_05_debug_result.jpg"
    "slide_01_cover.svg"
    "slide_02_architecture.svg"
    "slide_03_code.svg"
    "slide_04_debug.svg"
    "slide_05_summary.svg"
    "linkedin_graphic.svg"
)

MISSING=0
for f in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "${TARGET_DIR}/${f}" ]]; then
        echo "  [ERROR] Missing required file: ${f}"
        MISSING=$((MISSING + 1))
    fi
done

# Check screenshot directory
if [[ ! -d "${TARGET_DIR}/screenshots" ]]; then
    echo "  [ERROR] Missing screenshots directory"
    MISSING=$((MISSING + 1))
fi

# Check link slot in caption
if grep -q "👉 Project Link: \[PASTE YOUR PROJECT LINK HERE\]" "${TARGET_DIR}/caption.txt"; then
    echo "  [OK] Dedicated single-day project link slot verified"
else
    echo "  [ERROR] caption.txt is missing single-day project link slot"
    MISSING=$((MISSING + 1))
fi

if [[ $MISSING -eq 0 ]]; then
    echo "  [STATUS] PERFECT (100% Validated)"
    exit 0
else
    echo "  [STATUS] FAILED with ${MISSING} errors"
    exit 1
fi
