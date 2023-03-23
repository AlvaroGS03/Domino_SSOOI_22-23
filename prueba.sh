
    source config.cfg

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)
    
    array1=($(cat fichas1.txt))
    array2=($(cat fichas2.txt))
    array3=($(cat fichas3.txt))
    array4=($(cat fichas4.txt))
    LONGITUD1=${#array1[@]}
    LONGITUD2=${#array2[@]}
    LONGITUD3=${#array3[@]}
    LONGITUD4=${#array4[@]}

    if (($JUGADORES == 2))
    then
        echo "Fichas del jugador 1:"
        for ((i=0; i<$LONGITUD1; i++))
        do
            echo "${a[array1[i]]}""|""${b[array1[i]]}"
        done
        echo "Fichas del jugador 2:"
        for ((i=0; i<$LONGITUD2; i++))
        do
            echo "${a[array2[i]]}""|""${b[array2[i]]}"
        done
    fi

    if (($JUGADORES == 3))
    then
        echo "Fichas del jugador 1:"
        for ((i=0; i<$LONGITUD1; i++))
        do
            echo "${a[array1[i]]}""|""${b[array1[i]]}"
        done
        echo "Fichas del jugador 2:"
        for ((i=0; i<$LONGITUD2; i++))
        do
            echo "${a[array2[i]]}""|""${b[array2[i]]}"
        done
        echo "Fichas del jugador 3:"
        for ((i=0; i<$LONGITUD3; i++))
        do
            echo "${a[array3[i]]}""|""${b[array3[i]]}"
        done
    fi

    if (($JUGADORES == 4))
    then
        echo "Fichas del jugador 1:"
        for ((i=0; i<$LONGITUD1; i++))
        do
            echo "${a[array1[i]]}""|""${b[array1[i]]}"
        done
        echo "Fichas del jugador 2:"
        for ((i=0; i<$LONGITUD2; i++))
        do
            echo "${a[array2[i]]}""|""${b[array2[i]]}"
        done
        echo "Fichas del jugador 3:"
        for ((i=0; i<$LONGITUD3; i++))
        do
            echo "${a[array3[i]]}""|""${b[array3[i]]}"
        done
        echo "Fichas del jugador 4:"
        for ((i=0; i<$LONGITUD4; i++))
        do
            echo "${a[array4[i]]}""|""${b[array4[i]]}"
        done
    fi