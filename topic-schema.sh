#!/bin/sh

IFS=','

curlCMD=(-s -X GET "$SCHEMA_REGISTRY" )
read -a topic_list <<<"$(cat topic-list.csv)"

echo ${topic_list[@]}

for topic  in "${topic_list[@]}"
do

subject=$topic-value
curl "${curlCMD[@]}"/${subject}/versions/latest/schema | jq '.'  >  /home/gopalkrishna/dev/${subject}.avsc

done




echo "****************************************************************"
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
