# Day44 Checklist — Shift-Left SonarQube & SAST Pipeline Quality Gate

**Series**: 90 Days of DevOps (2026 → 2027 Edition)  
**Author**: Shubham Mane ([https://github.com/shubhu-io](https://github.com/shubhu-io))  
**Topic**: DevOps Engineering & Automation  
**Philosophy**: BUILD • BREAK • DEBUG • SHARE

---

## 1. 📋 Pre-Flight Prerequisites & Environment
- [ ] Operating system and required CLI tools verified (bash, curl, jq, etc.)
- [ ] Target runtime / sandbox initialized with zero ambient state
- [ ] Safe sandbox working directory created: `./workspace/` or `./scratch/`
- [ ] Defensive shell environment variables set (`set -euo pipefail`)

---

## 2. 🛠️ Implementation & Step Execution
- [ ] Read and review [task.md](task.md) specification and architecture diagram
- [ ] Follow [step.md](step.md) commands step-by-step in clean terminal session
- [ ] Implement deterministic failure handling and signal traps (`trap 'cleanup' EXIT ERR`)
- [ ] Capture live command execution output without truncation
- [ ] Confirm exit code 0 on primary task completion

---

## 3. 💥 Production Failure Challenge & Debugging
- [ ] Inject the designated failure condition / anti-pattern described in [task.md](task.md)
- [ ] Observe system breakdown telemetry and capture raw error logs
- [ ] Apply the fundamental SRE rule: **DON'T GUESS. INVESTIGATE.**
- [ ] Execute diagnostic tracing (strace / journalctl / curl probes / promql)
- [ ] Apply remediation patch and verify self-healing recovery

---

## 4. 🔍 Verification & Evidence Telemetry
- [ ] Record full session execution logs into [execution.md](execution.md)
- [ ] Verify machine telemetry JSON payload structure and timestamp
- [ ] Save terminal screenshots into [./screenshots/](./screenshots/)
- [ ] Validate all 5 carousel visual slides ([image-prompts.md](image-prompts.md))
- [ ] Confirm zero unresolved errors in final system state

---

## 5. 📢 Social Media & Documentation Deliverables
- [ ] Review [caption.txt](caption.txt) / [caption.md](caption.md)
- [ ] Insert project repository URL into `👉 Project Link: [PASTE YOUR PROJECT LINK HERE]`
- [ ] Attach the 5 high-resolution carousel visuals (image_01_hero.jpg to image_05_debug_result.jpg)
- [ ] Push code and execution evidence to GitHub
- [ ] Publish post on LinkedIn during the optimal engagement window

---

### 🏆 Sign-Off & Verification
- **Status**: [x] VERIFIED & COMPLETED
- **Engineer**: Shubham Mane
- **Verification Rule**: Zero-Drift, Exit Code 0, Fully Documented