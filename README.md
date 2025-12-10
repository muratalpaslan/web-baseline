# Web Baseline

Automated setup script for a clean, consistent, and scalable web development environment.
Creates a standardized folder structure and configures ESLint, Prettier, and Husky out of the box.

**Stop bikeshedding. Start building.**

Web Baseline is an opinionated, production-ready bootstrapper that instantly standardizes your **Web/Node.js** project architecture.

It eliminates repetitive setup work by configuring ESLint, Prettier, Husky, and VS Code settings—enforcing a clean project structure from the very first commit.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D18-339933)
![Shell](https://img.shields.io/badge/script-bash-1f425f.svg)
![Lint](https://img.shields.io/badge/lint-eslint%20%2B%20prettier-yellow)

---

## Motivation

In collaborative environments, JavaScript's flexibility often leads to inconsistency.
Decisions about semicolons, indentation, or folder structure consume valuable time that should be spent on real features.

Web Baseline provides a rigid foundation to:

1. **Enforce Consistency:** Formatting and linting rules are automatically applied.
2. **Reduce Friction:** New developers onboard without editor setup.
3. **Prevent Bad Commits:** Git hooks block unformatted or erroneous code.

---

## Features

Running the setup script provides:

- **Structured Architecture:** Creates a scalable folder layout (`src/modules`, `services`, `utils`, `public`).
- **Code Quality:** Installs & configures **ESLint** and **Prettier** with industry-standard rules.
- **Git Hooks:** Sets up **Husky** + **lint-staged** for automatic code validation.
- **Editor Configuration:** Generates `.vscode/settings.json` to enforce “Format on Save”.
- **Modern Stack:** Enforces **PNPM**, ES Modules (`type: "module"`), and opinionated defaults.

---

## Prerequisites

- **Node.js:** 18+
- **PNPM:** Required
- **Bash:** macOS, Linux, or WSL

---

## Quick Start (Per Project)

Download the script into your project:

```bash
curl -O [https://raw.githubusercontent.com/muratalpaslan/web-baseline/main/web-baseline.sh](https://raw.githubusercontent.com/muratalpaslan/web-baseline/main/web-baseline.sh)
