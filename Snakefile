configfile: "configs/config.yaml"
# configfile: "configs/config.json"

workdir: config["workdir"]

localrules:
    make_lists

rule all:
    input: "fastQC/multiQC.html",
            expand("alignment_star/GM{sample}-Aligned.sortedByCoord.out.bam.bai", sample=config["samples"], read=config["reads"])

include: "includes/helpers.snk"

include: "includes/trim.snk"

include: "includes/fastQC.snk"

include: "includes/star_align.snk"

onsuccess:
    print("Workflow finished - everything ran smoothly")
