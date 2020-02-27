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
input matrix | input file type .tsv,.gct,.cdt
				* .tsv:
				* .gct:
				* .cdt:
NGCHM name | Content in the second column
NGCHM desc | Content from cell 2
summary method | Content in the second column
row order method | Content from cell 2
row distance measure | Content in the second column
row agglomeration method | Content from cell 2
gtr file | Content in the second column
column order method | Content from cell 2
column distance measure | Content in the second column
column agglomeration method | Content from cell 2
atr file | Content in the second column
row covariate name | Content from cell 2
row covariate input | Content in the second column
row covariate type | Content from cell 2
column covariate name | Content from cell 2
column covariate input | Content in the second column
column covariate type | Content from cell 2
output | output


## Output
Name | Description
------------ | -------------
ngchm file | .ngchm file


