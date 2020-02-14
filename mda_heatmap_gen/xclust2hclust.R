library(NGCHM)
library(ctc)

#filePath="/Users/jma7/.genepattern/jobResults/484/allaml.dataset.atr"
#shaidyDir="/Users/jma7/.genepattern/jobResults/484/shaidy"
options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
cdtFilePath = args [1]
filePath = args[2]
shaidyDir = args[3]
result=xcluster2r(filePath,distance='euclidean',labels=TRUE)
ddg <- stats::as.dendrogram(result)
shaidyInitRepository (shaidyDir, c("collection", "chm", "dataset", "dendrogram", "label", "tile", "viewer", "file"))
shaidyRepo=shaidyLoadRepository ('file',shaidyDir)
ngchmSaveAsDendrogramBlob(shaidyRepo, ddg)

tsvFilePath=paste(shaidyDir,"/matrix.tsv",sep="")
if(!file.exists(tsvFilePath)){
    data=read.csv(cdtFilePath,sep="\t",header=TRUE)
    # data=data[,!(names(data) %in% c("NAME","GWEIGHT","GID","Genename"))]
    # data=data[!(row.names(data) %in% c("AID","EWEIGHT")),]
    firstColumn=match(c("NA"),data[1,])+1
    data=data[3:nrow(data),]
    rownames=data$NAME    
    data=data[,firstColumn:ncol(data)]
    row.names(data)<-rownames
    write.table(data,tsvFilePath,quote=FALSE,sep="\t",col.names = NA)
}