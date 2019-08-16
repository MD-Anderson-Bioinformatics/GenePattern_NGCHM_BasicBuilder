## GenePattern_NGCHM_BasicBuilder
A GenePattern module to build NGCHM in GenePattern notebook

## Install NGCHM_BasicBuilder module on local GenePattern Server
1. Download [GenePattern APP](https://github.com/genepattern/genepattern-server/releases/tag/v3.9.11-rc.4%2Bb228) to install on local machine. 
2. Click on "Modules & Piplelines" then click on "Install from zip".
3. Upload the [NGCHM_BasicBuilder.zip](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/NGCHM_BasicBuilder.zip) file.




## Use NGCHM_BasicBuilder with GenePattern Notebook
1. Install genepattern notebook from dockerhub.
```
docker pull genepattern/genepattern-notebook
```
2. Run genepattern notebook docker.
```
docker run -p 8889:8888 -name genepattern-notebook genepattern/genepattern-notebook
```
3. Copy the URL shown on the screen, paste into browser, change port number to 8889.
4. Click on the dropdown list to insert a GenePattern Cell.
5. After logging in, select NGCHM_BasciBuilder module.
6. Upload matrix file. 
[SampleMatrix](https://raw.githubusercontent.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/master/test_data/400x400.txt)
7. Upload covariate files if available. 
[Sample Row Covariate](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/test_data/400x400-row-covariate.txt)
[Sample Column Covariate](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/test_data/400x400-row-covariate.txt)
8. Make other adjustment or use default setting.
9. Click on Run.
10. Use NGCHM_Viewer to view the generated ngchm file.


![ScreenShot](https://github.com/MD-Anderson-Bioinformatics/GenePattern_NGCHM_BasicBuilder/blob/master/ScreenShotOfBuilder.png)

