input="$WORKSPACE/kube/params"
pwd;
while IFS= read -r line
do
  key=$(echo $line | awk -F":" '{print $1}')
  value=$(echo $line| awk -F":" '{print $2}')
  ehco "key=${key}, val=${value}"
done < "$input"
