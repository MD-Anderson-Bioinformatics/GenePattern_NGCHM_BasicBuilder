## GenePattern NGCHM Basic Builder
A GenePattern Module to build Next-Generation Clustered Heat Maps (NG-CHMs) in GenePattern Notebook.
For details about NG-CHM, please check [NG-CHMs website](http://www.ngchm.net/)

## Description
Clustered heat maps are the most frequently used graphics for visualization of molecular profiling data in biology, appearing in many thousands of publications—but as static images.

To provide more capability for exploration of large data matrices, we developed highly interactive “Next-Generation” Clustered Heat Maps (NG-CHMs). NG-CHMs enable the user to zoom and navigate dynamically and link out to dozens of external data resources and tools. NG-CHMs exploit recent advances in web technology to improve performance, provide a highly-responsive user experience, and facilitate deep exploration of the biology (or other science) behind the image.

NG-CHMs include the following interactive capabilities (among many others):

* Extreme zooming without loss of resolution for drill-down into big data matrices.
* Fluent navigation.
* Link-outs from labels or pixels to a variety of pertinent annotation resources, including GeneCards, PubMed, the Gene Ontology, Google, and cBioPortal.
* Flexible real-time recoloring.
* High-resolution graphics that meet the requirements of all major journals.
* Annotation with pathway data.
* Capture of all metadata necessary to reproduce any chosen state of the map, even months or years later.

## Input
 Other NGCHM Builders ([Galaxy Builder](https://github.com/MD-Anderson-Bioinformatics/NG-CHM_Galaxy),[R buidler](https://github.com/MD-Anderson-Bioinformatics/NGCHM-R) or [online builder](http://build.ngchm.net/NGCHM-web-builder/)).

Name | Description
------------ | -------------
input matrix | input file type .tsv,.gct,.cdt<br>* .tsv: tab-deliminated matrix file<br>* .gct: tab-deliminated matrix file with additional information<br>* .cdt: reordered matrix file
NGCHM name | Name of NGCHM
NGCHM desc | Brief description of the data
summary method | Average, Mode, Sample
row order method | Hierarchical(default), Original, Random
row distance measure | manhattan, euclidean(default), maximum, minkowski (Optional, required if row order method is Hierarchical)
row agglomeration method | average, complete, single, ward.D(default), mcquitty (Optional, required if row order method is Hierarchical)
gtr file | Gene tree file, records the order in which rows were joined.<br>If gtr file is provided, then cdt file is required. (Optional, if you have gtr and cdt file generated from Hierarchical cluster module or other tools, you could upload files and convert into ngchm.)
column order method | Hierarchical(default), Original, Random
column distance measure | manhattan, euclidean(default), maximum, minkowski (Optional, required if column order method is Hierarchical)
column agglomeration method | average, complete, single, ward.D(default), mcquitty (Optional, required if column order method is Hierarchical)
atr file | Array tree file, records the order in which columns were joined.<br>If atr file is provided, then cdt file is required. (Optional, if you have atr and cdt file generated from Hierarchical cluster module or other tools, you could upload files and convert into ngchm.)
row covariate name | Name of the row covariate.(Optional)
row covariate input | tsv file with row label and covariate value on each line.(Optional)
row covariate type | discrete, continuous (Optional)
column covariate name | Name of the column covariate.(Optional)
column covariate input | tsv file with column label and covariate value on each line.(Optional)
column covariate type | discrete, continuous (Optional)
output | Name of output ngchm file.


## Output
Name | Description
------------ | -------------
ngchm file | .ngchm file, you could view the NGCHM with NGCHM_Viewer module.
stderr.txt | error log
stdout.txt | processing log

