#!/usr/bin/env bash
#SBATCH -A snic2022-5-34
#SBATCH --job-name=nextflow_rnaseq
#SBATCH -p node -n 4
#SBATCH --time=7-00:00:00
# Optional notifications:
#SBATCH --mail-type=NONE

set -euo pipefail
cd "$SLURM_SUBMIT_DIR"

# Minimal variables
export PROFILE="${PROFILE:-uppmax}"
export PROJECT_ID="${PROJECT_ID:-snic2022-5-34}"
export INPUT_SHEET="${INPUT_SHEET:-samplesheets/sample_sheet.csv}"
export FASTA="${FASTA:-/path/to/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna}"
export GTF="${GTF:-/path/to/vcard.gtf}"
export OUTDIR="${OUTDIR:-./results}"
export CONFIG="${CONFIG:-$(dirname "$0")/../configs/customVanessa.config}"

bash "$(dirname "$0")/run_rnaseq.sh"


