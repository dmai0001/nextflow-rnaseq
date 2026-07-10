# Nextflow RNA-seq Pipeline
End-to-end RNA-seq analysis pipeline built with Nextflow DSL2 for local 
and HPC cluster execution.

## Pipeline Steps
- Quality control with FastQC and MultiQC
- Alignment with STAR (in progress)
- Differential expression with DESeq2 (in progress)

## Requirements

### Local
- Nextflow 26.x+
- FastQC
- MultiQC

### HPC (SLURM)
- Nextflow 25.04.6 (loaded via `module load nextflow/25.04.6`)
- SLURM scheduler
- See `submit_pipeline.sh` for full HPC execution details

## Usage

### Run locally
```bash
nextflow run main.nf
```

### Run on HPC
```bash
sbatch submit_pipeline.sh
```

## Input
- FASTQ files from NCBI/SRA
- Test dataset: SRR1039508

## Output
- `results/fastqc/` — per-sample QC reports
- `results/multiqc/` — aggregated QC report

## Author
Dara Mai
github.com/dmai0001