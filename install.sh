#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${PWD}"

if [ "$SCRIPT_DIR" = "$TARGET_DIR" ]; then
  echo "Error: run this script from your project directory, not from the skills repo itself."
  echo "  cd ~/your-project"
  echo "  bash $SCRIPT_DIR/install.sh"
  exit 1
fi

echo "Installing vibe-coder skills into: $TARGET_DIR"

# Install skills (each skill folder goes into .claude/skills/)
mkdir -p "$TARGET_DIR/.claude/skills"

for skill_dir in "$SCRIPT_DIR/.claude/skills"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$TARGET_DIR/.claude/skills/$skill_name"
  mkdir -p "$dest"
  cp -r "$skill_dir"* "$dest/"
  echo "  Installed skill: $skill_name"
done

# Create product-documentation folder if it doesn't exist (never overwritten)
if [ ! -d "$TARGET_DIR/product-documentation" ]; then
  mkdir -p "$TARGET_DIR/product-documentation"
  echo "  Created: product-documentation/"
else
  echo "  Skipped: product-documentation/ already exists"
fi

echo ""
echo "Done. Open $TARGET_DIR in Claude Code to use your skills."
