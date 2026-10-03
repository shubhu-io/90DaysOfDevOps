# Day 00 — 90 Days of DevOps Grand Roadmap, Toolchain & Challenge Launch

## 📌 Project Overview
- **Day Number**: Day 00 / 91
- **Project Name**: 90 Days of DevOps Grand Launch & Toolchain Architecture
- **Primary Topic**: The Complete DevOps, Cloud & SRE Engineering Roadmap (2026 → 2027)
- **Edition**: 2026 → 2027
- **Author**: Shubham Mane ([GitHub Profile](https://github.com/shubhu-io))
- **GitHub Repository**: [https://github.com/shubhu-io/90-days-of-devops/tree/main/Day00%20-%20DevOps%20Challenge%20Tracker%20%26%20Workspace](https://github.com/shubhu-io/90-days-of-devops/tree/main/Day00%20-%20DevOps%20Challenge%20Tracker%20%26%20Workspace)
- **Status**: ✅ Active & Launch Ready

---

## 🎯 The Core Philosophy: Why 90 Days of DevOps?
Most tech challenges fail because they treat DevOps as a collection of disjointed syntax exercises or isolated GUI clicks. In true enterprise production environments:
1. **Theory is Fragile**: Tutorials work on clean slides; real clusters break under kernel packet drops, socket exhaustion, and OOM killer events.
2. **Deterministic Engineering**: We build systems with version-controlled code, declarative infrastructure, and automated self-healing.
3. **The 4-Part Mandate**:
   - **BUILD**: Write real code, Dockerfiles, Kubernetes manifests, and Terraform DAGs.
   - **BREAK**: Deliberately inject simulated production incidents (network partition, latency injection, crash loops).
   - **DEBUG**: Trace root cause using real logs, Prometheus metrics, and kernel signals (*"DON'T GUESS. INVESTIGATE."*).
   - **VERIFY**: Emit machine-readable telemetry (`telemetry_report.json`) proving Exit Code 0.

---

## 🛠️ The Complete 90-Day Production Toolchain Landscape
Across the next 90 days, we master the entire modern cloud-native ecosystem:

### 1. Linux Kernel & Shell Systems (Days 01–05)
- Linux Kernel internals: `cgroups`, `namespaces`, `sysctl`, `/proc`, `/sys`.
- Defensive Bash scripting: `set -euo pipefail`, signal traps (`trap cleanup EXIT INT TERM`).
- Low-level network & process auditing: `ss`, `lsof`, `strace`, `dmesg`, `iostat`.
- Python 3.12 SDKs: Building custom CLI audit daemons and Docker/Kubernetes API inspectors.

### 2. Containers & Kubernetes Orchestration (Days 06–18)
- Multi-stage, zero-vulnerability container builds using `gcr.io/distroless/static:nonroot`.
- Kubernetes core primitives: Deployments, StatefulSets, DaemonSets, ConfigMaps, Secrets.
- Advanced Pod lifecycle: Liveness, Readiness, and Startup probes, resource requests/limits.
- Helm charts, Kustomize overlays, and local cluster testing with Kind and Minikube.

### 3. Infrastructure as Code & Cloud Engineering (Days 19–30)
- Terraform / OpenTofu: Enterprise remote state locking with AWS S3 + DynamoDB.
- Infrastructure modularization, dynamic loops, and zero-drift state assertion.
- Ansible: Idempotent configuration management, Jinja2 templating, and automated role testing.
- Multi-cloud architecture, AWS VPC peering, route tables, and FinOps cost optimization with Infracost.

### 4. CI/CD Automation & GitOps Deployment (Days 31–42)
- GitHub Actions: Multi-arch Buildx matrices (amd64 + arm64), automated testing gates.
- GitOps deployment controllers: ArgoCD and Flux syncing declarative Git state to Kubernetes.
- Progressive delivery patterns: Canary deployments and Blue/Green zero-downtime traffic switching.

### 5. Observability, Telemetry & SRE Operations (Days 43–54)
- Metrics collection: Prometheus server, Alertmanager notification routing, node_exporter.
- Distributed tracing: OpenTelemetry (OTel Collector), W3C trace context propagation, Jaeger.
- Log aggregation & shipper: FluentBit, Loki, Logstash, structured JSON formatting.
- Executive SRE dashboards: Grafana visualization with SLO/SLI error budget monitoring.

### 6. DevSecOps, Identity & Supply Chain Security (Days 55–66)
- Container vulnerability scanning: Trivy, Grype, automated GitHub Security Gates.
- Software Bill of Materials (SBOM): CycloneDX generation with Syft.
- Cryptographic container signing & provenance verification: Sigstore Cosign.
- Static Application Security Testing (SAST): SonarQube quality gates and secret scanners (gitleaks).
- Kubernetes admission controllers: Policy enforcement with OPA Gatekeeper and Kyverno.

### 7. Chaos Engineering, Resilience & High Availability (Days 67–78)
- Fault injection: Chaos Mesh pod-kill, network latency, and CPU burn experiments.
- High-availability database clusters: PostgreSQL streaming replication with automated failover.
- Reliable event streaming & message brokers: Apache Kafka consumer lag and RabbitMQ dead-letter exchanges.
- Distributed caching: Redis cluster with cache-aside patterns and eviction policies.

### 8. Incident Response, Disaster Recovery & Runbooks (Days 79–87)
- Multi-region disaster recovery: Automated cross-region RTO/RPO recovery runners.
- Incident command & runbooks: Blameless post-mortem templates, PagerDuty webhooks.
- Traffic management: Istio service mesh mutual TLS (mTLS) enforcement and Envoy filters.

### 9. Engineering Excellence, Retrospectives & Capstone (Days 88–91)
- Automated testing pyramids: Unit, integration, and contract testing gates in CI/CD.
- Code review automation, technical debt management, and synthetic test data generators.
- Master capstone synthesis: The unified 90-day production retrospective.

---

## 💥 The Daily Failure Challenge ("WHAT CAN BREAK?")
Every single day introduces a deliberate failure scenario:
- **Why?** Senior engineers aren't judged by how fast they write code—they are judged by how effectively they respond when systems crash at 2:00 AM.
- **The Axiom**: *"DON'T GUESS. INVESTIGATE."*
- Every daily folder includes:
  - `simulate_failure.sh` — Injects realistic failure conditions (signal 137 OOM, connection refused, locked state, expired certificate).
  - `self_healing_runner.sh` — The automated defensive mechanism and signal trap that detects the degradation and recovers automatically.

---

## 📦 Deliverables for Day 00
1. `README.md` — The complete 90-day roadmap, toolchain inventory, and workspace setup guide.
2. `task.md` — This architectural specification and philosophy manifesto.
3. `step.md` — Automated multi-toolchain verification script and repository scaffold.
4. `execution.md` — Verified toolchain environment output (Git, Docker, Kubectl, Terraform ready).
5. `caption.txt` / `caption.md` — Viral Day 00 launch post ready for LinkedIn.
6. `image-prompts.md` — Midjourney v6 / FLUX.1 prompts for the 90-day launch visuals.
7. 5 Campaign Visual Slides & Infographic (`slide_01_cover.svg` to `slide_05_summary.svg`, `linkedin_graphic.jpg`).
8. 5 High-Resolution Images (`image_01_hero.jpg` to `image_05_debug_result.jpg`).
9. Dedicated `./screenshots/` workspace for terminal proof.
