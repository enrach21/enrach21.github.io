#  module load CBI miniforge3
# conda activate r_analysis

library(zellkonverter)
library(SingleCellExperiment)

h5ad_file_path <- '/wynton/group/shen/scLHX2/analysis/20251024.LHX2.prefilter.stringent.h5ad'
sce_object <- readH5AD(h5ad_file_path)

library(scDblFinder)
library(BiocParallel)

sce <- sce_object
counts(sce) <- assay(sce, "X")

sce <- scDblFinder(sce, samples="sample", BPPARAM=MulticoreParam(3))

writeH5AD(sce, "/wynton/group/shen/scLHX2/analysis/20251024.LHX2.post.scDblFinder.stringent.h5ad", X_name = "counts")
