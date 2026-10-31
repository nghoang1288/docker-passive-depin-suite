# 🍓 Homelab, Raspberry Pi & VPS Setup Guide for Docker Passive DePIN Suite

This guide provides end-to-end instructions for deploying the **Docker Passive DePIN Suite** across different homelab environments (Raspberry Pi, Proxmox LXC, Ubuntu VPS, Synology NAS) with maximum yield and zero maintenance.

---

## 🏗️ Hardware & Architecture Compatibility

| Platform | Recommended Specs | Network Type | Est. Earnings / Month |
| :--- | :--- | :--- | :--- |
| **Raspberry Pi 3B / 4B / 5** | ARM64 / 1GB+ RAM | Residential Wi-Fi or Ethernet | $8 - $20 USD |
| **Proxmox VE (LXC Debian)** | 1 Core, 512MB RAM | Residential FTTH | $8 - $20 USD |
| **Synology / QNAP NAS** | Intel / ARM, Container Manager | Residential FTTH | $8 - $20 USD |
| **Low-Cost VPS (Hetzner, OVH)** | 1 vCPU, 1GB RAM | Datacenter / Commercial IP | $3 - $7 USD |

---

## ⚡ 1. Rapid Setup (One-Line Automated Bootstrap)

Log in to your server via SSH and execute:

```bash
curl -sSL https://raw.githubusercontent.com/nghoang1288/docker-passive-depin-suite/main/install.sh | bash
```

The script will:
1. Verify Docker & Docker Compose installation.
2. Clone the repository into `~/docker-passive-depin-suite`.
3. Set up optimal DNS failover (`8.8.8.8` & `1.1.1.1`) to prevent ISP DNS filtering.
4. Prompt for your **Honeygain** and **EarnApp** credentials.

---

## 🛠️ 2. Step-by-Step Manual Deployment

### Step 2.1: Clone & Configure
```bash
git clone https://github.com/nghoang1288/docker-passive-depin-suite.git
cd docker-passive-depin-suite
cp .env.example .env
```

### Step 2.2: Set Referral Bonus & Credentials in `.env`
Edit `.env`:
```env
# Honeygain Credentials (Use https://r.honeygain.me/ILLUS78D5A for $3 starter credit)
HONEYGAIN_EMAIL=your_email@domain.com
HONEYGAIN_PASSWORD=your_secure_password
HONEYGAIN_DEVICE=Homelab-Node-01

# EarnApp Referral Binding (https://earnapp.com/i/sdk-node-d821812a468fa80e09dc5005b63793ab)
# Leave empty on first run, claim node ID via printed container logs.
EARNAPP_UUID=
```

### Step 2.3: Launch DePIN Stack
```bash
docker compose up -d
```

### Step 2.4: Bind EarnApp Node to Your Account
Check EarnApp logs to retrieve the registration link:
```bash
docker compose logs earnapp | grep "Register node ID"
```
Example output:
```text
Register node ID for earnapp: https://earnapp.com/r/sdk-node-d821812a468fa80e09dc5005b63793ab
```
Click or paste this link into your browser to attach the node to your EarnApp dashboard.

---

## 💰 3. Maximizing Payouts via JumpTask Mode (No KYC, $0.50 Payout)

Honeygain default PayPal payout requires reaching a $20.00 threshold and identity verification.

**How to enable JumpTask No-KYC Mode:**
1. Open your Honeygain Web Dashboard.
2. Toggle the switch at the top right from **Honeygain** to **JumpTask**.
3. Connect your self-custody EVM wallet (MetaMask, Rabby, Coinbase Wallet).
4. **Benefits**:
   - Minimum payout drops from $20.00 to **$0.50**.
   - You automatically earn a **+10% revenue bonus** on all shared bandwidth.
   - Payouts are settled on-chain in JMPT (BNB Chain, Polygon, or Celo) directly to your self-custody wallet without any KYC or ID submission.

---

## 🔒 4. Production Hardening & Resource Limits

All containers in this suite come pre-configured with strict memory caps and log rotation:
```yaml
deploy:
  resources:
    limits:
      cpus: '0.25'
      memory: 128M
logging:
  driver: 'json-file'
  options:
    max-size: '10m'
    max-file: '3'
```
This prevents disk bloat and ensures zero impact on primary homelab applications (Plex, Home Assistant, Nextcloud, Immich).

---

## 📚 Referral Bonuses
- **Honeygain**: [$3 Starter Bonus](https://r.honeygain.me/ILLUS78D5A)
- **EarnApp**: [EarnApp Partner Program](https://earnapp.com/i/sdk-node-d821812a468fa80e09dc5005b63793ab)
- **Pawns.app**: [$1 Starter Bonus](https://pawns.app?r=nghoang)

Created and maintained with ❤️ by [@nghoang1288](https://github.com/nghoang1288).
