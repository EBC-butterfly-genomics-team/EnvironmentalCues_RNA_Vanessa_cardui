# Differential expression in Vanessa cardui

This repository contains analysis code, intermediate results, and figures for RNA‑seq differential expression in *Vanessa cardui* adults and heads.


## What is where (current layout)

- `analysis/notebooks/analysis_host_plant_adult/DESEQ2_LRset.Rmd`: Main DESeq2 analysis for host-plant adult dataset (LR experiment). Report: `outputs/reports/LR/DESEQ2_LRset.nb.html`.
- `analysis/notebooks/HD_LD/DESEQ2_HD_LDset.Rmd`: Main DESeq2 analysis for HD/LD developmental stages experiment.
- `deseq2_qc/`: DESeq2 QC 
  - `deseq2.dds.RData`: serialized DESeq2 objects
  - `deseq2.plots.pdf`, `deseq2.sample.dists.txt`, `deseq2.pca.vals.txt`: QC outputs
- `HD_LD_DESeq/`: Additional/alternative DESeq2 analyses (HD/LD comparisons), results and plots.
- `RNASeq_Report_NGIP20253/`: Provider report and sample metadata (`sample_info_*.txt`, `sample_summary.txt`).
- `BLAST/`: Candidate gene name mapping and BLAST outputs used for label annotation (e.g., `res05abftopgenenamesBLAST.tsv`).
- `Supplementary/`, `Manuscript_Figures/`, `Submission/`, `Vanessa_RNAseq_Figures/`: Figures and assets for manuscript and submission.
- `analysis/bioinformatics/`: Reusable pipeline scripts and configs
  - `scripts/run_rnaseq.sh`, `scripts/run_rnaseq_slurm.sh`: Parametric Nextflow launchers
  - `configs/customVanessa.config`: Cluster/time overrides
- Key data files referenced by Rmds:
  - `/Users/dshipilina/GitHub/VanessaExpressionR1/deseq2_qc/deseq2.dds.RData`
  - `/Users/dshipilina/GitHub/VanessaExpression/ddsLRabf.rda`
  - `/Users/dshipilina/GitHub/VanessaExpression/res05abf.csv`
  - `/Users/dshipilina/GitHub/VanessaExpression/BLAST/res05abftop/res05abftopgenenamesBLAST.tsv`
  - `/Users/dshipilina/GitHub/VanessaExpression/vcard.func.annot.csv`
  - `/Users/dshipilina/GitHub/VanessaExpression/res05hef2.csv`
  - `/Users/dshipilina/GitHub/VanessaExpression/res05hef2full_top20_cand_genes_polishing.csv`
  - `allResAdult_BP.rds`
  - `cand_genes_adult_topGO.tsv`, `cand_genes_adult_topGOclean.tsv`

## How to run

1) Open the relevant Rmd in RStudio or VS Code with R extension:
   - LR: `analysis/notebooks/analysis_host_plant_adult/DESEQ2_LRset.Rmd`
   - HD/LD: `analysis/notebooks/HD_LD/DESEQ2_HD_LDset.Rmd`
2) Ensure the working directory is the repo root: `setwd("/Users/dshipilina/GitHub/VanessaExpressionR1")`.
3) Knit the notebook or run chunks in order. Required packages: `DESeq2`, `ggplot2`, `ggrepel`, `dplyr`, `topGO`, etc.


## Repository contents

VanessaExpressionR1/
  README.md
  data/
    raw/                       # raw inputs (metadata, provider reports)
      RNASeq_Report_NGIP20253/
      vcard.func.annot.csv
      BLAST/
    external/                  # inputs from sibling repo (copied or symlinked)
      VanessaExpression/
        res05abf.csv
        res05hef2.csv
        BLAST/res05abftop/res05abftopgenenamesBLAST.tsv
        res05hef2full_top20_cand_genes_polishing.csv
    processed/                 # serialized objects and derived inputs
      deseq2_qc/deseq2.dds.RData
      allResAdult_BP.rds
  analysis/
    notebooks/
      analysis_host_plant_adult/DESEQ2_LRset.Rmd
      HD_LD/DESEQ2_HD_LDset.Rmd
    bioinformatics/
      scripts/
        run_rnaseq.sh
        run_rnaseq_slurm.sh
        Create_samplesheet.sh
        create_samplesheetHDLD.sh
        create_samplesheetLR.sh
      configs/
        customVanessa.config
  outputs/
    tables/
      res05abf.csv
      cand_genes_adult_*.tsv
    figures/
      Manuscript_Figures/
      Vanessa_RNAseq_Figures/
      Figure2B.pdf
      res05abfdata_.pdf
      res05hef2data_.pdf
    reports/
      LR/DESEQ2_LRset.nb.html
      HD_LD/DESEQ2_HD_LDset.nb.html (if knitted)
  docs/
    submission/
      Submission/
      Supplementary/
```


## Contact
For questions, please contact the repository owner.
