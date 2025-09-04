#!/usr/bin/env bash
set -euo pipefail

install_dir="$HOME/.local/bin"
binary_path="$install_dir/ai-cli"
mkdir -p "$install_dir"

cat > "$binary_path" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

layout_name="${AI_CLI_LAYOUT:-ai-coding}"          # your layout
naming_mode="${AI_CLI_NAMING_MODE:-basename}"      # basename | path
debug="${AI_CLI_DEBUG:-0}"

log(){ [[ "$debug" == "1" ]] && echo "[ai-cli] $*" >&2 || true; }

safe_name() {
  local s="$1"
  s="${s//[[:space:]]/-}"
  s="${s//\//-}"
  printf '%s' "$s"
}

derive_session_name() {
  case "$naming_mode" in
    basename) safe_name "$(basename "$PWD")" ;;
    path)     safe_name "${PWD/#$HOME/~}" ;;
    *) echo "Unknown AI_CLI_NAMING_MODE: $naming_mode" >&2; exit 2 ;;
  esac
}

name="$(derive_session_name)"
log "zellij: $(zellij --version 2>&1 || echo unknown)"
log "layout: $layout_name  session: $name"

# Safety: don't kill the session you're currently in.
if [[ -n "${ZELLIJ_SESSION_NAME-}" && "${ZELLIJ_SESSION_NAME}" == "$name" ]]; then
  echo "ai-cli: refusing to kill the active session '$name'. Run from outside Zellij." >&2
  exit 1
fi

# Brutal cleanup: try to remove any old session with this name (EXITED or LIVE).
# We don't check existence; we just try and ignore errors.
zellij kill-session "$name" 2>/dev/null || true
zellij delete-session "$name" 2>/dev/null || true
# tiny wait so the name is fully freed before re-create
sleep 0.1

# Fresh session with your layout (same behavior as the working alias)
exec zellij --session "$name" --new-session-with-layout "$layout_name"
EOF

chmod +x "$binary_path"

echo "Installed: $binary_path"
case ":$PATH:" in *":$install_dir:"*) : ;; *) echo 'Add to your shell config: export PATH="$HOME/.local/bin:$PATH"';; esac
echo 'Usage: cd into a project and run: ai-cli'
echo 'Options: AI_CLI_NAMING_MODE=path ai-cli   # unique path-based names'
echo '         AI_CLI_DEBUG=1 ai-cli            # verbose logs'

