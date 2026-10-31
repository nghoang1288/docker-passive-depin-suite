#!/usr/bin/env bash
set -euo pipefail

echo "=================================================================="
echo " 🌐 Installing Docker Passive DePIN Suite"
echo "=================================================================="

# Check Docker and Docker Compose
if ! command -v docker >/dev/null 2>&1; then
    echo "❌ Docker is not installed. Please install Docker first: https://get.docker.com"
    exit 1
fi

INSTALL_DIR="${HOME}/passive-depin-suite"
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"

# Download compose and env
echo "📥 Fetching configuration files..."
curl -sSL -o docker-compose.yml https://raw.githubusercontent.com/nghoang1288/docker-passive-depin-suite/main/docker-compose.yml
if [ ! -f .env ]; then
    curl -sSL -o .env https://raw.githubusercontent.com/nghoang1288/docker-passive-depin-suite/main/.env.example
    echo "⚠️ Created template .env file at ${INSTALL_DIR}/.env. Please edit with your credentials!"
fi

echo "🚀 Ready! To start background containers:"
echo "   cd ${INSTALL_DIR}"
echo "   nano .env"
echo "   docker compose up -d"
echo "=================================================================="
