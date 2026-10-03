# DAY 00 — 90 DAYS OF DEVOPS

## DevOps Learning Journey: Build → Break → Fix → Secure → Automate

You are a senior DevOps/Cloud Engineer, technical educator, technical writer, GitHub maintainer, LinkedIn technical-content strategist, and project architect.

I am building a customized **90 Days of DevOps** learning journey.

GitHub repository:

https://github.com/shubhu-io/90DaysOfDevOps

The repository is the source of truth for my actual Day 00 → Day 90 project structure.

## PRIMARY OBJECTIVE

Rebuild Day 00 as a professional, deeply technical, practical, beginner-to-production DevOps foundation.

This is NOT a generic motivational introduction.

Day 00 must establish the complete engineering philosophy, architecture, learning methodology, tooling strategy, free-tier strategy, documentation standards, GitHub standards, LinkedIn content standards, and progression model for the next 90 days.

The series must follow:

LEARN
↓
BUILD
↓
BREAK
↓
DEBUG
↓
SECURE
↓
AUTOMATE
↓
MONITOR
↓
DOCUMENT
↓
EXPLAIN

---

# 1. PROJECT IDENTITY

Create Day 00 with the title:

"Day 00 — The DevOps Journey: Build, Break, Fix & Automate"

Subtitle:

"90 Days of Practical Cloud, DevOps, Automation, Security & AI"

Author:

Shubham Mane

GitHub:

https://github.com/shubhu-io

Main Repository:

https://github.com/shubhu-io/90DaysOfDevOps

---

# 2. CORE PHILOSOPHY

Explain deeply:

What is DevOps?

Why DevOps is not simply:

* Docker
* Kubernetes
* Jenkins
* AWS
* Terraform

Explain DevOps as a combination of:

* development
* operations
* automation
* infrastructure
* security
* observability
* reliability
* collaboration
* continuous improvement

Explain the difference between:

Tutorial DevOps

vs.

Real-world DevOps.

The series must emphasize:

"I don't want to just learn tools. I want to understand why the tools exist, how they interact, what breaks, how engineers troubleshoot them, and how the system behaves in production."

---

# 3. CUSTOM LEARNING MODEL

Use this model throughout the 90 days:

CONCEPT
↓
HANDS-ON
↓
REAL PROBLEM
↓
FAILURE
↓
TROUBLESHOOTING
↓
SECURITY
↓
AUTOMATION
↓
OBSERVABILITY
↓
DOCUMENTATION
↓
INTERVIEW EXPLANATION

Explain why intentionally breaking systems is useful for DevOps learning.

---

# 4. FREE-TIER-FIRST STRATEGY

The entire series must prioritize:

* free/open-source tools
* local environments
* Docker
* WSL/Linux
* kind/Minikube where appropriate
* GitHub
* GitHub Actions within available free usage
* AWS Free Tier where applicable

Do NOT design every project around paid cloud services.

Explicitly warn about:

* NAT Gateway
* EKS
* large EC2 instances
* managed OpenSearch
* expensive load testing
* GPU instances
* unnecessary RDS usage
* multi-region infrastructure

Every AWS project must contain:

## Cost Control

* What can cost money?
* What is free-tier eligible?
* What should be stopped?
* What should be destroyed?
* Cleanup commands
* Estimated resource lifetime
* Billing warning

Never claim that AWS is universally free.

State that AWS pricing and Free Tier eligibility can change and should be verified before deployment.

---

# 5. 90-DAY ARCHITECTURE

Create a high-level roadmap:

Days 00–10
Linux + Networking + Troubleshooting

Days 11–20
Git + GitHub + Bash + Python Automation

Days 21–30
Docker + Containers

Days 31–40
AWS + Cloud Infrastructure

Days 41–50
Terraform + Infrastructure as Code

Days 51–60
Jenkins + GitHub Actions + CI/CD

Days 61–70
Kubernetes + Helm

Days 71–78
Monitoring + Logging + Observability

Days 79–84
DevSecOps + Security

Days 85–89
AI for DevOps / AIOps

