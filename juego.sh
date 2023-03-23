source config.cfg

while (( $PUNTOSJUGADOR<$PUNTOSGANADOR || $PUNTOS2<$PUNTOSGANADOR || $PUNTOS3<$PUNTOSGANADOR || $PUNTOS4<$PUNTOSGANADOR )) #si algun jugador llega a los puntos ganador, se acaba el juego
do
    #se ejecuta lo de repartir fichas
    
 
    while (( $2!=$JUGADORES )) #si el acumulador es igual al numero de jugadores es que nadie puede poner fichas
    do
    clear screen
    #muestras fichas en mesa y tus fichas

    

        if (($1 == 0)) # El flag solo cambiara si no puedes poner ningun

            echo "Pulse 1 para poner ficha"
            echo "Pulse 2 para robar"
            echo "Pulse 3 para saltar el turno"
            echo "Pulse -999 para salir"
            echo -e #new line
            read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
            echo -e #new line
            if((option != 3))
            then
                while true
                do
                    case $OPCION in 
                    1)
                    #funcion que evalua el si puedes poner la ficha y te dice si puedes o no
                    ;;
                    2)
                    robarono

                    echo "Intenta poner una ficha antes"
                    ;;
                    3)
                    echo "Intenta robar o poner una ficha antes"
                    ;;
                    -999)
                    echo "volviendo al menu"
                    continue # aqui numero de bucles que quieres saltar hacer prueba y error
                    ;;
                    esac #fin del case
                done # fin del while if del primer flag
            fi # fin del if del primer flag
        fi #fin del fi flag 0


            if (($1 == 1)) # el flag se vuelve 1 cuando llega al segundo default del poner fichas es decir le toca robar
                    echo "Pulse 1 para poner ficha"
                    echo "Pulse 2 para robar"
                    echo "Pulse 3 para saltar el turno"
                    echo "Pulse -999 para salir"
                    echo -e #new line
                    read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
                    echo -e #new line
                if((option != 3))
                then
                    while true
                    do
                        case $OPCION in 
                        1)
                            
                            echo "tienes que robar antes de intentar poner"
                        ;;
                        2)
                            #funcion para robar toma una fichas de fichas3 o fichas 4 o de ninguna y si es flag=2 

                            
                        ;;
                        3)
                            echo "Intenta robar antes de saltar" 
                        ;;
                        -999)
                            echo "volviendo al menu"
                            continue # aqui numero de bucles que quieres saltar hacer prueba y error
                        ;;
                        esac #fin del case
                    done # fin del while if del primer flag
                fi #fin del fi flag 2
            fi #fin del fi flag 0

            if (($2 == 2)) # el flag se vuelve 2 cuando no puedas robar ni puedas poner fichas que has robado/tienes
                    echo "Pulse 1 para poner ficha"
                    echo "Pulse 2 para robar"
                    echo "Pulse 3 para saltar el turno"
                    echo "Pulse -999 para salir"
                    echo -e #new line
                    read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
                    echo -e #new line
                if((option != 3))
                then
                    while true
                    do
                        case $OPCION in
                        1)
                            echo "tienes que robar antes de intentar poner"
                        ;;
                        2)
                            echo "No quedan fichas para robar"
                        ;;
                        3)
                            #llamas a la funcion que tiene el codigo de la inteligenciajugador
                        ;;
                        -999)
                            echo "volviendo al menu"
                            continue # aqui numero de bucles que quieres saltar hacer prueba y error
                        ;;
                        esac #fin del case
                    done # fin del while if del primer flag
                fi
            fi #fin del fi flag 0
    done #fin del while de acumulador
    #fin de ronda
    BANDERA=0
    scoreplayers $PUNTOSJUGADOR $PUNTOS2 $PUNTOS3 $PUNTOS4 $BANDERA #funcion que muestra los puntos de cada jugador

done #fin del while de puntos ganador
     #fin de partida
     # esto datos luego se pasan al log
    BANDERA=1
    scoreplayers $PUNTOSJUGADOR $PUNTOS2 $PUNTOS3 $PUNTOS4 $BANDERA

function scoreplayers()
{
    source config.cfg
    PUNTOSJUGADOR=$1
    PUNTOS2=$2
    PUNTOS3=$3
    PUNTOS4=$4 
    if($5==0)
    then
        if ($JUGADORES == 2 )
        then
            PUNTOSJUGADOR = $((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2 = $((PUNTOSGANADOR - PUNTOS2))
            echo "puntos necesarios para que el jugador gane : $PUNTOSJUGADOR"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA1 gane : $PUNTOS2"
            echo ""
            PUNTOS3=0
            PUNTOS4=0
        fi

        if ($JUGADORES == 3 )
        then
            PUNTOSJUGADOR = $((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2 = $((PUNTOSGANADOR - PUNTOS2))
            PUNTOS3 = $((PUNTOSGANADOR - PUNTOS3))
            echo "puntos necesarios para que el jugador gane : $PUNTOSJUGADOR"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA1 gane : $PUNTOS2"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA2 gane : $PUNTOS3"
            echo ""
            PUNTOS4=0
        fi

        if ($JUGADORES == 4 )
        then 
            PUNTOSJUGADOR = $((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2 = $((PUNTOSGANADOR - PUNTOS2))
            PUNTOS3 = $((PUNTOSGANADOR - PUNTOS3))
            PUNTOS4 = $((PUNTOSGANADOR - PUNTOS4))
            echo "puntos necesarios para que el jugador gane : $PUNTOSJUGADOR"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA1 gane : $PUNTOS2"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA2 gane : $PUNTOS3"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA3 gane : $PUNTOS4"
            echo ""
        fi  
    else
        winnerpov $PUNTOSJUGADOR $PUNTOS2 $PUNTOS3 $PUNTOS4
    fi
}

winnerpov()
{
    source config.cfg

    if(($1 > $2))
    then
        max=$1
    else
        max=$2
    fi
    
    if(($max < $3))
    then
        max=$3
    fi

    if (($max < $4))
    then 
        max=$4
    fi

    if (($max == $1))
    then
        if (($INTELIGENCIA == 1))
        then        
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""
        
            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                #nerdface
            else
                echo "El jugador 1 gana"
            fi
        else
            echo "El jugador 1 gana"
        fi  
    fi 

    if (($max == $2))
    then
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                #soga
            else
                echo "El jugador 2 (bot1) gana"   
            fi
        else    
            echo "El jugador 2 (bot1) gana"
        fi     
    fi

    if (($max == $3))
    then
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                #soga
            else
                echo "El jugador 3 (bot2) gana"   
            fi
        else    
            echo "El jugador 3 (bot2) gana"
        fi     
    fi

    if (($max == $4))
    then
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                #soga
            else
                echo "El jugador 4 (bot3) gana"   
            fi
        else    
            echo "El jugador 4 (bot3) gana"
        fi     
    fi
}