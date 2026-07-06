#!/usr/bin/env nextflow

/*
 * Nextflow RNA-seq Pipeline
 * Author: Dara Mai
 * GitHub: github.com/dmai0001/nextflow-rnaseq
 */

// Import modules
include { FASTQC } from './modules/fastqc'

/*
 * Pipeline parameters
 */
params {
    input: String = "data/SRR1039508.fastq.gz"
    outdir: String = "results/"
}

/*
 * Main workflow
 */
workflow {

    main:
        // Create channel from paired FASTQ files
        reads_ch = channel.fromPath(params.input)
                .map { file -> [file.simpleName, file] }

        // Run FastQC
        FASTQC(reads_ch)

    publish:
        fastqc_results = FASTQC.out
}

output {
    fastqc_results {
        path 'fastqc'
        mode 'copy'
    }
}