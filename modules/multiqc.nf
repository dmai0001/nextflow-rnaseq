process MULTIQC {

    input:
        path fastqc_results

    output:
        path "multiqc_report.html"
        path "multiqc_data/"

    script:
    """
    multiqc ${fastqc_results} --outdir .
    """
}
