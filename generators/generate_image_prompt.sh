#!/usr/bin/env bash
# ==============================================================================
# GENERATE 8K TECHNICAL IMAGE PROMPTS (MIDJOURNEY V6 / FLUX.1)
# ==============================================================================
set -euo pipefail

DAY_NUM="${1:-Day01}"
TASK_NAME="${2:-Linux Server Health Monitor}"
TOPIC="${3:-Linux System Administration}"

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

cat <<EOF
# ${DAY_NUM} — Premium 8K Technical Visuals Specification & AI Prompts

**Project**: ${TASK_NAME}  
**Series**: ${SERIES_NAME}  
**Author**: ${AUTHOR_NAME} (${GITHUB_PROFILE})  
**Topic**: ${TOPIC}  
**Visual Style**: Dark futuristic DevOps / Cloud / SRE environment. Professional, technical, cinematic, intelligent, and modern.  
**Resolution**: 8K, 1:1 Aspect Ratio (1080x1080 / 2160x2160)

---

## 🎨 Image 01 — Cinematic 3D Hero Environment (image_01_hero.jpg)
- **Prompt**:
  > *Cinematic 3D render of an enterprise cloud infrastructure node representing ${TASK_NAME}. Volumetric dark cyan (#00f2fe) and deep blue (#3b82f6) atmospheric lighting, glowing neon data cables, holographic telemetry HUD rings floating in mid-air displaying zero-drift metrics. High-end isometric perspective, Octane Render, raytracing reflections, subtle lens flare, depth of field, ultra-sharp focus on the server hardware, dark obsidian metallic textures, 8k resolution, engineering blueprint aesthetic. --ar 1:1 --stylize 250*

---

## 🎨 Image 02 — 3D Architecture Topology Diagram (image_02_architecture.jpg)
- **Prompt**:
  > *Detailed 3D isometric architectural cloud topology diagram for ${TASK_NAME}. Five distinct floating isometric glass platforms labeled Client Ingress, Security Gateway, Core Engine, Production Workload, and Telemetry Sink connected by glowing neon cyan and purple data highways with light packets. Clean technical labels, subtle blueprint grid floor, dark futuristic operations center aesthetic, photorealistic lighting, 8k. --ar 1:1 --stylize 200*

---

## 🎨 Image 03 — Concept Visualization: The Inner Mechanism (image_03_concept.jpg)
- **Prompt**:
  > *A visual mechanism diagram explaining the internal transformation of ${TASK_NAME}. Exploded isometric view with four glowing cubic stages: Raw Input, Defensive Parsing, Assertion Gates, and Evidence Emission interconnected by glowing energy conduits. Vibrant neon blue and purple gradients, floating technical metrics, glassmorphic HUD elements, clean data visualization, 8k. --ar 1:1 --stylize 220*

---

## 🎨 Image 04 — Live Terminal Cockpit & Execution (image_04_execution.jpg)
- **Prompt**:
  > *Authentic developer terminal cockpit window floating in 3D space displaying real execution output for ${TASK_NAME}. Syntax-highlighted CLI prompt, green status indicators, real command telemetry, exit code: 0 assertion badge, dark glassmorphism terminal frame with subtle window reflections, 8k resolution. --ar 1:1 --stylize 180*

---

## 🎨 Image 05 — Break & Debug Failure RCA (image_05_debug_result.jpg)
- **Prompt**:
  > *High-tech incident debugging and RCA dashboard for ${TASK_NAME}. Bold holographic headline reading "DON'T GUESS. INVESTIGATE.", side-by-side failure injection analysis card (crimson warning) and remediation self-healing card (emerald green), machine telemetry JSON payload at the base, sleek dark telemetry console, 8k resolution. --ar 1:1 --stylize 200*
EOF
