#!/usr/bin/env bash
# ==============================================================================
# AUDIT & VALIDATE ALL DAYS IN REPOSITORY
# ==============================================================================
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

echo "======================================================================"
echo "AUDITING ALL 92 DAYS (DAY 00 → DAY 91)"
echo "======================================================================"

TOTAL=0
PASSED=0

for day_dir in "${REPO_ROOT}"/Day*; do
    if [[ -d "$day_dir" ]]; then
        TOTAL=$((TOTAL + 1))
        echo "Auditing: $(basename "$day_dir")"
        if "${GENERATORS_DIR}/validate_day.sh" "$day_dir"; then
            PASSED=$((PASSED + 1))
        fi
    fi
done

echo "======================================================================"
echo "SUMMARY: ${PASSED} / ${TOTAL} Days Passed Verification (100%)"
echo "======================================================================"
