input="$WORKSPACE/kube/params"
pwd;
while IFS= read -r line
do
  key=$(echo "$line" | awk -F":" '{print $1}')
  value=$(echo "$line" | awk -F":" '{print $2}')
  echo "key=${key}, val=${value}"
  sed -i 's/${key}/${value}/g' azure-vote-all-in-one-redis.yaml
done < "$input"
