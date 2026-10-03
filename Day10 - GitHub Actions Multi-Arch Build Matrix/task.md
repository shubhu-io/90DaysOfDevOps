# Day10 — Project Specification & Task

## 📌 Project Overview
- **Day Number**: Day10 / 90
- **Project Name**: GitHub Actions Multi-Arch Build Matrix
- **Primary Topic**: CI/CD & Progressive Delivery
- **Edition**: 2026 → 2027
- **Author**: Shubham Mane
- **GitHub Repository**: [https://github.com/shubhu-io/90-days-of-devops/tree/main/Day10%20-%20GitHub%20Actions%20Multi-Arch%20Build%20Matrix](https://github.com/shubhu-io/90-days-of-devops/tree/main/Day10%20-%20GitHub%20Actions%20Multi-Arch%20Build%20Matrix)
- **Status**: ✅ Complete & Verified

---

## 🎯 Real-World Problem
ARM64 cloud instances (AWS Graviton) fail when executed with x86 compiled binaries due to architecture instruction mismatch.

In production cloud infrastructure without deterministic automation:
1. Long-running serial builds increase developer feedback loops to hours, drastically slowing deployment velocity.
2. Deployments without automated progressive traffic shifting risk taking down 100% of users on unforeseen edge-case bugs.
3. Unasserted system state leads to unpredictable cascade failures across dependent services.

---

## 🚀 Daily Objective
Engineer and validate a production-ready **GitHub Actions Multi-Arch Build Matrix** that:
1. Engineer a GitHub Actions multi-architecture build matrix compiling for both linux/amd64 and linux/arm64 in parallel.
2. Utilize Docker BuildKit with QEMU binfmt emulation to cross-compile and publish multi-arch OCI manifest lists.
3. Implement automated canary traffic shifting with progressive verification of error rate thresholds.
4. Configure automatic pipeline abort and instantaneous traffic rollback if P99 latency breaches 15ms.

---

## 💥 What Can Break? (Failure Challenge)
- **Failure Scenario**: Native x86 binary deployed to ARM64 Graviton node crashed on boot with 'Exec format error' (exit code 126).
- **Root Cause**: CI pipeline lacked multi-architecture cross-compilation matrix and multi-platform manifest publishing.

---

## 🔍 How Will I Debug & Resolve It?
1. Inspect binary ELF headers using 'file app' and identify architecture mismatch against target host.
2. Integrate 'docker/setup-qemu-action' and 'docker/setup-buildx-action' into GitHub Actions matrix.
3. Validate multi-arch manifest list using 'docker buildx imagetools inspect' confirming arm64 and amd64 entries.

---

## 📦 Deliverables & Evidence
1. **step.md** — Step-by-step setup and code implementation guide.
2. **execution.md** — Terminal execution logs and verification evidence.
3. **caption.txt / caption.md** — Professional LinkedIn post ready for publication.
4. **image-prompts.md** — Technical prompts for editorial carousel slides.
5. **slide_01_cover.svg to slide_05_summary.svg** — High-resolution SVG slides.
6. **linkedin_graphic.jpg** — Master architectural infographic.
7. **image_01_hero.png to image_05_debug_result.png** — Master 1200x1500 high-graphical visual assets.