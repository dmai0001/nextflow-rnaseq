#!/bin/bash
#SBATCH --job-name=rnaseq_pipeline
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --output=logs/pipeline_%j.out
#SBATCH --error=logs/pipeline_%j.err

module load nextflow/25.04.6

nextflow run main.nf -profile slurm
