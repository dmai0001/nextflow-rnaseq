process FASTQC {

    tag "$sample_id"

    input:
        tuple val(sample_id), path(reads)

    output:
        path "fastqc_${sample_id}/"

    script:
    """
    mkdir fastqc_${sample_id}
    fastqc ${reads} --outdir fastqc_${sample_id}/
    """
}