###
###

.pkgname <- "BSgenome.Scerevisiae.ensembl.release94"

.seqnames <- c('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII','XIII','XIV','XV','XVI')

.circ_seqs <- NULL

.mseqnames <- NULL

.onLoad <- function(libname, pkgname)
{
    if (pkgname != .pkgname)
        stop("package name (", pkgname, ") is not ",
             "the expected name (", .pkgname, ")")
    extdata_dirpath <- system.file("extdata", package=pkgname,
                                   lib.loc=libname, mustWork=TRUE)

    ## Make and export BSgenome object.
    bsgenome <- BSgenome(
        organism="Saccharomyces cerevisiae",
        common_name="baker's yeast",
        provider="ensembl",
        provider_version="release94",
        release_date="Aug. 2018",
        release_name="WHY DO YOU NEED THIS INFORMATION",
        source_url="ensemblorg.ebi.ac.uk",
        seqnames=.seqnames,
        circ_seqs=.circ_seqs,
        mseqnames=.mseqnames,
        seqs_pkgname=pkgname,
        seqs_dirpath=extdata_dirpath
    )

    ns <- asNamespace(pkgname)

    objname <- pkgname
    assign(objname, bsgenome, envir=ns)
    namespaceExport(ns, objname)

    old_objname <- "Scerevisiae"
    assign(old_objname, bsgenome, envir=ns)
    namespaceExport(ns, old_objname)
}

