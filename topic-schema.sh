#!/bin/sh


IFS=',' 


topic_list=$1



curlCMD=(-s -X GET "$SCHEMA_REGISTRY" )



read -a subjects <<<"$(curl "${curlCMD[@]}"| sed 's/[][]//g')"


#read -a subjects <<<"$(eval "$schema_registry" | sed 's/[][]//g')"
#read -a subjects <<<"$($schema_registry | sed 's/[][]//g')"


for subject  in "${subjects[@]}"
do
  echo $subject





if [[ $subject == *"gdr."* ||  $subject == *"dap."* ]]; then
  subject=${subject//\"/}

#curl -s  -X GET http://localhost:8081/subjects/${subject}/versions/latest  | tr -d '\\'> /home/gopalkrishna/gitfolder/mydata/${ENV}/mydata-value-46.avsc


#eval "$schema_registry/${subject}/versions/latest > /home/gopalkrishna/gitfolder/mydata/${ENV}/${subject}.avsc"



curl "${curlCMD[@]}"/${subject}/versions/latest/schema | jq '.'  >  /home/gopalkrishna/dev/${subject}.avsc

#schema=$(curl --silent  -X GET http://localhost:8081/subjects/${subject}/versions/latest) 
#${schema//\\/} >  mynew-value.avsc
#output1=${schema//\\/} 

#echo "$output1" > mynew-value.avsc

fi



done


#https://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@github.com/khaja.aveena@gmail.com/mydata.git


#https://github.com/khajaaveena8175/mydata.git



cd ${GIT_REPO}


#git add --all 

#DATE=$(date)


#git commit -q -m "changes made on $DATE"
#
#git push -q origin master

#git commit -q https://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@github.com/khajaaveena8175/mydata.git
#git push -q https://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@github.com/khajaaveena8175/mydata.git
