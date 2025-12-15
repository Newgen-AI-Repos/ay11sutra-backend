#!/usr/bin/env sh
set -eu

# Install Playwright browsers and OS deps if needed (non-failing install)
# Use python -m playwright to ensure venv interpreter is used.
if command -v python >/dev/null 2>&1; then
  echo "INFO: Ensuring Playwright browsers are installed..."
  # Try the full install first; fall back to basic install.
  python -m playwright install --with-deps || python -m playwright install || true
else
  echo "WARN: python not found, skipping Playwright install"
fi

# Start the app
exec uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}
