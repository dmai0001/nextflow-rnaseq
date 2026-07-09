#!/usr/bin/env nextflow

/*
 * Nextflow RNA-seq Pipeline
 * Author: Dara Mai
 * GitHub: github.com/dmai0001/nextflow-rnaseq
 */

// Import modules
include { FASTQC } from './modules/fastqc'
include { MULTIQC } from './modules/multiqc'
/*
 * Pipeline parameters
 */
params.input = "data/SRR1039508.fastq.gz"
params.outdir = "results/"

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

        // Run MultiQC
        MULTIQC(FASTQC.out.collect())

    publish:
        fastqc_results = FASTQC.out
        multiqc_results = MULTIQC.out[0]
}

output {
    fastqc_results {
        path 'fastqc'
        mode 'copy'
    }

    multiqc_results {
        path 'multiqc'
        mode 'copy'
    }
}
