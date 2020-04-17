library(NGCHM)
# library(ctc)

#filePath="/Users/jma7/.genepattern/jobResults/484/allaml.dataset.atr"
#shaidyDir="/Users/jma7/.genepattern/jobResults/484/shaidy"

get_colOrder<-function(data,firstColumn){
	rownames=data[,1]
	if ("AID" %in% rownames){
		colLabel=data[0:1,]
		colLabel=colLabel[,firstColumn:ncol(data)]
		colLabel=t(colLabel)
		colnames(colLabel)="AID"
		colLabel=as.data.frame(colLabel)
		colLabel$AID=gsub("ARRY","",colLabel$AID)
		colLabel$AID=gsub("X","",colLabel$AID)
		colLabel$AID=as.numeric(colLabel$AID)
		return (row.names(colLabel[order(colLabel$AID),,drop=FALSE]))
	}else{
		header=colnames(data)
		return (header[firstColumn:ncol(data)])
	}
}

get_rowOrder<-function(data,firstRow){
	header=colnames(data)	

	if ("GID" %in% header){
		rowLabel=data[firstRow:nrow(data),0:2]
		rowLabel=as.data.frame(rowLabel)
		colnames(rowLabel)=c("GID","ID")
		rowLabel$GID=gsub("GENE","",rowLabel$GID)
		rowLabel$GID=gsub("X","",rowLabel$GID)
		rowLabel$GID=as.numeric(rowLabel$GID)
		rowLabel=rowLabel[order(rowLabel$GID),]
		return (as.vector(rowLabel[,2]))
	}else{
		rowLabel=data[firstRow:nrow(data),0:1]
		return (as.vector(rowLabel))
	}

}
source("/home/mda_heatmap_gen/xcluster2r.R")
# source("../mda_heatmap_gen/xcluster2r.R")
options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
cdtFilePath = args [1]
filePath = args[2]
shaidyDir = args[3]
# print(shaidyDir)
result="empty"
if (filePath!="empty"){
    result=xcluster2r(filePath,distance='euclidean',fast=TRUE)
}
tsvFilePath=paste(shaidyDir,"/matrix.tsv",sep="")
data=read.csv(cdtFilePath,sep="\t",header=TRUE,check.names=FALSE)
# firstColumn=match(c("NA"),data[1,])+1
# firstRow=tail(which(is.na(data[,3])),n=1)+1
firstColumn=match(c("GWEIGHT"),colnames(data))+1
firstRow=match(c("EWEIGHT"),data[,1])+1
colOrder=get_colOrder(data,firstColumn)
rowOrder=get_rowOrder(data,firstRow)

if (endsWith(basename(filePath),"atr")){
    result$labels=colOrder
}
if (endsWith(basename(filePath),"gtr")){
    result$labels=rowOrder
}

data=data[firstRow:nrow(data),]
if ("GID" %in% colnames(data)){	
	rownames=data[,2]
}else{
	rownames=data[,1]
}

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