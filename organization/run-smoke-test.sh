#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="${0:A:h}"
COPY_MOD_SCRIPT="${FACTORIO_COPY_MOD_SCRIPT:-$SCRIPT_DIR/copy-mod-to-variables.sh}"
BIN="${FACTORIO_BIN:-/run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Linux/bin/x64/factorio}"
CONFIG="${FACTORIO_CONFIG:-$SCRIPT_DIR/factorio-smoke-config.ini}"
MODS="${FACTORIO_MODS:-/run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Variables/mods}"
CREATE_SUCCESS_MARKER="${FACTORIO_SMOKE_CREATE_SUCCESS_MARKER:-Factorio initialised}"
LOAD_SUCCESS_MARKER="${FACTORIO_SMOKE_LOAD_SUCCESS_MARKER:-Checksum for script __level__/control.lua}"
MAP="${FACTORIO_SMOKE_MAP:-/tmp/upsidedowneye-smoke-test.zip}"
MODE="singleplayer"
MP_TIMEOUT_SECONDS="${FACTORIO_MP_SMOKE_TIMEOUT:-25}"
LOAD_TIMEOUT_SECONDS="${FACTORIO_LOAD_SMOKE_TIMEOUT:-0}"
BENCHMARK_TICKS="${FACTORIO_SMOKE_BENCHMARK_TICKS:-1}"
BENCHMARK_RUNS="${FACTORIO_SMOKE_BENCHMARK_RUNS:-1}"
SOURCE_SAVE_DIR="${FACTORIO_SOURCE_SAVE_DIR:-/run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Variables/saves}"
WORK_SAVE_DIR="${FACTORIO_WORK_SAVE_DIR:-/run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/AI/saves}"
LOAD_SAVE=""
LOAD_UNTIL_TICK=""
HEADLESS_EXPLICIT_LOAD="${FACTORIO_HEADLESS_EXPLICIT_LOAD:-1}"
CREATE_MAP=1
RUN_BENCHMARK=1
COPY_LATEST_SAVE=0
STAGED_SAVE_PATH=""
typeset -a REQUIRE_LOGS
REQUIRE_LOGS=()

usage() {
  cat <<'EOF'
Usage: ./scripts/run-smoke-test.sh [options]

Options:
  singleplayer | multiplayer | mp   Backward-compatible mode shortcut.
  --singleplayer                  Run in singleplayer mode (default).
  --multiplayer                   Also run the timed headless multiplayer startup check.
  --config PATH                   Override the Factorio config file.
  --timeout SECONDS               Set both multiplayer and explicit load timeouts.
  --mp-timeout SECONDS            Set the multiplayer startup timeout.
  --load-timeout SECONDS          Set the explicit `--load-game` timeout.
  --save PATH                     Explicitly load an existing save after smoke setup.
  --copy-save PATH                Copy a save into the working save dir, then use the copy.
  --copy-latest-save              Copy the newest `.zip` from the source save dir, then use it.
  --source-save-dir PATH          Override the directory scanned by `--copy-latest-save`.
  --work-save-dir PATH            Override the staging directory for copied saves.
  --until-tick TICK               Pass `--until-tick` to the explicit save load.
  --headless-load                 Use `--start-server` for explicit save validation when possible.
  --client-load                   Force explicit save validation through `--load-game`.
  --require-log TEXT              Require a log line during explicit load validation; repeatable.
  --skip-create                   Skip `--create` map generation.
  --skip-benchmark                Skip benchmark-based load validation.
  --map PATH                      Override the generated smoke map path.
  --benchmark-ticks COUNT         Override benchmark ticks (default: 1).
  --benchmark-runs COUNT          Override benchmark runs (default: 1).
  --help                          Show this help text.

Examples:
  ./scripts/run-smoke-test.sh
  ./scripts/run-smoke-test.sh --multiplayer --timeout 10
  ./scripts/run-smoke-test.sh --copy-latest-save --until-tick 2147483647 --load-timeout 10 --require-log "[upsidedowneyeLIB] load probe tick 1/10" --skip-create --skip-benchmark
EOF
}

