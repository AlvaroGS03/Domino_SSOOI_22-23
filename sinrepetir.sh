source config.cfg
a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)
declare -a i
declare -a i1a
declare -a i1b
declare -a i2a
declare -a i2b
declare -a i3a
declare -a i3b
declare -a i4a
declare -a i4b

# i 0-6 i 7-13 i 14-20 21-27
for ((j=0;j<28;j++))
do
    FLAG=0
    while [ $FLAG -eq 0 ]
    do
        i[$j]=`expr $RANDOM % 28`
        if [ $j -eq 0 ]
        then
            FLAG=1
        else
            for ((k=0;k<$j;k++))
            do
                if [ ${i[$j]} -eq ${i[$k]} ]
                then
                    FLAG=0
                    break
                else
                    FLAG=1
                fi
            done
        fi
    done
done

for ((j=0;j<7;j++))
do
    i1[j]=${i[$j]}
    i2[j]=${i[$j+7]}
    i3[j]=${i[$j+14]}
    i4[j]=${i[$j+21]}
done

echo ${i1[@]} > fichas1.txt
echo ${i2[@]} > fichas2.txt
echo ${i3[@]} > fichas3.txt
echo ${i4[@]} > fichas4.txt

if (( $JUGADORES == 2 ))
then
    for ((j=0; j<7; j++))
    do
        i1a[j]=${a[i[j]]}
        i1b[j]=${b[i[j]]}
        i2a[j]=${a[i[j+7]]}
        i2b[j]=${b[i[j+7]]}
    done
    ROBAR=14
fi

if (( $JUGADORES == 3 ))
then
    for ((j=0; j<7; j++))
    do
        i1a[j]=${a[i[j]]}
        i1b[j]=${b[i[j]]}
        i2a[j]=${a[i[j+7]]}
        i2b[j]=${b[i[j+7]]}
        i3a[j]=${a[i[j+14]]}
        i3b[j]=${b[i[j+14]]}
    done
    ROBAR=21
fi

if (( $JUGADORES == 4 ))
then
    for ((j=0; j<7; j++))
    do
        i1a[j]=${a[i[j]]}   
        i1b[j]=${b[i[j]]}
        i2a[j]=${a[i[j+7]]}
        i2b[j]=${b[i[j+7]]}
        i3a[j]=${a[i[j+14]]}
        i3b[j]=${b[i[j+14]]}
        i4a[j]=${a[i[j+21]]}
        i4b[j]=${b[i[j+21]]}
    done
    ROBAR=28
fi



echo "Las fichas de cada jugador son: "
if (( $JUGADORES == 2 ))
then
    echo "Jugador 1:" 
    echo ${i1a[@]} 
    echo ${i1b[@]} 

    echo "Jugador 2:"
    echo ${i2a[@]}
    echo ${i2b[@]}
fi

if (( $JUGADORES == 3 ))
then
    echo "Jugador 1:" 
    echo ${i1a[@]} 
    echo ${i1b[@]} 

    echo "Jugador 2:"
    echo ${i2a[@]}
    echo ${i2b[@]}
    
    echo "Jugador 3:"
    echo ${i3a[@]}
    echo ${i3b[@]}
fi

if (( $JUGADORES == 4 ))
then
    echo "Jugador 1:" 
    echo ${i1a[@]} 
    echo ${i1b[@]}

    echo "Jugador 2:"
    echo ${i2a[@]}
    echo ${i2b[@]}
    
    echo "Jugador 3:"
    echo ${i3a[@]}
    echo ${i3b[@]}
    
    echo "Jugador 4:"
    echo ${i4a[@]}
    echo ${i4b[@]}
fi