get_directory <- function() {
    args <- commandArgs(trailingOnly = FALSE)
    file <- "--file="
    rstudio <- "RStudio"
    
    match <- grep(rstudio, args)
    if (length(match) > 0) {
        return(dirname(rstudioapi::getSourceEditorContext()$path))
    } else {
        match <- grep(file, args)
        if (length(match) > 0) {
            return(dirname(normalizePath(sub(file, "", args[match]))))
        } else {
            return(dirname(normalizePath(sys.frames()[[1]]$ofile)))
        }
    }
}

path <- paste(get_directory(), "/script/example_POLG.bam", sep = "")
write.table(path, file= "./tests/bam.list", quote= F, row.names = F, col.names = F)