require_arg() {
  local option_name="$1"
  if (( $# < 2 )); then
    echo "ERROR: Missing value for $option_name" >&2
    usage >&2
    exit 1
  fi
}

while (( $# > 0 )); do
  case "$1" in
    singleplayer|sp|--singleplayer)
      MODE="singleplayer"
      ;;
    multiplayer|mp|--multiplayer)
      MODE="multiplayer"
      ;;
    --config)
      require_arg "$1" "$@"
      shift
      CONFIG="$1"
      ;;
    --timeout)
      require_arg "$1" "$@"
      shift
      MP_TIMEOUT_SECONDS="$1"
      LOAD_TIMEOUT_SECONDS="$1"
      ;;
    --mp-timeout)
      require_arg "$1" "$@"
      shift
      MP_TIMEOUT_SECONDS="$1"
      ;;
    --load-timeout)
      require_arg "$1" "$@"
      shift
      LOAD_TIMEOUT_SECONDS="$1"
      ;;
    --save)
      require_arg "$1" "$@"
      shift
      LOAD_SAVE="$1"
      ;;
    --copy-save)
      require_arg "$1" "$@"
      shift
      LOAD_SAVE="$1"
      ;;
    --copy-latest-save)
      COPY_LATEST_SAVE=1
      ;;
    --source-save-dir)
      require_arg "$1" "$@"
      shift
      SOURCE_SAVE_DIR="$1"
      ;;
    --work-save-dir)
      require_arg "$1" "$@"
      shift
      WORK_SAVE_DIR="$1"
      ;;
    --until-tick)
      require_arg "$1" "$@"
      shift
      LOAD_UNTIL_TICK="$1"
      ;;
    --headless-load)
      HEADLESS_EXPLICIT_LOAD=1
      ;;
    --client-load)
      HEADLESS_EXPLICIT_LOAD=0
      ;;
    --require-log)
      require_arg "$1" "$@"
      shift
      REQUIRE_LOGS+=("$1")
      ;;
    --skip-create)
      CREATE_MAP=0
      ;;
    --skip-benchmark)
      RUN_BENCHMARK=0
      ;;
    --map)
      require_arg "$1" "$@"
      shift
      MAP="$1"
      ;;
    --benchmark-ticks)
      require_arg "$1" "$@"
      shift
      BENCHMARK_TICKS="$1"
      ;;
    --benchmark-runs)
      require_arg "$1" "$@"
      shift
      BENCHMARK_RUNS="$1"
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if [[ ! -x "$BIN" ]]; then
  echo "ERROR: Factorio binary not executable at: $BIN" >&2
  exit 1
fi

if [[ ! -f "$CONFIG" ]]; then
  echo "ERROR: Factorio config not found at: $CONFIG" >&2
  exit 1
fi

if [[ ! -x "$COPY_MOD_SCRIPT" ]]; then
  echo "ERROR: Copy-to-Variables script not executable at: $COPY_MOD_SCRIPT" >&2
  exit 1
fi

if [[ ! -d "$MODS" ]]; then
  echo "ERROR: Factorio mod directory not found at: $MODS" >&2
  exit 1
fi

if [[ ! -d "$WORK_SAVE_DIR" ]]; then
  mkdir -p "$WORK_SAVE_DIR"
fi

echo "Running smoke test..."
echo "  copy script: $COPY_MOD_SCRIPT"
echo "  bin:    $BIN"
echo "  config: $CONFIG"
echo "  mods:   $MODS"
echo "  map:    $MAP"
echo "  mode:   $MODE"
echo "  benchmark ticks: $BENCHMARK_TICKS"
echo "  benchmark runs:  $BENCHMARK_RUNS"
echo "  work saves:      $WORK_SAVE_DIR"
if [[ -n "$LOAD_SAVE" ]]; then
  echo "  explicit save:   $LOAD_SAVE"
fi
if [[ -n "$LOAD_UNTIL_TICK" ]]; then
  echo "  until tick:      $LOAD_UNTIL_TICK"
fi
echo "  headless load:   $HEADLESS_EXPLICIT_LOAD"
if [[ "$LOAD_TIMEOUT_SECONDS" != "0" ]]; then
  echo "  load timeout:    ${LOAD_TIMEOUT_SECONDS}s"
