#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Parametric launcher for nf-core/rnaseq
# Override via env or flags when calling this script

PROFILE="${PROFILE:-uppmax}"
PROJECT_ID="${PROJECT_ID:-snic2022-5-34}"
NXF_HOME="${NXF_HOME:-$PWD/.nextflow}"
OUTDIR="${OUTDIR:-./results}"
INPUT_SHEET="${INPUT_SHEET:-}"          # required
FASTA="${FASTA:-}"                       # required
GTF="${GTF:-}"                           # required
RESUME="${RESUME:-}"
CONFIG="${CONFIG:-$(dirname "$0")/../configs/customVanessa.config}"
MAX_CPUS="${MAX_CPUS:-20}"
MAX_MEM="${MAX_MEM:-128GB}"
SKIP_STRINGTIE="${SKIP_STRINGTIE:-false}"

usage() {
  cat <<EOF
Usage: INPUT_SHEET=path FASTA=path GTF=path [OPTIONS] $(basename "$0")

Environment variables (override defaults):
  PROFILE          Nextflow profile (default: uppmax)
  PROJECT_ID       Cluster project id (default: snic2022-5-34)
  NXF_HOME         Nextflow work dir (default: ./.nextflow)
  OUTDIR           Output directory (default: ./results)
  INPUT_SHEET      CSV sample sheet (required)
  FASTA            Reference FASTA (required)
  GTF              Reference GTF (required)
  RESUME           Nextflow run name or hash to resume (optional)
  CONFIG           Nextflow config file (default: configs/customVanessa.config)
  MAX_CPUS         Max CPUs (default: 20)
  MAX_MEM          Max memory (default: 128GB)
  SKIP_STRINGTIE   true|false (default: false)
EOF
}

if [[ -z "$INPUT_SHEET" || -z "$FASTA" || -z "$GTF" ]]; then
  usage
  exit 1
}

mkdir -p "$OUTDIR"
export NXF_HOME

EXTRA_ARGS=()
[[ -n "$RESUME" ]] && EXTRA_ARGS+=( -resume "$RESUME" )
[[ "$SKIP_STRINGTIE" == "true" ]] && EXTRA_ARGS+=( --skip_stringtie )

module load bioinfo-tools Nextflow/21.10.6

nextflow run nf-core/rnaseq \
  --input "$INPUT_SHEET" \
  --fasta "$FASTA" \
  --gtf "$GTF" \
  --outdir "$OUTDIR" \
  --max_cpus "$MAX_CPUS" \
  --max_memory "$MAX_MEM" \
  -profile "$PROFILE" \
  -c "$CONFIG" \
  --project "$PROJECT_ID" \
  "${EXTRA_ARGS[@]}"


