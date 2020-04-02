## Next.Gen.Clustered.Heat.Map.Builder
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

 Other NGCHM Builders ([Galaxy Builder](https://github.com/MD-Anderson-Bioinformatics/NG-CHM_Galaxy),[R buidler](https://github.com/MD-Anderson-Bioinformatics/NGCHM-R) or [online builder](http://build.ngchm.net/NGCHM-web-builder/)).
## Input

Name | Description
------------ | -------------
input Filename | input file type .tsv,.gct,.cdt<br>* .tsv: tab-deliminated matrix file<br>* .gct: tab-deliminated matrix file with additional information<br>* .cdt: reordered matrix file
Heat Map Name | Name of Heat map. If omitted, input Filename will be used.
Heat Map Description | Brief description of the data
Summary Method | Average, Mode, Sample
Row Ordering Options | Hierarchical(default), Original, Random
Row Distance Metric | manhattan, euclidean(default), maximum, minkowski, correlation (Optional, required if row order method is Hierarchical)
Row Agglomeration Method | average, complete, single, ward.D(default), mcquitty (Optional, required if row order method is Hierarchical)
gtr file | Gene tree file, records the order in which rows were joined.<br>If gtr file is provided, then cdt file is required. (Optional, if you have gtr and cdt file generated from [Hierarchical cluster module](https://www.genepattern.org/modules/docs/HierarchicalClustering/8) or other tools, you could upload files and convert them into ngchm.)
Column Ordering Options | Hierarchical(default), Original, Random
Column Distance Metric | manhattan, euclidean(default), maximum, minkowski, correlation (Optional, required if column order method is Hierarchical)
Column Agglomeration Method | average, complete, single, ward.D(default), mcquitty (Optional, required if column order method is Hierarchical)
atr file | Array tree file, records the order in which columns were joined.<br>If atr file is provided, then cdt file is required. (Optional, if you have atr and cdt file generated from [Hierarchical cluster module](https://www.genepattern.org/modules/docs/HierarchicalClustering/8) or other tools, you could upload files and convert them into ngchm.)
Row Covariate Name | Name of the row covariate.(Optional)
Row Covariate Input | tsv file with row label and covariate value on each line.(Optional)
Row Covariate Type | discrete, continuous (Optional)
Column Covariate Name | Name of the column covariate.(Optional)
Column Covariate Input | tsv file with column label and covariate value on each line.(Optional)
Column Covariate Type | discrete, continuous (Optional)
Output Base Name | Name of output ngchm file, if omitted, input Filename will be used.


## Output

Name | Description
------------ | -------------
ngchm file | .ngchm file, you could view the NGCHM with [	Next.Gen.Clustered.Heat.Map.Viewer module](https://md-anderson-bioinformatics.github.io/GenePattern_NGCHM_Viewer/).
stderr.txt | error log
stdout.txt | processing log