fi

# Always refresh the deployed Variables/mods copy first so every smoke run
# validates the exact build the user will launch in their own game.
"$COPY_MOD_SCRIPT"

TMP_LOG="$(mktemp /tmp/upsidedowneye-smoke.XXXXXX.log)"
LOAD_LOG="$(mktemp /tmp/upsidedowneye-smoke-load.XXXXXX.log)"
EXPLICIT_LOAD_LOG="$(mktemp /tmp/upsidedowneye-smoke-explicit-load.XXXXXX.log)"
trap 'rm -f "$TMP_LOG" "$LOAD_LOG" "$EXPLICIT_LOAD_LOG"' EXIT

run_with_timeout() {
  local timeout_seconds="$1"
  shift
  if [[ "$timeout_seconds" == "0" ]]; then
    "$@"
    return $?
  fi

  timeout --signal=TERM --kill-after=2s "$timeout_seconds" "$@"
}

stage_save_copy() {
  local source_path="$1"
  if [[ ! -f "$source_path" ]]; then
    echo "ERROR: save source not found at: $source_path" >&2
    exit 1
  fi

  local source_name="${source_path:t}"
  local base_name="${source_name%.zip}"
  local staged_path
  staged_path="$(mktemp "$WORK_SAVE_DIR/${base_name}.smoke.XXXXXX.zip")"
  cp "$source_path" "$staged_path"
  echo "$staged_path"
}

