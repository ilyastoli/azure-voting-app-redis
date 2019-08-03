input="params"
while IFS= read -r line
do
  key=$(awk -F":" '{print $1}' params)
  value=$(awk -F":" '{print $2}' params)
  ehco "key=${key}, val=${value})
done < "$input"
