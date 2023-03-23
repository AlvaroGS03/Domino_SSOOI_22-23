

# inteligenciabots $EXTREMO1 $EXTREMO2 $NUMBOT $PELEMENTO llamada a la funcion

function inteligenciabots()
{
    #esto lo pasa el juego
    EXTREMO1=$1 #para que ponga ficha en el extremo
    EXTREMO2=$2 #para que ponga 
    NUMBOT=$3
    #lo pasa el sinrepetir.sh
    
    # alomejor habria que hacer un flag con el repartir que solo se ejecute la primera vez que se haga el programa.

    echo "Extremo 1:      Extremo 2: "
    echo " _________      __________ " 
    echo "|         |    |          |"
    echo "|    $EXTREMO1    |    |    $EXTREMO2    |" #espaciado correctamente 
    echo "|_________|    |_________|"

    source config.cfg

   

    
    # hacer referencia a new/nose.sh para ver como pasar vectores de una a otra
    

    #.... para todos los vectores individuales de los jugadores  
    
    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    # i 0-6 i 7-13 i 14-20 21-27
    if(($NUMBOT == 1))
    then
        
        array=($(cat fichas2.txt))
        LONGITUD= cat fichas2.txt | wc -w
        #j son los elementos del array de num aleatorios
        
    fi 

    if(($NUMBOT == 2))
    then
        array=($(cat fichas3.txt))
        LONGITUD= cat fichas3.txt | wc -w
        
    fi

    if(($NUMBOT == 3))
    then
        array=($(cat fichas4.txt))
        LONGITUD= cat fichas4.txt | wc -w
    fi
    
#    idk=(${idk[@]:0:$j} ${idk[@]:$((j+1))})
# array=( 7 18 22 6 5 21 )
 for ((i=0;i<$LONGITUD;i++))
    #for ((j=$PELEMENTO;j<$LONGITUD;j++)) #esto es que recorra los elementos del vector de las fichas del bot (que son indices)
    do
        j=${array[$i]}
        case ${a[j]} in
            0)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM              
            ;;
            1)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM                
            ;;
            2)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM                
            ;;
            4)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM            
            ;;
            5)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM                 
            ;;
            6)
            if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
                then
                    EXTREMO1 = ${a[j]} # pone ficha
                    if (($NUMBOT == 1))
                    then
                         # borra la ficha del vector
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
                else # si inteligencia 0
                    if ((${a[j]} == $EXTREMO1))
                    EXTREMO1 = ${a[j]}
                    then
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
                    EXTREMO2 = ${a[j]}
                    
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
            fi
        FLAG=0
        ACUM=0
        juego $FLAG $ACUM              
            ;;
            *) #default es que no encuentra que puede poner ninguna ficha
                        case ${b[j]} in
                    0)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    ;;
                    1)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    
                    ;;
                    2)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    
                    ;;
                    3)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    
                    ;;
                    4)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    
                    ;;
                    5)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                    
                    ;;
                    6)
                        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
                        then
                                if ((${b[j]} == $EXTREMO1))
                                then
                                    EXTREMO1 == ${b[j]}
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
                                        EXTREMO2 == ${b[j]}
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
                    FLAG=0
                    ACUM=0
                    juego $FLAG $ACUM                            
                          
                                  
                    ;;
                    *)
                    #ACUMULADOR=$((ACUMULADOR+1))
                    if (($ACUMULADOR == $LONGITUD)) #default del shell
                    then
                        FLAG=1
                        #ACUM=$((ACUM+1))
                        juego $FLAG $ACUM
                        
                        #ESTO AQUI DICE QUE NO PUEDE PONER FICHA Y HACE FLAG== ARA ENTRAR A MENU ROBAR
                        #Y LUEGO EVALUA UNICAMENTE LA FICHA ROBADA LLAMANDO A LAS FUNCIONES EN OTRO LADO
                        break
                    fi
                ;;
                esac
            ;;
            esac
    done
}