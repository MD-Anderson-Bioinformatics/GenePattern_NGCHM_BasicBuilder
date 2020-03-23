## Next.Generation.Clustered.Heat.Map.Builder
A GenePattern module to build Next-Generation Clustered Heat Map in GenePattern notebook

## Use Next.Generation.Clustered.Heat.Map.Builder with GenePattern Notebook 
1. Click on "Tools" to insert a GenePattern Login Cell.
2. Log in. 
3. Click on "Tools", scroll to find Next.Generation.Clustered.Heat.Map.Builder module, then insert.
4. Upload matrix file. 
[SampleMatrix](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/400x400.txt)
5. Upload covariate files if available. 
[Sample Row Covariate](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/test_data/400x400-row-covariate.txt)
[Sample Column Covariate](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/test_data/400x400-row-covariate.txt)
6. Make other adjustment or use default setting.
7. Click on Run.
8. Use [Next.Generation.Clustered.Heat.Map.Viewer](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_Viewer) to view the generated ngchm file. Drag ngchm file to the input field of Next.Generation.Clustered.Heat.Map.Viewer module.


![ScreenShot](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/ScreenShotOfBuilder.png)






## Install Next.Generation.Clustered.Heat.Map.Builder module on local GenePattern Server
1. Download [GenePattern](https://github.com/genepattern/genepattern-server/releases/tag/v3.9.11-rc.4%2Bb228), double click to install on local machine. 
2. Input Email, the app will ask to restart, double click on icon again.There is no need to install other modules if you only want to try NGCHM builder and viewer. 
3. Type "ant" to build the zip file for the module.
4. Click on "Modules & Piplelines", then click on "Install from zip".
5. Choose Next.Generation.Clustered.Heat.Map.Builder.zip file in the build folder.

## Install GenePattern NoteBook manually to Jupyter Notebook
1. Jupyter notebook is installed in Anaconda.
2. Install GenePattern notebook using pip.
```
pip install genepattern-notebook
```
3. Enable extenstion.
```
jupyter nbextension enable --py widgetsnbextension
jupyter nbextension install --py genepattern
jupyter nbextension enable --py genepattern
jupyter serverextension enable --py genepattern
jupyter nbextension install --py nbtools
jupyter nbextension enable --py nbtools
jupyter serverextension enable --py nbtools
```
4. Launch Jupyter.
```
jupyter notebook
```

[Guide](http://genepattern-notebook.org/install/) from GenePattern Notebook site.

## Use GenePattern Notebook docker
1. Install genepattern notebook from dockerhub.
```
docker pull genepattern/genepattern-notebook
```
2. Run genepattern notebook docker.
```
docker run -p 8889:8888 -name genepattern-notebook genepattern/genepattern-notebook
```
3. Copy the URL shown on the screen, paste into browser, change port number to 8889.



