WORKDIR="$WORKSPACE/kube"
INPUT="$WORKDIR/params"

pwd;
while IFS= read -r line
do
  key=$(echo "$line" | awk -F":" '{print $1}')
  value=$(echo "$line" | awk -F":" '{print $2}')
  echo "key=${key}, val=${value}"
  for manifest in $(ls ${WORKDIR}/ ls *.y*ml); do
      sed -i "s/${key}/${value}/g" ${WORKDIR}/${manifest}
  done
  
done < "$INPUT"