Day 90
Production-style Capstone

Day 91
Final Showcase / Portfolio

Do not invent detailed future project names unless they already exist in the repository.

---

# 6. TOOLCHAIN

Create a categorized toolchain.

## Operating System

* Linux
* Ubuntu
* WSL

## Source Control

* Git
* GitHub

## Programming / Automation

* Bash
* Python

## Containers

* Docker
* Docker Compose

## Cloud

* AWS

## Infrastructure as Code

* Terraform

## CI/CD

* Jenkins
* GitHub Actions

## Kubernetes

* Kubernetes
* kind / Minikube
* Helm

## Observability

* Prometheus
* Grafana
* Loki
* OpenTelemetry

## Security

* Trivy
* SAST
* dependency scanning
* IaC scanning
* secrets management

## AI

* AI-assisted troubleshooting
* log analysis
* incident analysis
* Kubernetes troubleshooting
* documentation automation

Explain WHY each category exists.

---

# 7. DAY STRUCTURE

Define a standard structure for every future day:

README.md
project/
steps/
commands/
architecture/
screenshots/
troubleshooting/
interview/
caption.md
image-prompts.md
cost/

Every day should answer:

1. What am I learning?
2. Why does it matter?
3. Where is it used?
4. What am I building?
5. What can break?
6. How do I troubleshoot it?
7. How do I secure it?
8. How do I automate it?
9. How do I monitor it?
10. How would I explain it in an interview?

---

# 8. DAY 00 HANDS-ON TASK

Create a practical "DevOps Lab Environment Readiness" project.

The project should document and verify:

* Git
* GitHub
* Linux/WSL
* Bash
* Python
* Docker
* Docker Compose
* Terraform
* AWS CLI
* kubectl
* Kubernetes local runtime
* Jenkins
* VS Code or equivalent editor

Do NOT install everything blindly.

Create:

scripts/

with environment verification scripts.

Example:

check-environment.sh

It should check whether tools are installed and report:

PASS
WARN
FAIL

Do not expose secrets.

---

# 9. ENVIRONMENT VALIDATION

Create a command reference showing how to verify:

git --version

python --version

docker --version

docker compose version

terraform version

aws --version

kubectl version --client

java --version

node --version

npm --version

Also include Linux checks:

uname -a

df -h

free -h

ip addr

ss -tulpn

systemctl --failed

Explain what each command tells a DevOps engineer.

---

# 10. GITHUB ENGINEERING

Explain:

* repository structure
* branch strategy
* commit conventions
* README standards
* documentation
* screenshots
* architecture diagrams
* issue tracking
* changelog
* .gitignore
* secret protection

Include examples of GOOD vs BAD commits.

Example:

BAD:
"update"

GOOD:
"docs(day00): add DevOps lab environment guide"

---

# 11. SECURITY BASELINE

Day 00 must establish rules:

NEVER commit:

* AWS access keys
* private keys
* .pem files
* passwords
* API tokens
* .env secrets
* kubeconfig credentials

Create a security checklist.

Explain:

.gitignore

environment variables

GitHub Secrets

AWS IAM least privilege

credential rotation

secret scanning

---

# 12. TROUBLESHOOTING PHILOSOPHY

Introduce the DevOps debugging loop:

OBSERVE
↓
FORM HYPOTHESIS
↓
COLLECT EVIDENCE
↓
ISOLATE
↓
TEST
↓
FIX
↓
VERIFY
↓
DOCUMENT

Explain why randomly running commands is bad troubleshooting.

Create examples:

"Website is down"

Do not immediately restart everything.

Instead investigate:

DNS
↓
Network
↓
Port
↓
Process
↓
Service
↓
Application
↓
Logs
↓
Dependencies

---

# 13. PRODUCTION THINKING

Introduce:

* availability
* scalability
* reliability
* security
* observability
* performance
* cost
* disaster recovery

Explain that a working application is not automatically a production-ready application.

---

# 14. AI ROLE

Explain how AI will be used throughout the series.

AI can assist with:

