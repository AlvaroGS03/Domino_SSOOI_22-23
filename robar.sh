source config.cfg

JUGADOR=$1 #variable que te dice que jugador es el invoca a la funcion
EXTREMO1=($(cat extremo1.txt)) 
EXTREMO2=($(cat extremo2.txt)) 

a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)


if (($JUGADORES == 2))
then
    array3=($(cat fichas3.txt))
    array4=($(cat fichas4.txt))
    LONGITUD1= ${#array3[@]}
    LONGITUD2= ${#array4[@]}

    #evalua si quedan fichas en los txts de desuso
    #si quedan fichas en fichas3
    #toma un elemento de fichas3 lo evalua y si puede ponerlo lo pone directamente
    #si no lo puede poner lo añade al txt del judador que lo halla ejecutado
    #break
    if (($LONGITUD1 != 0))
    then
        array=($cat fichas3.txt)
        FICHAROBADA=${array[0]}

        if (($FICHAROBADA == $EXTREMO1 ))
        then
            EXTREMO1=$FICHAROBADA
            array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
            echo "${array[@]}" > fichas3.txt
            echo "$EXTREMO1" > extremo1.txt
        else
            if (($FICHAROBADA == $EXTREMO2 ))
            then
                EXTREMO2=$FICHAROBADA
                array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
                echo "${array[@]}" > fichas3.txt
                echo "$EXTREMO2" > extremo2.txt
            else
                if (($LONGITUD2 != 0))
                then
                    array=($cat fichas4.txt)
                    FICHAROBADA=${array[0]}
                    if (($FICHAROBADA == $EXTREMO1 ))
                    then
                        EXTREMO1=$FICHAROBADA
                        array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
                        echo "${array[@]}" > fichas4.txt
                        echo "$EXTREMO1" > extremo1.txt
                    else
                        if (($FICHAROBADA == $EXTREMO2 ))
                        then
                            EXTREMO2=$FICHAROBADA
                            array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
                            echo "${array[@]}" > fichas4.txt
                            echo "$EXTREMO2" > extremo2.txt
                        else
                            echo "No se puede poner la ficha"
                            pausa
                            if (($JUGADOR==0))#es el jugador el que pide ficha
                            then
                                array2=($cat fichas1.txt)
                                array2+=$FICHAROBADA
                                echo "${array2[@]}" > fichas1.txt
                            fi
                            if (($JUGADOR==1)) #es el bot1 el que pide ficha
                            then
                                array2=($cat fichas2.txt)
                                array2+=$FICHAROBADA
                                echo "${array2[@]}" > fichas2.txt
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
fi

   


if (($JUGADORES == 3))
then
    array4=($(cat fichas4.txt))
    LONGITUD2= ${#array4[@]}
    if (($LONGITUD2 != 0))
    then
        array=($cat fichas4.txt)
        FICHAROBADA=${array[0]}
        if (($FICHAROBADA == $EXTREMO1 ))
        then
            EXTREMO1=$FICHAROBADA
            array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
            echo "${array[@]}" > fichas4.txt
            echo "$EXTREMO1" > extremo1.txt
        else
            if (($FICHAROBADA == $EXTREMO2 ))
            then
                EXTREMO2=$FICHAROBADA
                array=(${array[@]:0:$FICHAROBADA} ${array[@]:$(($FICHAROBADA+1))})
                echo "${array[@]}" > fichas4.txt
                echo "$EXTREMO2" > extremo2.txt
            else
                echo "No se puede poner la ficha"
                pausa
                if (($JUGADOR==0))#es el jugador el que pide ficha
                then
                    array2=($cat fichas1.txt)
                    array2+=$FICHAROBADA
                    echo "${array2[@]}" > fichas1.txt
                fi
                if (($JUGADOR==1)) #es el bot1 el que pide ficha
                then
                    array2=($cat fichas2.txt)
                    array2+=$FICHAROBADA
                    echo "${array2[@]}" > fichas2.txt
                fi
                if (($JUGADOR==2)) #es el bot2 el que pide ficha
                then
                    array2=($cat fichas3.txt)
                    array2+=$FICHAROBADA
                    echo "${array2[@]}" > fichas3.txt
                fi
            fi
        fi
    fi
fi


if (($JUGADORES == 4))# ESTO YA ESTA
then
    echo "No hay fichas en el pozo"
    BANDERA=2 
    echo "$BANDERA" > bandera.txt
    ACUM=$
    juego $FLAG #LE PASA A JUEGO EL FLAG==2 QUE ES EL MENU DE SOLO SALTAR
    pausa
fi