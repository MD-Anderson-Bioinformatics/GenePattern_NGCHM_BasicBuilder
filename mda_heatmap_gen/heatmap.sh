#!/bin/bash
#echo "1: " $1" 2: " $2" 3: " $3" 4: "$4" 5: "$5 " 6: "$6 "7: "$7" 8: "$8 " 9: "$9" 10: "${10}" 11: "${11} "12: "${12} 
#echo " 13: "${13}" 14: "${14}" 15: "${15}" 16: "${16} "17: "${17}" 18: "${18}" 19: "${19}" 20: "${20}" 21: "${21} " 22: "${22}" 23:" ${23} 

#Count total number of parameters and classification parameters
parmSize=0
classSize=0
matrixSize=0
for i in "$@"; do
	currParm=$(cut -d'|' -f1 <<< $i)
	parmSize=$((parmSize+1))
	if [ $currParm = "classification" ]
	then
		classSize=$((classSize+1))
  	fi
done

#Get tool data and tool install directories
tooldir=$1
tooldata=$2
#create temp directory for row and col order and dendro files.
tdir=$tooldata/$(date +%y%m%d%M%S)
mkdir $tdir
#echo "tdir: "$tdir

#Extract parameters for row and column order and dendro files
rowOrderFile=$tdir/ROfile.txt
rowDendroFile=$tdir/RDfile.txt
colOrderFile=$tdir/COfile.txt
colDendroFile=$tdir/CDfile.txt
matrixFile=$tdir/shaidy/matrix.tsv
rowOrderJson='"order_file": "'$rowOrderFile'",'
rowDendroJson='"dendro_file": "'$rowDendroFile'",'
colOrderJson='"order_file": "'$colOrderFile'",'
colDendroJson='"dendro_file": "'$colDendroFile'",'

#BEGIN: Construct JSON for all non-repeating parameters
parmJson='{'
rowConfigJson='"row_configuration": {'
colConfigJson='"col_configuration": {'

ctr=0
heatmapName="testRun"
existing_atrFile=""
existing_gtrFile=""
existing_cdtFile=""


for i in "$@"; do
	if [ $ctr -gt 1 ]
	then
		currParm=$(cut -d'|' -f1 <<< $i)		
		if [ $currParm = "existing_atr" ]
		then				
			existing_atrFile="$(cut -d'|' -f3 <<< $i)"
		fi
		if [ $currParm = "existing_gtr" ]
		then
			existing_gtrFile="$(cut -d'|' -f3 <<< $i)"
		fi
		if [ $currParm = "existing_cdt" ]
		then
			existing_cdtFile="$(cut -d'|' -f3 <<< $i)"
		fi
	fi
	 ctr=$((ctr+1))
done

echo $existing_atrFile
echo $existing_gtrFile
echo $existing_cdtFile