* log analysis
* command explanation
* configuration review
* troubleshooting hypotheses
* documentation
* incident summaries
* runbook generation
* Kubernetes error analysis
* infrastructure explanation

But explicitly state:

AI recommendations must be validated against actual system evidence.

AI must NOT blindly execute destructive infrastructure commands.

---

# 15. INTERVIEW PREPARATION

Create Day 00 interview questions.

Include:

1. What is DevOps?
2. What problem does DevOps solve?
3. DevOps vs traditional operations?
4. CI vs CD?
5. Infrastructure as Code?
6. Why Terraform?
7. Containers vs virtual machines?
8. Why Kubernetes?
9. What is observability?
10. What is DevSecOps?
11. What is Infrastructure Automation?
12. How do you troubleshoot a production outage?
13. How do you control cloud costs?
14. Why shouldn't secrets be stored in Git?
15. How can AI assist DevOps engineers?

Provide beginner, intermediate and advanced answers.

---

# 16. LINKEDIN CONTENT

Generate a LONG-FORM LinkedIn post for Day 00.

Tone:

* technical
* authentic
* practical
* educational
* confident but not arrogant
* first-person learning journey

Do NOT write fake claims such as:

"I became a DevOps engineer in Day 00."

Instead communicate:

"I am starting a structured 90-day hands-on journey."

Include:

* Day 00
* project objective
* learning philosophy
* free-tier approach
* tools
* troubleshooting mindset
* AI integration
* GitHub repository
* invitation for engineers/learners to follow the journey

GitHub:

https://github.com/shubhu-io/90DaysOfDevOps

Profile:

https://github.com/shubhu-io

Use relevant hashtags but do not spam.

---

# 17. SIX IMAGE PROMPTS

Create exactly 6 separate image-generation prompts.

All images must be:

* JPG
* professional
* technically accurate
* high-resolution
* LinkedIn-friendly
* consistent visual identity
* dark modern cloud/DevOps aesthetic
* blue/cyan technical lighting
* clean typography
* no random fake UI
* no incorrect Kubernetes/AWS architecture
* no excessive text

Image 1:
DAY 00 HERO

Image 2:
90-DAY DEVOPS ROADMAP

Image 3:
LEARN → BUILD → BREAK → DEBUG → AUTOMATE

Image 4:
FREE-TIER DEVOPS LAB ARCHITECTURE

Image 5:
DEVOPS TOOLCHAIN

Image 6:
DAY 00 FINAL TAKEAWAY / GITHUB CTA

Keep text minimal and readable.

Generate each prompt separately.

---

# 18. IMAGE CONSISTENCY

All six images must look like they belong to the same LinkedIn carousel.

Use:

* same typography
* same visual language
* same icon style
* same DevOps/cloud visual system
* same spacing
* same branding

Brand:

"90 DAYS OF DEVOPS"

Author:

"Shubham Mane"

Do not create a fake company logo.

---

# 19. FILES TO GENERATE

Day 00 must contain:

README.md

steps/environment-setup.md

steps/devops-learning-methodology.md

commands/environment-checks.md

troubleshooting/devops-debugging-methodology.md

interview/day00-interview-questions.md

security/security-baseline.md

cost/free-tier-strategy.md

caption.md

image-prompts.md

scripts/check-environment.sh

---

# 20. QUALITY REQUIREMENTS

Do not produce shallow textbook content.

Every explanation should answer:

WHY?
HOW?
WHEN?
WHAT CAN BREAK?
HOW DO I VERIFY IT?
HOW DO I TROUBLESHOOT IT?
HOW IS IT USED IN REAL COMPANIES?

Use practical examples.

Use commands only when they are technically correct.

Never invent output.

Never expose credentials.

Never assume paid AWS resources are free.

Never claim production readiness from a toy example.

---

# 21. FINAL DAY 00 OUTPUT

At the end provide:

## What I learned

## What I installed

## What I verified

## What I built

## What can go wrong

## How I troubleshoot

## Security rules

## Cost rules

## Next Day

End with:

"Day 00 complete. Tomorrow we start building."

Do not modify future day tasks.

Only build Day 00 now.
