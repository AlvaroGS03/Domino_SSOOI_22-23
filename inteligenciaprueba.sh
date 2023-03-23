    #esto lo pasa el juego
    function inteligenciabots() {
    EXTREMO1=($(cat EXTREMO1.txt)) #para que ponga ficha en el extremo
    EXTREMO2=($(cat EXTREMO2.txt)) #para que ponga 
    NUMBOT=$1
    #lo pasa el sinrepetir.sh
    
    # alomejor habria que hacer un flag con el repartir que solo se ejecute la primera vez que se haga el programa.

    source config.cfg


    # hacer referencia a new/nose.sh para ver como pasar vectores de una a otra
    

    #.... para todos los vectores individuales de los jugadores  
    
    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    # i 0-6 i 7-13 i 14-20 21-27
    if(($NUMBOT == 1))
    then
        
        array=($(cat fichas2.txt))
        LONGITUD= ${#array[@]}
        #j son los elementos del array de num aleatorios
        
    fi 

    if(($NUMBOT == 2))
    then
        array=($(cat fichas3.txt))
        LONGITUD= ${#array[@]}
        
    fi

    if(($NUMBOT == 3))
    then
        array=($(cat fichas4.txt))
        LONGITUD= ${#array[@]}
    fi


for ((i=0;i<$LONGITUD;i++))
do
    j=${array[i]}
    if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
    then
        if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
        then
            EXTREMO1 = ${b[j]} # pone ficha
            echo $EXTREMO1 > extremo1.txt
            if (($NUMBOT == 1))
                then
                    #borra la ficha del vector
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas2.txt
            fi
            if (($NUMBOT == 2))
            then
                array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                echo ${array[@]} > fichas3.txt
            fi
            if (($NUMBOT == 3))
            then
                array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                echo ${array[@]} > fichas4.txt
            fi
            break #ya no evalua mas
        else #si inteligencia 0
            if ((${a[j]} == $EXTREMO1))
            then
                EXTREMO1 = ${b[j]}
                echo $EXTREMO1 > extremo1.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas2.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas3.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas4.txt
                fi
            break
            else #((${a[j]} == EXTREMO2))
                EXTREMO2 = ${b[j]}
                echo $EXTREMO2 > extremo2.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas2.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas3.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas4.txt
                fi
            break
            fi
        fi
    else
        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
        then
            if ((${b[j]} == $EXTREMO1))
            then
                EXTREMO1 == ${a[j]}
                echo $EXTREMO1 > extremo1.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas2.txt                                                                                
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas3.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas4.txt
                fi
            break
            else #((${b[j]} == EXTREMO2))
                EXTREMO2 == ${a[j]}
                echo $EXTREMO2 > extremo2.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas2.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas3.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
                    echo ${array[@]} > fichas4.txt
                fi
            break
            fi
        fi
    fi #MAS EXTERNO
    #FLAG=0
    #juego $FLAG  

    ACUMULADOR=$((ACUMULADOR+1))
    if (($ACUMULADOR == $LONGITUD)) #default del shell
    then
        FINRONDA= ($(cat finronda.txt))
        FINRONDA=$((FINRONDA+1))
        echo $FINRONDA > finronda.txt
        break
    fi
done
}       