ctr=0
for i in "$@"; do
	if [ $ctr -gt 1 ]
	then
		currParm=$(cut -d'|' -f1 <<< $i)
		if [ $currParm != "matrix_files" ] && [ $currParm != "row_configuration" ] && [ $currParm != "col_configuration" ] && [ $currParm != "classification" ]
		then
			#Parse pipe-delimited parameter parameter
			parmJson=$parmJson' "'$(cut -d'|' -f1 <<< $i)'":"'$(cut -d'|' -f2 <<< $i)'",'
			if [ $currParm = "chm_name" ]
			then
				heatmapName=$(cut -d'|' -f2 <<< $i)
			fi
			if [ $currParm = "existing_atr" ]
			then				
				existing_atrFile="$(cut -d'|' -f3 <<< $i)"
			fi
			if [ $currParm = "existing_gtr" ]
			then
				existing_gtrFile="$(cut -d'|' -f3 <<< $i)"
			fi
			if [ $currParm = "existing_cdt" ]
			then
				existing_cdtFile="$(cut -d'|' -f3 <<< $i)"
			fi
	  	fi
		if [ $currParm = "row_configuration" ]
		then
			rowOrder=$(cut -d'|' -f3 <<< $i)
			rowDistance=$(cut -d'|' -f5 <<< $i)
			rowAgglomeration=$(cut -d'|' -f7 <<< $i)
			rowCuts=$(cut -d'|' -f9 <<< $i)
			rowLabels=$(cut -d'|' -f11 <<< $i)
			dataTypeJson='"'$(cut -d'|' -f10 <<< $i)'":["'$rowLabels'"]'
			if [ $rowOrder = 'Hierarchical' ]
			then
				rowConfigJson=$rowConfigJson$rowOrderJson$rowDendroJson
			fi
		
			# if [ !  -z "$existing_gtrFile" ]
			# then
			# 	# rowConfigJson='"row_configuration": {'
			# 	rowConfigJson=$rowConfigJson'"'$(cut -d'|' -f2 <<< $i)'":"Original","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"'$(cut -d'|' -f7 <<< $i)'",'$dataTypeJson'},'
			# else
			rowConfigJson=$rowConfigJson'"'$(cut -d'|' -f2 <<< $i)'":"'$(cut -d'|' -f3 <<< $i)'","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"'$(cut -d'|' -f7 <<< $i)'",'$dataTypeJson'},'
	  		# fi
		fi
		if [ $currParm = "col_configuration" ]
		then
			colOrder=$(cut -d'|' -f3 <<< $i)
			colDistance=$(cut -d'|' -f5 <<< $i)
			colAgglomeration=$(cut -d'|' -f7 <<< $i)
			colCuts=$(cut -d'|' -f9 <<< $i)
			colLabels=$(cut -d'|' -f11 <<< $i)
			dataTypeJson='"'$(cut -d'|' -f10 <<< $i)'":["'$colLabels'"]'
			if [ $colOrder = 'Hierarchical' ]
			then
				colConfigJson=$colConfigJson$colOrderJson$colDendroJson
			fi
			# if [ !  -z "$existing_atrFile" ]
			# then
			# 	# colConfigJson='"col_configuration": {'
			# 	colConfigJson=$colConfigJson'"'$(cut -d'|' -f2 <<< $i)'":"Original","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"'$(cut -d'|' -f7 <<< $i)'",'$dataTypeJson'},'
			# else
			colConfigJson=$colConfigJson'"'$(cut -d'|' -f2 <<< $i)'":"'$(cut -d'|' -f3 <<< $i)'","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"'$(cut -d'|' -f7 <<< $i)'",'$dataTypeJson'},'
	  		# fi
		fi
	 fi
	 ctr=$((ctr+1))
done
#END: Construct JSON for all non-repeating parameters
#echo "rowCuts: "$rowCuts
#echo "colCuts: "$colCuts
#echo "ROW CONFIG JSON: "$rowConfigJson
#echo "COL CONFIG JSON: "$colConfigJson

#BEGIN: Construct JSON for data layers
matrixJson='"matrix_files": [ '
inputMatrix=''
for i in "$@"; do
	currParm=$(cut -d'|' -f1 <<< $i)
	if [ $currParm = "matrix_files" ]
	then
		#Parse pipe-delimited parameter parameter
		if [ ! -z "$existing_cdtFile" ]
		then
			matrixJson=$matrixJson' {"'$(cut -d'|' -f2 <<< $i)'":"'$matrixFile'","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"Average"}'
		else
			matrixJson=$matrixJson' {"'$(cut -d'|' -f2 <<< $i)'":"'$(cut -d'|' -f3 <<< $i)'","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'","'$(cut -d'|' -f6 <<< $i)'":"'$(cut -d'|' -f7 <<< $i)'"}'
		fi
		
		inputMatrix=$(cut -d'|' -f3 <<< $i)
		if [[ "$inputMatrix" == *gct ]]
		then
			inputMatrix=${inputMatrix/gct/tsv}
			`R --slave --vanilla --file=$tooldir/gctTotsv.R --args $inputMatrix`
		fi
  	fi
done
matrixJson=$matrixJson"],"

#END: Construct JSON for data layers

