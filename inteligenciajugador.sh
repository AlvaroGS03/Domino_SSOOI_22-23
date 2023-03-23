

function inteligenciajugador()
{
    
    INDICEFICHAS=$1 #juego seleccionas ficha que quieres poner y le pasa el indice de la ficha a inteligencia jugador

    source config.cfg

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    array=($(cat fichas1.txt))
    TURNO= ($(cat turno.txt))

    if (($TURNO == 0))
    then
        read -n -s "Elija cualquier ficha " SELECCION
        INDICE=array[SELECCION]
        EXTREMO1=a[INDICE]
        EXTREMO2=b[INDICE]
        echo "$EXTREMO1" > extremo1.txt
        echo "$EXTREMO2" > extremo2.txt
        array=(${array[@]:0:$SELECCION} ${array[@]:$(($SELECCION+1))})
        echo "${array[@]}" > fichas1.txt
    else
        j1=${a[$INDICEFICHAS]}
        j2=${b[$INDICEFICHAS]}

        if (( $j1 == $EXTREMO1 ))
        then
            EXTREMO1=$j2
            array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$(($INDICEFICHAS+1))})
            echo ${array[@]} > fichas1.txt
        else
            if (( $j2 == $EXTREMO1 ))
            then
                EXTREMO1=$j1
                array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$(($INDICEFICHAS+1))})
                echo ${array[@]} > fichas1.txt
            else
                if (( $j1 == $EXTREMO2 ))
                then
                    EXTREMO2=$j2
                    array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$(($INDICEFICHAS+1))})
                    echo ${array[@]} > fichas1.txt
                else
                    if (( $j2 == $EXTREMO2 ))
                    then
                        EXTREMO2=$j1
                        array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$(($INDICEFICHAS+1))})
                        echo ${array[@]} > fichas1.txt
                    else
                        echo "No se puede poner la ficha"
                    fi
                fi
            fi
        fi
    fi
}

# Dentro de juego 

function robarono() 
{
    EXTREMO1=($(cat extremo1.txt)) #para que ponga ficha en el extremo
    EXTREMO2=($(cat extremo2.txt)) #para que ponga
    JUGADOR=$1

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    array=($(cat fichas1.txt))
    LONGITUD= ${#array[@]}

    for ((i=0;i<$LONGITUD;i++))
    do
        j=${array[i]}
        if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
        then
            BANDERA=0
            echo "$BANDERA" > bandera.txt
        else
            if ((${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
            then
                BANDERA=0
                echo "$BANDERA" > bandera.txt
            else
                BANDERA=1
                echo "$BANDERA" > bandera.txt
            fi
        fi
    done

    if (( $FLAG == 0 ))
    then
        echo "No puedes robar, tienes una ficha que puedes poner"
    else
        robar $JUGADOR
    fi
}