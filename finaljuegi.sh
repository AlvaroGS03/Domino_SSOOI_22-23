function jugarfinal() 
{
            echo "Pulse 1 para poner ficha"
            echo "Pulse 2 para robar"
            echo "Pulse 3 para saltar el turno"
            echo "Pulse -999 para salir"
            echo -e #new line
            read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
            echo -e #new line
            

            TURNO=($(cat turno.txt))
            JUGADOR=0 #IDENTIFICADOR PARA EL JUGADOR
            if((option != 3))
            then
                while true
                do
                    case $OPCION in 
                    1)
                    BANDERA=($(cat bandera.txt))
                    if (($BANDERA==0)
                    then
                    read -r -p "Seleccione que ficha quiere poner: "  FICHASELECCION #selecciona una opcion
                    echo ${array[@]} > fichas1.txt
			        FICHAPONER=${array[FICHASELECCION]} #!!!!!!!
                    inteligenciajugador $FICHAPONER
                    FINRONDA=0
                    echo $FINRONDA > finronda.txt
                    else
                    echo "No puedes poner ninguna de tus fichas"
                    pausa #funcion pausa
                    fi
                    
                    ;;
                    2)
                    robarono $JUGADOR #dentro de inteligenciajugador 

                    # robarono crea un flag=1 (si el jugador no puede poner ninguna ficha de las que tiene) 
                    # y si luego si robar devuelve flag=2 (no quedan fichas para robar)

                    #Si tienes una ficha para poner te lo dice
                    #En caso contrario ejecuta robar que pone una ficha directamente si es posible y si no te la añade a tu fichas
                    ;;
                    3)
                    BANDERA=($(cat bandera.txt))
                    if (($BANDERA == 2))
                    then
                    echo "Has finalizado tu turno"
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=$(($FINRONDA+1))
                    echo $FINRONDA > finronda.txt
                    break
                    else
                    echo "Intenta robar o poner una ficha antes"
                    fi
                    ;;
                    -999)
                    echo "volviendo al menu"
                    continue # aqui numero de bucles que quieres saltar hacer prueba y error
                    ;;
                    esac #fin del case
                done # fin del while if del primer flag
            fi # fin del if del primer flag
        fi #fin del fi flag 0

}



function juego() 
{
while (( $PUNTOSJUGADOR<$PUNTOSGANADOR || $PUNTOS2<$PUNTOSGANADOR || $PUNTOS3<$PUNTOSGANADOR || $PUNTOS4<$PUNTOSGANADOR )) #si algun jugador llega a los puntos ganador, se acaba el juego
do
    source config.cfg
    sinrepetir
    quienempieza
    JUGADOREMPIEZA=($(cat quienempieza.txt))
    echo "TURNO=0" > turno.txt
    #IMPRIMIR FICHAS PRIMERA EJECUCION
    imprimirfichas 
    FINNUM=$(($JUGADORES+2))
    echo "0" > finronda.txt
    
 
    while (( $FINRONDA >= $FINNUM )) #si el acumulador es igual al numero de jugadores es que nadie puede poner fichas
    do

        if (($JUGADOREMPIEZA == 0))
        then
                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

            if (($JUGADORES == 2))
            then
                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas
            fi
            if (($JUGADORES == 3))
            then
                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

            fi
            if (($JUGADORES == 4))
            then

                NUMBOT=3
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas
            fi
        fi     

        if (($JUGADOREMPIEZA == 1))
        then
                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

            if (($JUGADORES == 2))
            then

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas
                
            fi
            if (($JUGADORES == 3))
            then

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas


            fi
            if (($JUGADORES == 4))
            then

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=3
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

            fi
        fi     
        if (($JUGADOREMPIEZA == 2))
        then
                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

            fi
            if (($JUGADORES == 3))
            then

                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas


            fi
            if (($JUGADORES == 4))
            then
                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas    

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                NUMBOT=3
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                
            fi
        fi     
        if (($JUGADOREMPIEZA == 3))
        then
                NUMBOT=3
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas
            
                NUMBOT=2
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas 

                NUMBOT=1
                inteligenciabots $bot
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas

                jugarfinal 
                TURNO= ($(cat turno.txt))
                TURNO=$((TURNO+1))
                echo "$TURNO" > turno.txt
                imprimirfichas
        fi            
        
    FINRONDA=($(cat finronda.txt))
    FINRONDA=0
    echo "$FINRONDA" > finronda.txt
    # Tambien se podria hacer que si extremos no se han modificado en x turnos == JUGADORES +2 se acaba la ronda 
    # $FINRONDA > finalronda.txt #cuando ningun judador pueda poner fichas
    done
    #RM LOS FICHAS1
    #rm caches
done
}


function imprimirfichas()
{

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
}