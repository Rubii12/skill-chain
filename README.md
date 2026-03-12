# ⛓️ SkillChain — Decentralized AI-Driven Skill Verification for Hiring

> *Built for ORIGIN Hackathon · Team Clashers · Easwari Engineering*

[![License: MIT](https://img.shields.io/badge/License-MIT-cyan.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Prototype-magenta.svg)]()
[![Stack](https://img.shields.io/badge/Stack-MERN%20%2B%20FastAPI%20%2B%20Solidity-blue.svg)]()

---

## 🚨 The Problem

Traditional resumes are static, easily inflated, and impossible to verify quickly. Manual background checks take weeks. Credential fraud is rampant. Grades don't reflect real coding ability.

**SkillChain eliminates all of this.**

---

## ✅ Our Solution

SkillChain is a decentralized platform where a student's GitHub repositories are analyzed by AI, scored for real technical proficiency, and the result is permanently anchored on the blockchain as a **Soulbound Token (SBT)** — non-transferable and tamper-proof.

Recruiters can verify any candidate's skills **instantly**, with zero trust required.

---

## 🎬 Demo

> 📹 [Watch the Demo Video](https://www.loom.com/share/40ba04c593014591b2fe11d286403f76) 
> 🌐 [Live Prototype](./frontend/prototype/skillchain_prototype.html) — open in browser

---

## 🏗️ Architecture

```
┌─────────────────┐     ┌──────────────────────┐     ┌───────────────────────┐     ┌──────────────────────┐
│  Layer 1        │────▶│  Layer 2              │────▶│  Layer 3              │────▶│  Layer 4             │
│  Data Intake    │     │  Intelligence Engine  │     │  Trust Layer          │     │  Interface Layer     │
│  GitHub API     │     │  FastAPI + Python AST │     │  Solidity Smart       │     │  MERN Dashboard      │
│                 │     │                       │     │  Contracts (SBTs)     │     │  React.js            │
└─────────────────┘     └──────────────────────┘     └───────────────────────┘     └──────────────────────┘
```

---

## 🛠️ Tech Stack

| Layer      | Technology                        |
|------------|-----------------------------------|
| Frontend   | React.js, Tailwind CSS            |
| Backend    | Node.js / Express, FastAPI        |
| Database   | MongoDB                           |
| Blockchain | Solidity, Ethers.js               |
| AI / ML    | Python, AST libraries             |
| Auth       | GitHub OAuth 2.0, JWT             |

---

## 📁 Repository Structure

```
skillchain/
├── frontend/               # React.js student & recruiter dashboards
│   ├── src/
│   │   ├── components/     # Reusable UI components
│   │   ├── pages/          # Student, Recruiter, Verify views
│   │   └── hooks/          # Custom React hooks
│   └── prototype/          # Interactive HTML prototype (demo-ready)
│
├── backend/
│   ├── fastapi/            # Python AI analysis engine
│   │   └── routers/        # /analyze, /score endpoints
│   └── node/               # Node.js user management API
│       └── routes/         # Auth, profiles, repo management
│
├── blockchain/
│   └── contracts/          # Solidity smart contracts (SBT issuance)
│
└── docs/                   # Architecture diagrams, API docs
```

---

## ⚙️ Key Features

### 🔬 AI-Powered Code Auditing
- FastAPI engine clones GitHub repositories via API
- Python `ast` module parses the Abstract Syntax Tree of every file
- Scores: logic complexity, design pattern depth, error handling quality

### 🛡️ AI-Generated Code Detection
- AST stylometry flags "perfect" code patterns typical of LLMs (ChatGPT, Copilot)
- Structural plagiarism check compares logic flows against known repositories
- Logic-to-Human Mapping detects absence of human coding artifacts

### ⛓️ Soulbound Token (SBT) Issuance
- Verified skill scores submitted to Solidity smart contract
- SBT minted: permanent, non-transferable, cryptographically anchored
- Unique `VerificationHash` generated per candidate per repository

### 🗺️ Live Skill Heatmaps
- Replaces PDF resume with real-time visualization
- Skill bars per technology, composite score ring
- Blockchain TX hash and block number displayed

### 👤 Recruiter Portal
- Filter verified candidates by tech stack (MERN, Python, Java, Solidity)
- View full skill breakdown, SBT status, and verification hash
- Instant on-chain audit — no middleman

---

## 🚀 Getting Started

### Prerequisites
- Node.js v18+
- Python 3.10+
- MongoDB
- MetaMask wallet (for blockchain interactions)

### 1. Clone the repo
```bash
git clone https://github.com/your-username/skillchain.git
cd skillchain
```

### 2. Run the prototype (no setup needed)
```bash
open frontend/prototype/skillchain_prototype.html
```

### 3. Backend setup *(in progress)*
```bash
# Node.js API
cd backend/node && npm install && npm run dev

# FastAPI AI Engine
cd backend/fastapi && pip install -r requirements.txt && uvicorn main:app --reload
```

### 4. Blockchain *(in progress)*
```bash
cd blockchain && npx hardhat compile
```

---

## 🗺️ Implementation Roadmap

| Phase | Description | Status |
|-------|-------------|--------|
| Phase 1 | FastAPI scraper — Java & JavaScript AST analysis | 🔄 In Progress |
| Phase 2 | Solidity Smart Contract — SBT issuance on testnet | 🔄 In Progress |
| Phase 3 | MERN Dashboard — Skill Heatmap + blockchain connect | ✅ Prototype Ready |
| Phase 4 | Integration testing, UI polish, deployment | 📅 Planned |

---

## 👥 Team

| Name | Role |
|------|------|
| Rubika A | Team Leader · Full-Stack |
| Niranjan S | Backend · AI/ML |
| Jitendar S | Blockchain · Smart Contracts |

**Institution:** Easwari Engineering
**Hackathon:** ORIGIN — Place to Start

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.
