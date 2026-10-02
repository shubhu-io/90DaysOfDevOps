#!/usr/bin/env bash
# ==============================================================================
# RENDER 5 HIGH-RESOLUTION 8K-STYLED IMAGES FOR A GIVEN DAY
# ==============================================================================
set -euo pipefail

TARGET_DIR="${1:-.}"
source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "${SCRIPT_DIR}/generate_images_8k.ps1" -TargetDir "${TARGET_DIR}"
