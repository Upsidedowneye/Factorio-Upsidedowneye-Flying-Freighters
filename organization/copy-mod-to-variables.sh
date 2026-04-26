#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="${0:A:h}"
SOURCE_MOD_DIR="${SOURCE_MOD_DIR:-${SCRIPT_DIR:h}}"
TARGET_MODS_DIR="${TARGET_MODS_DIR:-/run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Variables/mods}"
MOD_NAME="${MOD_NAME:-upsidedowneye-flying-freighters}"
DEST_MOD_DIR="$TARGET_MODS_DIR/$MOD_NAME"
STALE_ARCHIVE_BACKUP_DIR="${STALE_ARCHIVE_BACKUP_DIR:-$TARGET_MODS_DIR/backups/$MOD_NAME}"
DRY_RUN=0
DELETE_EXTRAS=1
REMOVE_STALE_ARCHIVES=1

usage() {
  cat <<EOF
Usage: ./copy-mod-to-variables.sh [options]

Copies the unpacked workspace mod into your Factorio Variables mods directory.

By default, the source mod directory is the parent of this script's directory.

Options:
  --dry-run             Show what would be copied without writing anything.
  --keep-extras         Do not delete files that only exist in the destination.
  --keep-archives       Leave stale packaged copies of this mod in place.
  --backup-dir PATH     Override where stale packaged copies are archived.
  --source-dir PATH     Override the source mod directory.
  --target-mods PATH    Override the destination mods directory.
  --mod-name NAME       Override the destination mod folder name.
  --help                Show this help text.

Environment overrides:
  SOURCE_MOD_DIR
  TARGET_MODS_DIR
  MOD_NAME
  STALE_ARCHIVE_BACKUP_DIR
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

archive_destination_path() {
  local source_path="$1"
  local file_name="${source_path:t}"
  local candidate="$STALE_ARCHIVE_BACKUP_DIR/$file_name"

  if [[ ! -e "$candidate" ]]; then
    echo "$candidate"
    return
  fi

  local base_name="${file_name%.zip}"
  local suffix=1
  while [[ -e "$STALE_ARCHIVE_BACKUP_DIR/${base_name}-$suffix.zip" ]]; do
    suffix=$((suffix + 1))
  done

  echo "$STALE_ARCHIVE_BACKUP_DIR/${base_name}-$suffix.zip"
}

while (( $# > 0 )); do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      ;;
    --keep-extras)
      DELETE_EXTRAS=0
      ;;
    --keep-archives)
      REMOVE_STALE_ARCHIVES=0
      ;;
    --backup-dir)
      require_arg "$1" "$@"
      shift
      STALE_ARCHIVE_BACKUP_DIR="$1"
      ;;
    --source-dir)
      require_arg "$1" "$@"
      shift
      SOURCE_MOD_DIR="$1"
      ;;
    --target-mods)
      require_arg "$1" "$@"
      shift
      TARGET_MODS_DIR="$1"
      DEST_MOD_DIR="$TARGET_MODS_DIR/$MOD_NAME"
      ;;
    --mod-name)
      require_arg "$1" "$@"
      shift
      MOD_NAME="$1"
      DEST_MOD_DIR="$TARGET_MODS_DIR/$MOD_NAME"
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

DEST_MOD_DIR="$TARGET_MODS_DIR/$MOD_NAME"

if [[ ! -d "$SOURCE_MOD_DIR" ]]; then
  echo "ERROR: Source mod directory not found: $SOURCE_MOD_DIR" >&2
  exit 1
fi

if [[ ! -d "$TARGET_MODS_DIR" ]]; then
  echo "ERROR: Target mods directory not found: $TARGET_MODS_DIR" >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "ERROR: rsync is required but was not found in PATH." >&2
  exit 1
fi

typeset -a RSYNC_ARGS
RSYNC_ARGS=(-a --human-readable --stats)

if (( DELETE_EXTRAS )); then
  RSYNC_ARGS+=(--delete)
fi

if (( DRY_RUN )); then
  RSYNC_ARGS+=(--dry-run --itemize-changes)
fi

echo "Copying mod into Variables mods directory..."
echo "  source: $SOURCE_MOD_DIR"
echo "  target: $DEST_MOD_DIR"
echo "  delete extras: $DELETE_EXTRAS"
echo "  remove stale archives: $REMOVE_STALE_ARCHIVES"
echo "  stale archive backup dir: $STALE_ARCHIVE_BACKUP_DIR"
echo "  dry run: $DRY_RUN"

typeset -a STALE_ARCHIVES
STALE_ARCHIVES=("$TARGET_MODS_DIR"/${MOD_NAME}_*.zip(N))

if (( REMOVE_STALE_ARCHIVES )) && (( ${#STALE_ARCHIVES[@]} > 0 )); then
  echo "Archiving stale packaged mod archives so Factorio loads the unpacked workspace copy..."
  if (( ! DRY_RUN )); then
    mkdir -p "$STALE_ARCHIVE_BACKUP_DIR"
  fi
  typeset backup_archive
  for stale_archive in "${STALE_ARCHIVES[@]}"; do
    backup_archive="$(archive_destination_path "$stale_archive")"
    echo "  moving: $stale_archive -> $backup_archive"
    if (( ! DRY_RUN )); then
      mv "$stale_archive" "$backup_archive"
    fi
  done
fi

mkdir -p "$DEST_MOD_DIR"
rsync "${RSYNC_ARGS[@]}" "$SOURCE_MOD_DIR/" "$DEST_MOD_DIR/"

if (( DRY_RUN )); then
  echo "Dry run complete."
else
  echo "Copy complete."
fi