#BEGIN: Construct JSON for classification files
classJson='"classification_files": [ '
classIter=0
for i in "$@"; do
	currParm=$(cut -d'|' -f1 <<< $i)
	if [ $currParm = "classification" ]
	then
		classIter=$((classIter+1))
		#Parse pipe-delimited 3-part classification bar parameter
		classJson=$classJson' {"'$(cut -d'|' -f2 <<< $i)'":"'$(cut -d'|' -f3 <<< $i)'","'$(cut -d'|' -f4 <<< $i)'":"'$(cut -d'|' -f5 <<< $i)'"'
		classCat=$(cut -d'|' -f7 <<< $i)
		classColorType=$(cut -d'_' -f2 <<< $classCat)
		classJson=$classJson','
		classJson=$classJson' "position":"'$(cut -d'_' -f1 <<< $classCat)'","color_map": {"type":"'$classColorType'"}}'
		if [ $classIter -lt $classSize ]		
		then
			classJson=$classJson','
		fi
  	fi
done
classJson=$classJson']'
#END: Construct JSON for classification files


parmJson=$parmJson$matrixJson$rowConfigJson$colConfigJson$classJson
parmJson=$parmJson'}'
echo "HEATMAP PARAMETERS JSON: "$parmJson	

#run R to cluster matrix

if [ ! -z "$existing_cdtFile" ] 
then
	shaidyRepo=$tdir/shaidy
	if [ ! -z "$existing_atrFile" ]
	then
		# output="$(R --slave --vanilla --file=$tooldir/xclust2hclust.R --args $existing_atrFile $shaidyRepo )"
		output=`R --slave --vanilla --file=$tooldir/xclust2hclust.R --args $existing_cdtFile $existing_atrFile $shaidyRepo`
		if [ `echo "$output" | grep -c "dendrogram"` -gt 0 ]
		then
			shaid="${output//'shaid dendrogram '/}"
			x2h_col_orderFile=$shaidyRepo/dendrogram/$shaid/dendrogram-order.tsv
			x2h_col_dendroFile=$shaidyRepo/dendrogram/$shaid/dendrogram-data.tsv
			
			`cp $x2h_col_dendroFile $colDendroFile`
			`cp $x2h_col_orderFile $colOrderFile`
		fi
	fi
	if [ ! -z "$existing_gtrFile" ]
	then
		# output="$(R --slave --vanilla --file=$tooldir/xclust2hclust.R --args $existing_atrFile $shaidyRepo )"
		output=`R --slave --vanilla --file=$tooldir/xclust2hclust.R --args $existing_cdtFile $existing_gtrFile $shaidyRepo`
		if [ `echo "$output" | grep -c "dendrogram"` -gt 0 ]
		then
			shaid="${output//'shaid dendrogram '/}"
			x2h_row_orderFile=$shaidyRepo/dendrogram/$shaid/dendrogram-order.tsv
			x2h_row_dendroFile=$shaidyRepo/dendrogram/$shaid/dendrogram-data.tsv
			
			`cp $x2h_row_dendroFile $rowDendroFile`
			`cp $x2h_row_orderFile $rowOrderFile`
		fi
	fi

else
	output="$(R --slave --vanilla --file=$tooldir/CHM.R --args $inputMatrix $rowOrder $rowDistance $rowAgglomeration $colOrder $colDistance $colAgglomeration $rowOrderFile $colOrderFile $rowDendroFile $colDendroFile $rowCuts $colCuts $rowLabels $colLabels 2>&1)"
	rc=$?;
	if [ $rc != 0 ]
	then
	echo $output;
	if [ `echo "$output" | grep -c "Inf in foreign function call"` -gt 0 ]
	then
		echo "";
		echo "Note: This error can occur when there is no variation in a row or column.  Try a different distance measure or remove rows/columns without variation.";
		echo "This error may also be caused when a covariate file has inadvertently been selected as an Input Matrix.  Check your Input Matrix entry.";
	fi
	exit $rc;
	fi
fi



#call java program to generate NGCHM viewer files.
java -jar $tooldir/GalaxyMapGen.jar "$parmJson"

#clean up tempdir
# rm -rf $tdir

find .  -name *.png -exec cp {} . \;
find . -type d -name $heatmapName -exec rm -r "{}" \;
find . -type d -empty -delete
