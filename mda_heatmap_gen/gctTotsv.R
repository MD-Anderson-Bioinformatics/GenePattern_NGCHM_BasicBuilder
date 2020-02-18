
args = commandArgs(trailingOnly=TRUE)
gctFile=args [1]
tsvFilePath= gsub(".gct",".tsv",gctFile)
gctFile<-read.csv(gctFile,sep="\t",header=TRUE,row.names=1,skip=2)
gctFile=gctFile[, !(colnames(gctFile) %in% c("Description"))]
write.table(gctFile,tsvFilePath,quote=FALSE,sep="\t",col.names = NA)