find_latest_save() {
  local -a matches
  matches=("$SOURCE_SAVE_DIR"/*.zip(N.om[1]))
  if (( ${#matches[@]} == 0 )); then
    echo "ERROR: no .zip saves found in: $SOURCE_SAVE_DIR" >&2
    exit 1
  fi
  echo "$matches[1]"
}

if (( COPY_LATEST_SAVE )); then
  LOAD_SAVE="$(find_latest_save)"
fi

if [[ -n "$LOAD_SAVE" ]]; then
  STAGED_SAVE_PATH="$(stage_save_copy "$LOAD_SAVE")"
  echo "  staged save:     $STAGED_SAVE_PATH"
fi

check_required_logs() {
  local log_path="$1"
  local label="$2"
  shift 2

  local required_line
  for required_line in "$@"; do
    if ! grep -Fq "$required_line" "$log_path"; then
      echo "ERROR: Required log marker not found during ${label}: $required_line" >&2
      tail -n 120 "$log_path" >&2
      exit 1
    fi
  done
}

is_timeout_exit_code() {
  local exit_code="$1"
  [[ "$exit_code" == "124" || "$exit_code" == "137" || "$exit_code" == "143" ]]
}

if (( CREATE_MAP )); then
  "$BIN" --config "$CONFIG" --mod-directory "$MODS" --create "$MAP" | tee "$TMP_LOG"

  if [[ -n "$CREATE_SUCCESS_MARKER" ]] && ! grep -Fq "$CREATE_SUCCESS_MARKER" "$TMP_LOG"; then
    echo "ERROR: create success marker not found in smoke output: $CREATE_SUCCESS_MARKER" >&2
    exit 1
  fi

  if [[ -n "$CREATE_SUCCESS_MARKER" ]]; then
    echo "Verified create success marker."
    grep -F "$CREATE_SUCCESS_MARKER" "$TMP_LOG" | head -n 5 || true
  fi
fi

BENCHMARK_TARGET="$MAP"
if [[ -n "$STAGED_SAVE_PATH" && ! -f "$BENCHMARK_TARGET" ]]; then
  BENCHMARK_TARGET="$STAGED_SAVE_PATH"
fi

if (( RUN_BENCHMARK )); then
  if [[ ! -f "$BENCHMARK_TARGET" ]]; then
    echo "ERROR: benchmark target not found at: $BENCHMARK_TARGET" >&2
    exit 1
  fi

  echo "Running save/load smoke validation..."
  "$BIN" --config "$CONFIG" --mod-directory "$MODS" --benchmark "$BENCHMARK_TARGET" --benchmark-ticks "$BENCHMARK_TICKS" --benchmark-runs "$BENCHMARK_RUNS" --disable-audio | tee "$LOAD_LOG"

  if [[ -n "$LOAD_SUCCESS_MARKER" ]] && ! grep -Fq "$LOAD_SUCCESS_MARKER" "$LOAD_LOG"; then
    echo "ERROR: load success marker not found during save/load validation: $LOAD_SUCCESS_MARKER" >&2
    exit 1
  fi

  if [[ -n "$LOAD_SUCCESS_MARKER" ]]; then
    echo "Verified load success marker."
    grep -F "$LOAD_SUCCESS_MARKER" "$LOAD_LOG" | head -n 5 || true
  fi
fi

if [[ -n "$STAGED_SAVE_PATH" || -n "$LOAD_UNTIL_TICK" || ${#REQUIRE_LOGS[@]} -gt 0 ]]; then
  LOAD_TARGET="${STAGED_SAVE_PATH:-$MAP}"
  if [[ ! -f "$LOAD_TARGET" ]]; then
    echo "ERROR: explicit load target not found at: $LOAD_TARGET" >&2
    exit 1
  fi

  echo "Running explicit save load validation..."
  load_cmd=()
  EXPLICIT_LOAD_SETTINGS=""
  trap_cleanup='rm -f "$TMP_LOG" "$LOAD_LOG" "$EXPLICIT_LOAD_LOG"'
  if [[ "$HEADLESS_EXPLICIT_LOAD" == "1" && -z "$LOAD_UNTIL_TICK" ]]; then
    EXPLICIT_LOAD_SETTINGS="$(mktemp /tmp/upsidedowneye-explicit-load-settings.XXXXXX.json)"
    cat > "$EXPLICIT_LOAD_SETTINGS" <<'EOF'
{
  "name": "upsidedowneye-explicit-load",
  "description": "headless explicit load validation",
  "tags": ["smoke"],
  "max_players": 1,
  "visibility": {"public": false, "lan": false},
  "require_user_verification": false,
  "max_upload_in_kilobytes_per_second": 0,
  "max_upload_slots": 1,
  "ignore_player_limit_for_returning_players": false,
  "allow_commands": "admins-only",
  "autosave_interval": 0,
  "autosave_slots": 1,
  "afk_autokick_interval": 0,
  "auto_pause": true,
  "only_admins_can_pause_the_game": true,
  "autosave_only_on_server": true,
  "non_blocking_saving": false,
  "minimum_latency_in_ticks": 0,
  "minimum_segment_size": 25,
  "minimum_segment_size_peer_count": 20,
  "maximum_segment_size": 100,
  "maximum_segment_size_peer_count": 10
}
EOF
    trap_cleanup='rm -f "$TMP_LOG" "$LOAD_LOG" "$EXPLICIT_LOAD_LOG" "$EXPLICIT_LOAD_SETTINGS"'
    trap "$trap_cleanup" EXIT
    load_cmd=("$BIN" --config "$CONFIG" --mod-directory "$MODS" --disable-audio --start-server "$LOAD_TARGET" --server-settings "$EXPLICIT_LOAD_SETTINGS" --port 34601)
  else
    if [[ "$HEADLESS_EXPLICIT_LOAD" == "1" && -n "$LOAD_UNTIL_TICK" ]]; then
      echo "Note: falling back to client load because --until-tick requires --load-game." >&2
    fi
    load_cmd=("$BIN" --config "$CONFIG" --mod-directory "$MODS" --disable-audio --load-game "$LOAD_TARGET")
    if [[ -n "$LOAD_UNTIL_TICK" ]]; then
      load_cmd+=(--until-tick "$LOAD_UNTIL_TICK")
    fi
  fi

  set +e
  run_with_timeout "$LOAD_TIMEOUT_SECONDS" "${load_cmd[@]}" > "$EXPLICIT_LOAD_LOG" 2>&1
  LOAD_EXIT=$?
  set -e

  if [[ "$LOAD_EXIT" -ne 0 ]] && ! is_timeout_exit_code "$LOAD_EXIT"; then
    echo "ERROR: Explicit save load exited unexpectedly with code $LOAD_EXIT" >&2
    tail -n 120 "$EXPLICIT_LOAD_LOG" >&2
    exit 1
  fi

  if is_timeout_exit_code "$LOAD_EXIT"; then
    echo "Explicit save load hit timeout after ${LOAD_TIMEOUT_SECONDS}s."
  fi

  if [[ -n "$LOAD_SUCCESS_MARKER" ]] && ! grep -Fq "$LOAD_SUCCESS_MARKER" "$EXPLICIT_LOAD_LOG"; then
    echo "ERROR: load success marker not found during explicit save load: $LOAD_SUCCESS_MARKER" >&2
    tail -n 120 "$EXPLICIT_LOAD_LOG" >&2
    exit 1
  fi

  check_required_logs "$EXPLICIT_LOAD_LOG" "explicit save load" "${REQUIRE_LOGS[@]}"
  echo "Verified explicit save load markers."
  if [[ -n "$LOAD_SUCCESS_MARKER" ]]; then
    grep -F "$LOAD_SUCCESS_MARKER" "$EXPLICIT_LOAD_LOG" | tail -n 20 || true
  fi
fi

if [[ "$MODE" == "multiplayer" || "$MODE" == "mp" || "$MODE" == "--multiplayer" ]]; then
  MP_SERVER_LOG="$(mktemp /tmp/upsidedowneye-smoke-mp.XXXXXX.log)"
  MP_SERVER_SETTINGS="$(mktemp /tmp/upsidedowneye-server-settings.XXXXXX.json)"
  trap 'rm -f "$TMP_LOG" "$LOAD_LOG" "$EXPLICIT_LOAD_LOG" "$MP_SERVER_LOG" "$MP_SERVER_SETTINGS"' EXIT

  cat > "$MP_SERVER_SETTINGS" <<'EOF'
{
  "name": "upsidedowneye-smoke-mp",
  "description": "multiplayer smoke test",
  "tags": ["smoke"],
  "max_players": 4,
  "visibility": {"public": false, "lan": false},
  "require_user_verification": false,
  "max_upload_in_kilobytes_per_second": 0,
  "max_upload_slots": 5,
  "ignore_player_limit_for_returning_players": false,
  "allow_commands": "admins-only",
  "autosave_interval": 10,
  "autosave_slots": 1,
  "afk_autokick_interval": 0,
  "auto_pause": true,
  "only_admins_can_pause_the_game": true,
  "autosave_only_on_server": true,
  "non_blocking_saving": false,
  "minimum_latency_in_ticks": 0,
  "minimum_segment_size": 25,
  "minimum_segment_size_peer_count": 20,
  "maximum_segment_size": 100,
  "maximum_segment_size_peer_count": 10
}
EOF

  echo "Starting timed headless multiplayer smoke server (${MP_TIMEOUT_SECONDS}s)..."
  set +e
  run_with_timeout "$MP_TIMEOUT_SECONDS" "$BIN" \
    --config "$CONFIG" \
    --mod-directory "$MODS" \
    --start-server "$MAP" \
    --server-settings "$MP_SERVER_SETTINGS" \
    --disable-audio \
    --port 34600 > "$MP_SERVER_LOG" 2>&1
  MP_EXIT=$?
  set -e

  if [[ "$MP_EXIT" -ne 0 ]] && ! is_timeout_exit_code "$MP_EXIT"; then
    echo "ERROR: Multiplayer smoke server exited unexpectedly with code $MP_EXIT" >&2
    tail -n 80 "$MP_SERVER_LOG" >&2
    exit 1
  fi

  if ! grep -Eq "Hosting game at IP ADDR|changing state from\(CreatingGame\) to\(InGame\)" "$MP_SERVER_LOG"; then
    echo "ERROR: Multiplayer smoke did not reach hosting/InGame state." >&2
    tail -n 120 "$MP_SERVER_LOG" >&2
    exit 1
  fi

  echo "Verified multiplayer server startup."
  grep -Ei "Hosting game at IP ADDR|changing state from\(CreatingGame\) to\(InGame\)" "$MP_SERVER_LOG" | head -n 10 || true
fi

echo "Smoke test completed successfully."
