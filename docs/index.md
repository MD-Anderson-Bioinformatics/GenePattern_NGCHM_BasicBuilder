## Next.Gen.Cluster.Heat.Map.Builder
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
 
## Use Next.Gen.Cluster.Heat.Map.Builder with GenePattern Notebook 
### Basic usage:
1. After loading ```Next.Gen.Cluster.Heat.Map.Builder``` module into notebook, paste the URL of [SampleMatrix](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/400x400.tsv) into ```Input Filename``` field, or upload matrix of your choice from local. 
2. Click on ```Run``` button to use default setting for the generation of heatmap.
3. Upon completion of building process, several files will be generated as shown below. The ```.ngchm``` file is the next generation clustered heatmap file. 
 ![image](https://user-images.githubusercontent.com/22623882/82971689-de33bf00-9f98-11ea-9e53-53cf90d5fc13.png)

4. View the ```.ngchm``` file with [	Next.Gen.Cluster.Heat.Map.Viewer module](https://md-anderson-bioinformatics.github.io/GenePattern_NGCHM_Viewer/) by copying the URL of ```.ngchm``` file and pasting into ```ngchm file``` input field in the viewer module. 

### Adding covariates
1. Paste the same [SampleMatrix](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/400x400.tsv) URL into ```Input Filename``` field.
2. Click on the plus sign at the bottom of the builder module cell to show the fields for adding covarites.
3. Paste the URL for [Sample Row Covariate](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/matrix_50x50_cov_row_discrete.tsv) into ```Row Covariate Input``` and the URL for
[Sample Column Covariate](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/400x400-column-covariate.txt) into ```Column Covariate Input```.
4. Choose the type of covariate, ```Row Categorial``` for row covariate, ```Column Continuous``` for column covariate. 
5. Click on Run and view the heatmap with viewer as described above. 
 

 
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
Row Label Type | Label the row names to view linkouts in the viewer, for example choose ```Gene Hugo Symbol```.
gtr file | Gene tree file, records the order in which rows were joined.<br>If gtr file is provided, then cdt file is required. (Optional, if you have gtr and cdt file generated from [Hierarchical cluster module](https://www.genepattern.org/modules/docs/HierarchicalClustering/8) or other tools, you could upload files and convert them into ngchm.)
Column Ordering Options | Hierarchical(default), Original, Random
Column Distance Metric | manhattan, euclidean(default), maximum, minkowski, correlation (Optional, required if column order method is Hierarchical)
Column Agglomeration Method | average, complete, single, ward.D(default), mcquitty (Optional, required if column order method is Hierarchical)
Column Label Type | Label the column names to view linkouts in the viewer, for example choose ```Gene Hugo Symbol```.
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
ngchm file | .ngchm file, you could view the NGCHM with [	Next.Gen.Cluster.Heat.Map.Viewer module](https://md-anderson-bioinformatics.github.io/GenePattern_NGCHM_Viewer/).
stderr.txt | error log
stdout.txt | processing log


