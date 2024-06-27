#!/bin/sh

IFS=','

curlCMD=(-s -X GET "$SCHEMA_REGISTRY" )
read -a topic_list <<<"$(cat topic-list.csv)"

echo ${topic_list[@]}

for topic  in "${topic_list[@]}"
do
  echo $topic
subject=$topic-value
curl "${curlCMD[@]}"/${subject}/versions/latest/schema | jq '.'  > ${GIT_REPO}/${ENV}/${subject}.avsc

done



cd ${GIT_REPO}


git add --all 

DATE=$(date)


git commit -q -m "changes made on $DATE"

git push -q origin master



echo "****************************************************************"
