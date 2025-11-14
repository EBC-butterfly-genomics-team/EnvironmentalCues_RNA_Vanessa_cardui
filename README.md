# Differential expression in Vanessa cardui

This repository contains analysis code and key intermediate results for "Resource availability modulates gene expression across life stages in a migratory butterfly"


## Repository contents

- `analysis/notebooks/analysis_host_plant_adult/DESEQ2_LRset.Rmd`: Main DESeq2 analysis for host-plant adult dataset (LR experiment). Report: `outputs/reports/LR/DESEQ2_LRset.nb.html`.
- `analysis/notebooks/HD_LD/DESEQ2_HD_LDset.Rmd`: Main DESeq2 analysis for HD/LD developmental stages experiment.
- `deseq2_qc/`: DESeq2 QC 
  - `deseq2.dds.RData`: serialized DESeq2 objects used in the study
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
