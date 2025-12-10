#!/bin/bash
set -e

echo ""
echo "'proje-start' çalışıyor..."
echo ""

# -----------------------------------------------------
# NODE SÜRÜM KONTROLÜ
# -----------------------------------------------------
if ! command -v node &> /dev/null; then
  echo "Node.js yüklü değil. Kurulum iptal edildi."
  exit 1
fi

NODE_MAJOR=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)

if [ "$NODE_MAJOR" -lt 18 ]; then
  echo "Node 18 veya üzeri gerekiyor. Mevcut sürüm: $(node -v)"
  exit 1
fi

echo "Node sürümü uygun: $(node -v)"

# -----------------------------------------------------
# PNPM KONTROLÜ
# -----------------------------------------------------
if ! command -v pnpm &> /dev/null; then
  echo "pnpm yüklü değil. Yüklemek için: npm i -g pnpm"
  exit 1
fi

echo "pnpm bulundu."

# -----------------------------------------------------
# KLASÖR YAPISI
# -----------------------------------------------------
echo "Klasör yapısı oluşturuluyor..."

mkdir -p public/{styles,images,icons,js,assets}
mkdir -p src/{modules,utils,services}

# -----------------------------------------------------
# GIT INIT (Husky'den önce zorunlu)
# -----------------------------------------------------
if [ ! -d .git ]; then
  echo "Git repository oluşturuluyor..."
  git init
fi

# -----------------------------------------------------
# PAKETLER
# -----------------------------------------------------
echo "ESLint, Prettier, Husky, lint-staged kuruluyor..."

pnpm add -D \
  eslint \
  prettier \
  eslint-config-prettier \
  eslint-plugin-prettier \
  eslint-plugin-import \
  husky \
  lint-staged

# -----------------------------------------------------
# PRETTIER CONFIG
# -----------------------------------------------------
echo ".prettierrc.json oluşturuluyor..."

cat > .prettierrc.json << 'EOF'
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 80,
  "tabWidth": 2,
  "arrowParens": "avoid",
  "bracketSameLine": false
}
EOF

# -----------------------------------------------------
# ESLINT CONFIG
# -----------------------------------------------------
echo ".eslintrc.cjs oluşturuluyor..."

cat > .eslintrc.cjs << 'EOF'
module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true
  },
  extends: [
    "eslint:recommended",
    "plugin:import/recommended",
    "plugin:prettier/recommended"
  ],
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module"
  },
  rules: {}
};
EOF

# -----------------------------------------------------
# PACKAGE.JSON SCRIPTLER + TYPE MODULE
# -----------------------------------------------------
echo "package.json scriptleri ekleniyor..."

pnpm pkg set scripts.lint="eslint . --fix"
pnpm pkg set scripts.format="prettier --write ."
pnpm pkg set scripts.prepare="husky"
pnpm pkg set type="module"

# -----------------------------------------------------
# VSCODE AYARLARI
# -----------------------------------------------------
echo ".vscode/settings.json oluşturuluyor..."

mkdir -p .vscode

cat > .vscode/settings.json << 'EOF'
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  },
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ]
}
EOF

# -----------------------------------------------------
# EDITORCONFIG
# -----------------------------------------------------
echo ".editorconfig oluşturuluyor..."

cat > .editorconfig << 'EOF'
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
EOF

# -----------------------------------------------------
# PRETTIERIGNORE
# -----------------------------------------------------
echo ".prettierignore oluşturuluyor..."

cat > .prettierignore << 'EOF'
node_modules
dist
build
.next
coverage
pnpm-lock.yaml
.vscode
EOF

# -----------------------------------------------------
# GITIGNORE
# -----------------------------------------------------
echo ".gitignore oluşturuluyor..."

cat > .gitignore << 'EOF'
node_modules/
dist/
build/
.env
.env.local
.idea
.vscode/*.json
.DS_Store
EOF

# -----------------------------------------------------
# HUSKY KURULUMU (2025 Güncel)
# -----------------------------------------------------
echo "Husky kuruluyor..."

npx husky init

echo "npx lint-staged" > .husky/pre-commit
chmod +x .husky/pre-commit

# -----------------------------------------------------
# LINT-STAGED CONFIG
# -----------------------------------------------------
echo ".lintstagedrc.json oluşturuluyor..."

cat > .lintstagedrc.json << 'EOF'
{
  "*.{js,jsx,ts,tsx}": [
    "eslint --fix",
    "prettier --write"
  ]
}
EOF

# -----------------------------------------------------
# BİTTİ
# -----------------------------------------------------
echo ""
echo "proje-start tamamlandı."
echo ""
