source config.cfg

MINIMO=30
PERTENECE=10

if (($JUGADORES == 2))
then
    array1=($(cat fichas1.txt))
    array2=($(cat fichas2.txt))

    for ((i=0; i<7; i++))
    do
        #if ((${array1[i]} == 0 || ${array1[i]} == 7 || ${array1[i]} == 13 || ${array1[i]} == 18 || ${array1[i]} == 22 || ${array1[i]} == 25 || ${array1[i]} == 27))
        #then
            if ((${array1[i]} == 0))
            then
                MINIMO=0
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 7))
            then
                MINIMO=7
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 13))
            then
                MINIMO=13
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 18))
            then
                MINIMO=18
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 22))
            then
                MINIMO=22
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 25))
            then
                MINIMO=25
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 27))
            then
                MINIMO=27
                PERTENECE=0
                break
            fi
        #fi
    done

    for ((i=0; i<7; i++))
    do
        #if ((${array2[i]} == 0 || ${array2[i]} == 7 || ${array2[i]} == 13 || ${array2[i]} == 18 || ${array2[i]} == 22 || ${array2[i]} == 25 || ${array2[i]} == 27))
        #then
            if ((${array2[i]} == 0 && $MINIMO > 0))
            then
                MINIMO=0
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 7 && $MINIMO > 7))
            then
                MINIMO=7
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 13 && $MINIMO > 13))
            then
                MINIMO=13
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 18 && $MINIMO > 18))
            then
                MINIMO=18
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 22 && $MINIMO > 22))
            then
                MINIMO=22
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 25 && $MINIMO > 25))
            then
                MINIMO=25
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 27 && $MINIMO > 27))
            then
                MINIMO=27
                PERTENECE=1
                break
            fi
        #fi
    done

    if (($PERTENECE != 10))
    then
        echo "El jugador $PERTENECE empieza"
        echo "$PERTENECE" > quienempieza.txt
    else
        echo "Ningun jugador tiene fichas dobles"
        echo "Generando jugador inicial aleatorio"
        EMPIEZA='expr $RANDOM % 1'
        echo "$EMPIEZA" > quienempieza.txt
    fi
fi

if (($JUGADORES == 3))
then
    array1=($(cat fichas1.txt))
    array2=($(cat fichas2.txt))
    array3=($(cat fichas3.txt))
    
    for ((i=0; i<7; i++))
    do
        #if ((${array1[i]} == 0 || ${array1[i]} == 7 || ${array1[i]} == 13 || ${array1[i]} == 18 || ${array1[i]} == 22 || ${array1[i]} == 25 || ${array1[i]} == 27))
        #then
            if ((${array1[i]} == 0))
            then
                MINIMO=0
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 7))
            then
                MINIMO=7
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 13))
            then
                MINIMO=13
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 18))
            then
                MINIMO=18
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 22))
            then
                MINIMO=22
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 25))
            then
                MINIMO=25
                PERTENECE=0
                break
            fi
            if ((${array1[i]} == 27))
            then
                MINIMO=27
                PERTENECE=0
                break
            fi
        #fi
    done

    for ((i=0; i<7; i++))
    do
        #if ((${array2[i]} == 0 || ${array2[i]} == 7 || ${array2[i]} == 13 || ${array2[i]} == 18 || ${array2[i]} == 22 || ${array2[i]} == 25 || ${array2[i]} == 27))
        #then
            if ((${array2[i]} == 0 && $MINIMO > 0))
            then
                MINIMO=0
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 7 && $MINIMO > 7))
            then
                MINIMO=7
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 13 && $MINIMO > 13))
            then
                MINIMO=13
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 18 && $MINIMO > 18))
            then
                MINIMO=18
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 22 && $MINIMO > 22))
            then
                MINIMO=22
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 25 && $MINIMO > 25))
            then
                MINIMO=25
                PERTENECE=1
                break
            fi
            if ((${array2[i]} == 27 && $MINIMO > 27))
            then
                MINIMO=27
                PERTENECE=1
                break
            fi
        #fi
    done

    for ((i=0; i<7; i++))
    do
        #if ((${array3[i]} == 0 || ${array3[i]} == 7 || ${array3[i]} == 13 || ${array3[i]} == 18 || ${array3[i]} == 22 || ${array3[i]} == 25 || ${array3[i]} == 27))
        #then
            if ((${array3[i]} == 0 && $MINIMO > 0))
            then
                MINIMO=0
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 7 && $MINIMO > 7))
            then
                MINIMO=7
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 13 && $MINIMO > 13))
            then
                MINIMO=13
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 18 && $MINIMO > 18))
            then
                MINIMO=18
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 22 && $MINIMO > 22))
            then
                MINIMO=22
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 25 && $MINIMO > 25))
            then
                MINIMO=25
                PERTENECE=2
                break
            fi
            if ((${array3[i]} == 27 && $MINIMO > 27))
            then
                MINIMO=27
                PERTENECE=2
                break
            fi
        #fi
    done

    if (($PERTENECE != 10))
    then
        echo "El jugador $PERTENECE empieza"
        echo "$PERTENECE" > quienempieza.txt
    else
        echo "Ningun jugador tiene fichas dobles"
        echo "Generando jugador inicial aleatorio"
        EMPIEZA='expr $RANDOM % 2'
        echo "$EMPIEZA" > quienempieza.txt
    fi
fi

if (($JUGADORES == 4))
then
    array1=($(cat fichas1.txt))
    array2=($(cat fichas2.txt))
    array3=($(cat fichas3.txt))
    array4=($(cat fichas4.txt))
    
    for ((i=0; i<7; i++))
    do
        if ((${array1[i]} == 0))
        then
            PERTENECE=0
            break
        fi
        if ((${array2[i]} == 0))
        then
            PERTENECE=1
            break
        fi
        if ((${array3[i]} == 0))
        then
            PERTENECE=2
            break
        fi
        if ((${array4[i]} == 0))
        then
            PERTENECE=3
            break
        fi
    done

    echo "El jugador $PERTENECE empieza"
    echo "$PERTENECE" > quienempieza.txt 
fi