#!/usr/bin/env bash
# Intentionally running without 'set -e' to demonstrate silent failure drift
echo "==> [SIMULATION] Attempting deployment with missing dependencies..."

# Call a non-existent binary to trigger exit code 127
non_existent_cloud_tool --provision-cluster || true
echo "⚠️ Silent Drift Detected: Script continued despite missing toolchain binary!"
exit 1
