# Web Baseline

Automated setup script for a clean, consistent, and scalable web development environment. Creates a standardized folder structure and configures ESLint, Prettier, and Husky out of the box.

**Stop bikeshedding. Start building.**

Web Baseline is an opinionated, production-ready setup script designed to instantly bootstrap a standardized Node.js/Web project environment.

It eliminates the repetitive manual configuration of ESLint, Prettier, Husky, and VS Code settings, enforcing a strict yet clean architecture from the very first commit.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D18-339933)

## Motivation

In a collaborative web environment, the flexibility of JavaScript often leads to inconsistency. Decisions about semicolon usage, indentation size, or folder structure can consume valuable time better spent on business logic.

This repository provides a rigid baseline to:
1.  **Enforce Consistency:** Everyone uses the same formatting and linting rules automatically.
2.  **Reduce Friction:** New developers can onboard without configuring their editors manually.
3.  **Prevent Bad Commits:** Git hooks block unformatted or erroneous code before it reaches the repository.

## Features

Running the setup script provides:

* **Structured Architecture:** Creates a scalable directory layout (`src/modules`, `services`, `utils`, `public`).
* **Code Quality:** Installs and configures **ESLint** and **Prettier** with industry-standard rules.
* **Git Hooks:** Sets up **Husky** and **lint-staged** to ensure code quality on commit.
* **Editor Configuration:** Generates a `.vscode/settings.json` file to enforce "Format on Save" for all contributors.
* **Modern Stack:** Enforces **PNPM** and ES Modules (`type: "module"`).

## Prerequisites

* **Node.js**: v18 or higher
* **PNPM**: Required for package management
* **Bash**: MacOS, Linux, or WSL (Windows Subsystem for Linux)

## Quick Start

1.  Download the script to your project root:
    ```bash
    curl -O [https://raw.githubusercontent.com/YOUR_USERNAME/web-baseline/main/setup.sh](https://raw.githubusercontent.com/YOUR_USERNAME/web-baseline/main/setup.sh)
    ```
    *(Or clone the repository and copy the file manually)*

2.  Make the script executable:
    ```bash
    chmod +x setup.sh
    ```

3.  Run the initialization:
    ```bash
    ./setup.sh
    ```

## Generated Project Structure

The script initializes the following structure:

```text
.
├── .husky/                 # Pre-commit hooks
├── .vscode/
│   └── settings.json       # Shared VS Code settings
├── public/
│   ├── assets/
│   ├── icons/
│   ├── images/
│   ├── js/
│   └── styles/
├── src/
│   ├── modules/            # Domain-specific modules
│   ├── services/           # External services/APIs
│   └── utils/              # Shared utilities
├── .editorconfig           # Universal editor configuration
├── .eslintrc.cjs           # ESLint configuration
├── .lintstagedrc.json      # Lint-staged configuration
├── .prettierrc.json        # Prettier configuration
├── package.json
└── pnpm-lock.yaml
