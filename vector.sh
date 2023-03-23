i1=(1 2 3 4 5 6)
delete=$((i1[2]))
i1=("${i1[@]/$delete}")
echo ${i1[@]}
