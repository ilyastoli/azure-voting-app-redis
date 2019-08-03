WORKDIR="$WORKSPACE/kube"
INPUT="$WORKDIR/params"

pwd;
while IFS= read -r line
do
  key=$(echo "$line" | awk -F":" '{print $1}')
  value=$(echo "$line" | awk -F":" '{print $2}')
  echo "key=${key}, val=${value}"
#   sed 's/${key}/${value}/g' ${WORKDIR}/azure-vote-all-in-one-redis.yaml
#   echo "sed 's/${key}/${value}/g' ${WORKDIR}/azure-vote-all-in-one-redis.yaml"
#   sed -i 's/${key}/${value}/g' ${WORKDIR}/azure-vote-all-in-one-redis.yaml
  sed -i 's/"${key}"/"${value}"/g' ${WORKDIR}/azure-vote-all-in-one-redis.yaml
  cat ${WORKDIR}/azure-vote-all-in-one-redis.yaml
done < "$INPUT"

