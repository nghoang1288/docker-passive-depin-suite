# 🌐 Docker Passive DePIN Suite

> Turn your idle residential/homelab bandwidth into passive recurring income using battle-tested Docker containers.
> Minimal RAM footprint (<150MB total), resilient DNS failover, and strict resource limits.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Docker Support](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](docker-compose.yml)
[![Platform Support](https://img.shields.io/badge/Arch-x86__64%20%7C%20ARM64-green.svg)](docker-compose.yml)

---

## 💡 Overview

Many homelab enthusiasts and VPS users leave their broadband and CPU underutilized 24/7. **Docker Passive DePIN Suite** packages top-tier bandwidth monetization daemons into a unified, secure `docker-compose` stack:

| Network | Est. Monthly / IP | Payout Threshold | Payout Options | Referral Bonus Link |
| :--- | :--- | :--- | :--- | :--- |
| **Honeygain** | $5.00 - $15.00 | **$0.50** (JumpTask Web3) / $20 (PayPal) | JMPT (BSC/Polygon/Celo) / PayPal | [Get $3 Starter Bonus](https://r.honeygain.me/ILLUS78D5A) |
| **EarnApp** | $3.00 - $10.00 | **$2.50** | PayPal / Amazon Gift Card / Wise | [Join EarnApp Node](https://earnapp.com/i/sdk-node-d821812a468fa80e09dc5005b63793ab) |
| **Pawns.app** | $3.00 - $8.00 | **$5.00** | Crypto (BTC) / PayPal / Gift Cards | [Get $1 Starter Bonus](https://pawns.app?r=nghoang) |

---

## 🚀 Quick Start (60 Seconds)

### 1. One-Line Installer
```bash
curl -sSL https://raw.githubusercontent.com/nghoang1288/docker-passive-depin-suite/main/install.sh | bash
```

### 2. Manual Setup
```bash
git clone https://github.com/nghoang1288/docker-passive-depin-suite.git
cd docker-passive-depin-suite
cp .env.example .env
nano .env
```

### 3. Start Containers
```bash
docker compose up -d
```

### 4. Check Logs & Claim Nodes
```bash
docker compose ps
docker compose logs -f earnapp
```
Copy the claim link printed in the `depin-earnapp` logs and open it in your browser to bind the node to your EarnApp dashboard.

---

## 🛡️ Built-in Resilience & Production Tweaks

1. **DNS Sinkhole Bypass**: Many consumer routers or ISP DNS servers filter out `api.honeygain.com` or `earnapp.com`. All containers are explicitly configured with dual public DNS fallbacks (`8.8.8.8` & `1.1.1.1`).
2. **Resource Constraints**: Each service is capped at `0.25 vCPU` and `128MB RAM` with `json-file` log rotation (10MB max).
3. **No-KYC JumpTask Mode**: Connect your self-custody Web3 EVM wallet to Honeygain to lower the withdrawal threshold from $20 to **$0.50** with an automatic **+10% revenue boost**.

---

## 📜 License
MIT License. Created & maintained with ❤️ by [@nghoang1288](https://github.com/nghoang1288).
