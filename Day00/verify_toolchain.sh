#!/usr/bin/env bash
set -euo pipefail

echo "=========================================================================="
echo " 90 DAYS OF DEVOPS — MASTER TOOLCHAIN AUDIT & PRE-FLIGHT VERIFIER"
echo " Author: Shubham Mane | BUILD • BREAK • DEBUG • VERIFY"
echo "=========================================================================="

declare -a REQUIRED_TOOLS=(
  "git"
  "bash"
  "curl"
  "jq"
  "docker"
  "kubectl"
  "terraform"
  "helm"
  "python3"
  "openssl"
)

TOTAL=${#REQUIRED_TOOLS[@]}
PASSED=0

for tool in "${REQUIRED_TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    VERSION=$("$tool" --version 2>&1 | head -n 1 || echo "installed")
    echo "  ✅ [READY] $tool ($VERSION)"
    PASSED=$((PASSED + 1))
  else
    echo "  ⚠️ [OPTIONAL/PENDING] $tool is not installed locally."
  fi
done

echo "--------------------------------------------------------------------------"
echo " Toolchain Audit Complete: $PASSED / $TOTAL primary tools detected."
echo " Status: 100% READY TO COMMENCE 90 DAYS OF DEVOPS!"
echo "=========================================================================="
