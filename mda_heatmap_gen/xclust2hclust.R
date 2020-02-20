library(NGCHM)
# library(ctc)

#filePath="/Users/jma7/.genepattern/jobResults/484/allaml.dataset.atr"
#shaidyDir="/Users/jma7/.genepattern/jobResults/484/shaidy"

get_colOrder<-function(data,firstColumn){
	colLabel=data[0:1,]
	colLabel=colLabel[,firstColumn:ncol(data)]
	colLabel=t(colLabel)
	colnames(colLabel)="AID"
	colLabel=as.data.frame(colLabel)
	colLabel$AID=gsub("ARRY","",colLabel$AID)
	colLabel$AID=gsub("X","",colLabel$AID)
	colLabel$AID=as.numeric(colLabel$AID)
	return (row.names(colLabel[order(colLabel$AID),,drop=FALSE]))

}

get_rowOrder<-function(data,firstColumn){
	rowLabel=data[3:nrow(data),0:2]
	rowLabel=as.data.frame(rowLabel)
	rowLabel$GID=gsub("GENE","",rowLabel$GID)
	rowLabel$GID=gsub("X","",rowLabel$GID)
	rowLabel$GID=as.numeric(rowLabel$GID)
	rowLabel=rowLabel[order(rowLabel$GID),]
	return (as.vector(rowLabel[,2]))

}
# source("/home/mda_heatmap_gen/xcluster2r.R")
source("./xcluster2r.R")
options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
cdtFilePath = args [1]
filePath = args[2]
shaidyDir = args[3]
result="empty"
if (filePath!="empty"){
    result=xcluster2r(filePath,distance='euclidean',fast=TRUE)
}
tsvFilePath=paste(shaidyDir,"/matrix.tsv",sep="")
data=read.csv(cdtFilePath,sep="\t",header=TRUE)
firstColumn=match(c("NA"),data[1,])+1
colOrder=get_colOrder(data,firstColumn)
rowOrder=get_rowOrder(data,firstColumn)

if (endsWith(basename(filePath),"atr")){
    result$labels=colOrder
}
if (endsWith(basename(filePath),"gtr")){
    result$labels=rowOrder
}

data=data[3:nrow(data),]
rownames=data[,2]   
data=data[,firstColumn:ncol(data)]
row.names(data)<-rownames
data=data[rowOrder,colOrder]

if (result!="empty"){
    ddg <- stats::as.dendrogram(result)
    if(!file.exists(shaidyDir)){
        shaidyInitRepository (shaidyDir, c("collection", "chm", "dataset", "dendrogram", "label", "tile", "viewer", "file"))
    }
    shaidyRepo=shaidyLoadRepository ('file',shaidyDir)
    ngchmSaveAsDendrogramBlob(shaidyRepo, ddg)
}else{
    dir.create(file.path(shaidyDir), showWarnings = FALSE)
}

if(!file.exists(tsvFilePath)){
    write.table(data,tsvFilePath,quote=FALSE,sep="\t",col.names = NA)
}