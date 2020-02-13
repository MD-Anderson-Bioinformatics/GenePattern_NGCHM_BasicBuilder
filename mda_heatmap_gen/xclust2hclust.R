library(NGCHM)
library(ctc)

#filePath="/Users/jma7/.genepattern/jobResults/484/allaml.dataset.atr"
#shaidyDir="/Users/jma7/.genepattern/jobResults/484/shaidy"
options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
filePath = args[1]
shaidyDir = args[2]
print(filePath)
print(shaidyDir)
result=xcluster2r(filePath)
ddg <- stats::as.dendrogram(result)
shaidyInitRepository (shaidyDir, c("collection", "chm", "dataset", "dendrogram", "label", "tile", "viewer", "file"))
shaidyRepo=shaidyLoadRepository ('file',shaidyDir)
ngchmSaveAsDendrogramBlob(shaidyRepo, ddg)