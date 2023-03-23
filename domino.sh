function existeconfig()
{
    test -e config.cfg

    if [ $? -eq 0 ]
    then
        echo "config.cfg existe"
    else
        echo "config.cfg no existe"
        echo "Creando config.cfg"
        touch config.cfg
        JUGADORES=0
        PUNTOSGANADOR=0
        INTELIGENCIA=2
        echo JUGADORES=$JUGADORES > config.cfg
        echo PUNTOSGANADOR=$PUNTOSGANADOR >> config.cfg
        echo INTELIGENCIA=$INTELIGENCIA >> config.cfg
        echo LOG=fichero.log >> config.cfg
    fi
}

function pausa()
{
    read -s -n 1 -p "Pulsa cualquier tecla para continuar . . ."
    echo ""
}

function existelog()
{
    source config.cfg
    test -e $LOG

    if [[ $? -eq 0 ]]
    then
        echo "El archivo de log existe"
    else
        echo "El archivo de log no existe"
        echo "Creando archivo de log"
        touch $LOG
    fi
}

function comprobarconfig(){
    source config.cfg
    if  (( $JUGADORES<1 || $JUGADORES>4 ))
    then
        echo "El numero de jugadores no es valido"
        echo "El numero de jugadores debe ser entre 1 y 4"
        FLAG=1
    fi

    if (( $PUNTOSGANADOR<50 || $PUNTOSGANADOR>100 ))
    then
        echo "El numero de puntos ganador no es valido"
        echo "El numero de puntos ganador debe ser entre 50 y 100"
        FLAG=1
    fi

    if (( $INTELIGENCIA<0 || $INTELIGENCIA>1 ))
    then
        echo "El nivel de inteligencia no es valido"
        echo "El nivel de inteligencia debe ser 0 o 1"
        FLAG=1
    fi
    existelog
}

function configuracionpartida()
{
    source config.cfg
    JUGADORES=$JUGADORES
    PUNTOSGANADOR=$PUNTOSGANADOR
    INTELIGENCIA=$INTELIGENCIA
    LOG=$LOG
    read -r -p  "Desea cambiar el numero de jugadores [Y/N]" RESPUESTA

    if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        JUGADORES=0
        while (( $JUGADORES<1 || $JUGADORES>3 ))
        do

        echo "ELIJA EL NUMERO DE JUGADORES"
        echo ""
        echo "1) 2 JUGADORES"
        echo "2) 3 JUGADORES"
        echo "3) 4 JUGADORES"
        echo ""
        read -r -p "SELECCION: " JUGADORES
        if  (( $JUGADORES<1 || $JUGADORES>3 ))
        then
            echo "El numero de jugadores no es valido"
            echo "La opcion debe ser entre 1 y 3"
        fi
        done

        JUGADORES=$((JUGADORES+1))

        echo ""
        echo "Numero de jugadores seleccionado: $JUGADORES "
        echo ""
    else
        echo "Numero de jugadores no cambiado"
        echo "Numero de jugadores seleccionado: $JUGADORES "
    fi

    read -r -p  "Desea cambiar el numero de puntos para ganar [Y/N]" RESPUESTA

    if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        PUNTOSGANADOR=0
        while (( $PUNTOSGANADOR<50 || $PUNTOSGANADOR>100 ))
        do
            read -r -p "INTRODUZCA NUMERO DE PUNTOS PARA GANAR " PUNTOSGANADOR
            if  (( $PUNTOSGANADOR<50 || $PUNTOSGANADOR>100 ))
            then
                echo "El numero de puntos ganador no es valido"
                echo "El numero de puntos ganador debe ser entre 50 y 100"
            fi
        done
        echo "Numero de puntos ganador: $PUNTOSGANADOR"
    else
        echo "Numero de puntos no cambiado"
        echo "Numero de puntos seleccionado: $PUNTOSGANADOR"
    echo ""
    fi

    read -r -p  "Desea cambiar la inteligencia [Y/N]" RESPUESTA
    echo ""
    if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        INTELIGENCIA=2
        while (( $INTELIGENCIA<0 ||  $INTELIGENCIA>1 ))
        do
            echo "ELIJA LA INTELIGENCIA DE LOS JUGADORES"
            echo ""
            echo "0) PARA JUGAR CONTRA CROOKS"
            echo "1) PARA JUGAR CONTRA BOSSES"
            echo ""
            read -r -p "SELECCION: " INTELIGENCIA
            if  (( $INTELIGENCIA<0 || $INTELIGENCIA>1 ))
            then
                echo "El nivel de inteligencia no es valido"
                echo "El nivel de inteligencia debe ser 0 o 1"
            fi
        done
        echo "Nivel de inteligencia seleccionado: $INTELIGENCIA"
    else
        echo "Nivel de inteligencia no cambiado"
        echo "Nivel de inteligencia seleccionado: $INTELIGENCIA"
    echo ""
    fi

    echo JUGADORES=$JUGADORES > config.cfg
    echo PUNTOSGANADOR=$PUNTOSGANADOR >> config.cfg
    echo INTELIGENCIA=$INTELIGENCIA >> config.cfg
    echo LOG=$LOG >> config.cfg
}

function comprobarlog()
{
    source config.cfg

    if [ -s "$LOG" ]
    then
        FLAG=1
        echo "El archivo de log no esta vacio"
        read -r -p "Pulse una tecla para continuar" c
        clear screen
    else
        FLAG=0
        echo "El archivo de log esta vacio"
        read -r -p "Pulse una tecla para continuar" c
        clear screen
    fi
}

function vaciarlog()
{
    echo "Desea vaciar el archivo de log [Y/N]"
    read -r -p "SELECCION: " RESPUESTA
    if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        cat /dev/null > $LOG
        echo "Archivo de log vaciado"
        read -r -p "Pulse una tecla para continuar" c
        clear screen
    else
        echo "Archivo de log no vaciado"
        read -r -p "Pulse una tecla para continuar" c
        clear screen
    fi
}

function robar()
{
    source config.cfg

    JUGADOR=($(cat numbot.txt)) #variable que te dice que jugador es el invoca a la funcion
    EXTREMO1=($(cat extremo1.txt)) 
    EXTREMO2=($(cat extremo2.txt))
    echo "0" > tempfichas.txt

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)


    if (($JUGADORES == 2))
    then
        array3=($(cat fichas3.txt))
        array4=($(cat fichas4.txt))
        LONGITUD1=${#array3[@]}
        LONGITUD2=${#array4[@]}

        #evalua si quedan fichas en los txts de desuso
        #si quedan fichas en fichas3
        #toma un elemento de fichas3 lo evalua y si puede ponerlo lo pone directamente
        #si no lo puede poner lo añade al txt del judador que lo halla ejecutado
        #break

        if (($LONGITUD1 != 0))
        then
            FICHAROBADA=${a[array3[0]]}
            
            if (($FICHAROBADA == $EXTREMO1 ))
            then
                EXTREMO1=$FICHAROBADA
                #array3=(${array3[@]:0:$FICHAROBADA} ${array3[@]:$(($FICHAROBADA+1))})
                #array3=("${array3[@]:1}")
                #unset array3[0]
                #delete=$(array3[0])
                #array3=("${array3[@]/$delete}")
                cut -d " " -f2- fichas3.txt > tempfichas.txt
                cat tempfichas.txt > fichas3.txt
                #echo "${array3[@]}" > fichas3.txt
                echo "$EXTREMO1" > extremo1.txt
            else
                FICHAROBADA=${b[array3[0]]}
                if (($FICHAROBADA == $EXTREMO2 ))
                then
                    EXTREMO2=$FICHAROBADA
                    #array3=("${array[@]:1}")
                    #unset array3[0]
                    #delete=$(array3[0])
                    #array3=("${array3[@]/$delete}")
                    cut -d " " -f2- fichas3.txt > tempfichas.txt
                    cat tempfichas.txt > fichas3.txt
                    #echo "${array3[@]}" > fichas3.txt
                    echo "$EXTREMO2" > extremo2.txt
                else
                    echo "No se puede poner la ficha"
                    cut -d " " -f2- fichas3.txt > tempfichas.txt
                    cat tempfichas.txt > fichas3.txt
                    pausa
                fi
            fi 
        fi
            if (($LONGITUD1 == 0 && $LONGITUD2 != 0))
                then
                    FICHAROBADA=${array4[0]}
                    if (($FICHAROBADA == $EXTREMO1 ))
                    then
                        EXTREMO1=$FICHAROBADA
                        #array4=("${array4[@]:1}")
                        #unset array4[0]
                        #delete=$(array4[0])
                        #array4=("${array4[@]/$delete}")
                        cut -d " " -f2- fichas4.txt > tempfichas.txt
                        cat tempfichas.txt > fichas4.txt
                        #echo "${array4[@]}" > fichas4.txt
                        echo "$EXTREMO1" > extremo1.txt
                    else
                        if (($FICHAROBADA == $EXTREMO2 ))
                        then
                        EXTREMO2=$FICHAROBADA
                        #array4=("${array4[@]:1}")
                        #unset array4[0]
                        #delete=$(array4[0])
                        #array4=("${array4[@]/$delete}")
                        cut -d " " -f2- fichas4.txt > tempfichas.txt
                        cat tempfichas.txt > fichas4.txt
                        #echo "${array4[@]}" > fichas4.txt
                        echo "$EXTREMO2" > extremo2.txt
                    else
                        echo "No se puede poner la ficha"
                        cut -d " " -f2- fichas3.txt > tempfichas.txt
                        cat tempfichas.txt > fichas3.txt
                        pausa
                        fi
                    fi    
            fi
            if (($LONGITUD1 !=0 || $LONGITUD2 !=0))
            then
                        if (($JUGADOR==0))#es el jugador el que pide ficha
                        then
                            array1=($(cat fichas1.txt))
                            array1=("${array1[@]}" $FICHAROBADA)
                            echo "${array1[@]}" > fichas1.txt
                        fi
                        if (($JUGADOR==1)) #es el bot1 el que pide ficha
                        then
                                    array2=($(cat fichas2.txt))
                                    array2=("${array2[@]}" $FICHAROBADA)
                                    echo "${array2[@]}" > fichas2.txt
                        fi
            fi            

    fi


    if (($JUGADORES == 3))
    then
        array4=($(cat fichas4.txt))
        LONGITUD2=${#array4[@]}
        if (($LONGITUD2 != 0))
        then
            FICHAROBADA=${array[0]}
            if (($FICHAROBADA == $EXTREMO1 ))
            then
                EXTREMO1=$FICHAROBADA
                #array4=(${array4[@]:0:$FICHAROBADA} ${array4[@]:$(($FICHAROBADA+1))})
                #echo "${array4[@]}" > fichas4.txt
                cut -d " " -f2- fichas4.txt > tempfichas.txt
                cat tempfichas.txt > fichas4.txt
                echo "$EXTREMO1" > extremo1.txt
            else
                if (($FICHAROBADA == $EXTREMO2 ))
                then
                    EXTREMO2=$FICHAROBADA
                    #array4=(${array4[@]:0:$FICHAROBADA} ${array4[@]:$(($FICHAROBADA+1))})
                    #echo "${array4[@]}" > fichas4.txt
                    cut -d " " -f2- fichas4.txt > tempfichas.txt
                    cat tempfichas.txt > fichas4.txt
                    echo "$EXTREMO2" > extremo2.txt
                else
                    echo "No se puede poner la ficha"
                    pausa
                    if (($JUGADOR==0))#es el jugador el que pide ficha
                    then
                        array1=($(cat fichas1.txt))
                        array1=("${array1[@]}" $FICHAROBADA)
                        echo "${array1[@]}" > fichas1.txt
                    fi
                    if (($JUGADOR==1)) #es el bot1 el que pide ficha
                    then
                        array2=($(cat fichas2.txt))
                        array2=("${array2[@]}" $FICHAROBADA)
                        echo "${array2[@]}" > fichas2.txt
                    fi
                    if (($JUGADOR==2)) #es el bot2 el que pide ficha
                    then
                        array3=($(cat fichas3.txt))
                        array3=("${array3[@]}" $FICHAROBADA)
                        echo "${array3[@]}" > fichas3.txt
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
        # ACUM=$
        # juego $FLAG #LE PASA A JUEGO EL FLAG==2 QUE ES EL MENU DE SOLO SALTAR
        pausa
    fi
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

function jugarfinal() 
{
    
            echo "Pulse 1 para poner ficha"
            echo "Pulse 2 para robar"
            echo "Pulse 3 para saltar el turno"
            echo "Pulse 4 regresar al MENU PRINCIPAL"
            echo -e #new line
            read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
            echo -e #new line
            

            TURNO=($(cat turno.txt))
             #IDENTIFICADOR PARA EL JUGADOR
            if ((OPCION != 4))
            then
                while true
                do
                    
                    case $OPCION in 
                    1)
                    BANDERA=($(cat bandera.txt))
                    if (($BANDERA==0))
                    then
                        read -r -p "Seleccione que ficha quiere poner: "  FICHASELECCION #selecciona una opcion
                        array=($(cat fichas1.txt))
                        echo "$FICHASELECCION" > fichaseleccion.txt #!!!!!!!
                        inteligenciajugador # $FICHAPONER
                        FINRONDA=0
                        echo $FINRONDA > finronda.txt
                        #echo -e #new line
                        break
                    else
                    echo "No puedes poner ninguna de tus fichas"
                    
                    pausa #funcion pausa
                    echo -e #new line
                    #break
                    fi
                    
                    ;;
                    2)
                    TURNO=($(cat turno.txt))
                    if (($TURNO == 0))
                    then
                        echo "No puedes robar fichas en tu primer turno"
                        echo ""
                        
                        #break
                        echo -e #new line
                       
                    fi
                    if (($TURNO > 0))
                    then
                        JUGADOR=0
                        echo "$JUGADOR" > numbot.txt
                        robarono  #dentro de inteligenciajugador 
                        
                        #break
                        echo -e #new line
                    fi  
                    
                    ;;
                    3)
                    TURNO=($(cat turno.txt))
                    if (($TURNO == 0))
                    then
                        echo "No puedes saltar tu primer turno"
                        echo ""
                        
                        #break
                        echo -e #new line
                    else
                    BANDERA=($(cat bandera.txt))
                    if (($BANDERA == 2))
                    then
                        echo "Has finalizado tu turno"
                        FINRONDA=($(cat finronda.txt))
                        FINRONDA=$(($FINRONDA+1))
                        echo $FINRONDA > finronda.txt
                        
                        #break
                        echo -e #new line
                    else    
                        echo "Intenta robar o poner una ficha antes"
                        
                        #break
                        echo -e #new line
                    fi
                    fi
                    ;;
                    4)
                    echo "volviendo al menu"
                    menu
                    ;;
                    esac #fin del case

                    echo "Pulse 1 para poner ficha"
                    echo "Pulse 2 para robar"
                    echo "Pulse 3 para saltar el turno"
                    echo "Pulse 4 regresar al MENU PRINCIPAL"
                    echo -e #new line
                    read -r -p "Seleccione una opcion: "  OPCION #selecciona una opcion
                    echo -e #new line
                     
                     
                done 
            fi 

            
       
}

function imprimirtablero()
{
    EXTREMO1=($(cat extremo1.txt))
    EXTREMO2=($(cat extremo2.txt))
    echo "Extremo 1:      Extremo 2: "
    echo " _________      _________ " 
    echo "|         |    |         |"
    echo "|    $EXTREMO1    |    |    $EXTREMO2    |" #espaciado correctamente 
    echo "|_________|    |_________|"
    echo ""
}

function juego() 
{
    echo "0" > numrondas.txt
    TIEMPOINICIO=$(date +%s)
    echo "$TIEMPOINICIO" > tiempoinicio.txt
    echo "0" > puntosjugador.txt
    echo "0" > puntos2.txt
    echo "0" > puntos3.txt
    echo "0" > puntos4.txt
    PUNTOSJUGADOR=($(cat puntosjugador.txt))
    PUNTOS2=($(cat puntos2.txt))
    PUNTOS3=($(cat puntos3.txt))
    PUNTOS4=($(cat puntos4.txt))
    echo "0" > numbot.txt

    while (( $PUNTOSJUGADOR<$PUNTOSGANADOR || $PUNTOS2<$PUNTOSGANADOR || $PUNTOS3<$PUNTOSGANADOR || $PUNTOS4<$PUNTOSGANADOR )) #si algun jugador llega a los puntos ganador, se acaba el juego
    do
        source config.cfg
        sinrepetir
        quienempieza
        JUGADOREMPIEZA=($(cat quienempieza.txt))
        echo "0" > turno.txt
        #IMPRIMIR FICHAS PRIMERA EJECUCION
        imprimirfichas 
        FINNUM=$(($JUGADORES+2))
        echo "0" > finronda.txt
        
        LONGITUD1=7
        LONGITUD2=7
        LONGITUD3=7
        LONGITUD4=7
        FINRONDA=($(cat finronda.txt))
        
        while (( $FINRONDA >= $FINNUM || $LONGITUD1 != 1 || $LONGITUD2 != 1 || $LONGITUD3 != 1 || $LONGITUD4 != 1)) #si el acumulador es igual al numero de jugadores es que nadie puede poner fichas
        do
            #echo "$LONGITUD1"
            #echo "$LONGITUD2"
            if (($JUGADOREMPIEZA == 0))
            then
                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                if (($JUGADORES == 2))
                then
                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                fi
                if (($JUGADORES == 3))
                then
                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                fi
                if (($JUGADORES == 4))
                then

                    NUMBOT=3
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                fi
            fi     

            if (($JUGADOREMPIEZA == 1))
            then
                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                if (($JUGADORES == 2))
                then
                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                    
                fi
                if (($JUGADORES == 3))
                then
                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa


                fi
                if (($JUGADORES == 4))
                then
                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=3
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                fi
            fi

            if (($JUGADOREMPIEZA == 2))
            then
                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                
                if (($JUGADORES == 3))
                then

                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa


                fi
                if (($JUGADORES == 4))
                then

                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa    

                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa

                    NUMBOT=3
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                fi
            fi
            if (($JUGADOREMPIEZA == 3))
            then
                    NUMBOT=3
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                
                    NUMBOT=2
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa 

                    NUMBOT=1
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del bot $NUMBOT"
                    echo ""
                    inteligenciabots 
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
                    
                    NUMBOT=0
                    echo "$NUMBOT" > numbot.txt
                    echo ""
                    echo "Turno del jugador"
                    echo ""
                    jugarfinal 
                    TURNO=($(cat turno.txt))
                    TURNO=$((TURNO+1))
                    echo "$TURNO" > turno.txt
                    imprimirtablero
                    imprimirfichas
                    pausa
            fi

        
        FINRONDA=($(cat finronda.txt))
        array1=($(cat fichas1.txt))
        array2=($(cat fichas2.txt))
        array3=($(cat fichas3.txt))
        array4=($(cat fichas4.txt))
        LONGITUD1=${#array1[@]}
        LONGITUD2=${#array2[@]}
        LONGITUD3=${#array3[@]}
        LONGITUD4=${#array4[@]}

        # Tambien se podria hacer que si extremos no se han modificado en x turnos == JUGADORES +2 se acaba la ronda 
        # $FINRONDA > finalronda.txt #cuando ningun judador pueda poner fichas
        done
            scoreplayers
        #RM LOS FICHAS1
        rm fichas1.txt
        rm fichas2.txt
        rm fichas3.txt
        rm fichas4.txt
        rm turno.txt
        rm bandera.txt
        rm extremo1.txt
        rm extremo2.txt
        rm finronda.txt
        rm quienempieza.txt
        
        NUMRONDAS=($(cat rondas.txt))
        NUMRONDAS=$((NUMRONDAS+1))
        echo "$NUMRONDAS" > numrondas.txt
        #rm caches
    done
        scoreplayers
        FECHA=$(date +%d-%m-%Y)
        HORA=$(date +%H:%M:%S)
        JUGADORESLOG=$JUGADORES
        TIEMPOFINAL=$(date +%s)
        TIEMPOINICIO=($(cat tiempoinicio.txt))
        TIEMPOJUEGO=$((TIEMPOFINAL-TIEMPOINICIO))
        NUMRONDAS=($(cat numrondas.txt))
        INTELIGENCIALOG=$INTELIGENCIA
        PUNTOSGANADORLOG=($(cat puntosganadorlog.txt))
        GANADORLOG=($(cat ganadorlog.txt))
        PUNTOSTOTALESLOG=($(cat puntostotaleslog.txt))
        echo "FECHA""|""HORA""|""JUGADORESLOG""|""TIEMPOJUEGO""|""NUMRONDAS""|""INTELIGENCIALOG""|""PUNTOSGANADORLOG""|""GANADORLOG""|""PUNTOSTOTALESLOG" >> $LOG
        #Fecha|Hora|Jugadores|Tiempo|Rondas|Inteligencia|PuntosGanador|JugadorGanador|Puntos
        rm numrondas.txt
        rm tiempoinicio.txt
        rm ganadorlog.txt
        rm puntosganadorlog.txt
        rm puntostotaleslog.txt
}

function inteligenciabots()
{
    NUMBOT=($(cat numbot.txt))
    TURNO=($(cat turno.txt))
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
        LONGITUD=${#array[@]}
        #j son los elementos del array de num aleatorios
        
    fi 

    if(($NUMBOT == 2))
    then
        array=($(cat fichas3.txt))
        LONGITUD=${#array[@]}
        
    fi

    if(($NUMBOT == 3))
    then
        array=($(cat fichas4.txt))
        LONGITUD=${#array[@]}
    fi

if (($TURNO == 0))
then
    # echo "${a[array[1]]}"
    # echo "${array[1]}"
    EXTREMO1=${a[array[1]]}
    EXTREMO2=${b[array[1]]}
    echo "$EXTREMO1" > extremo1.txt
    echo "$EXTREMO2" > extremo2.txt
    array=(${array[@]:0:1} ${array[@]:2})
    if (($NUMBOT == 1))
    then
        echo "${array[@]}" > fichas2.txt
    fi
    if (($NUMBOT == 2))
    then
        echo "${array[@]}" > fichas3.txt
    fi
    if (($NUMBOT == 3))
    then
        echo "${array[@]}" > fichas4.txt
    fi
else
EXTREMO1=($(cat extremo1.txt)) #para que ponga ficha en el extremo
EXTREMO2=($(cat extremo2.txt)) #para que ponga 
ACUMULADOR=0
for ((i=0;i<$LONGITUD;i++))
do
    j=${array[i]}
    if ((${a[j]} == $EXTREMO1 || ${a[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
    then
        if (( $INTELIGENCIA == 1 && ${a[j]} == ${b[j]} ))
        then
            EXTREMO1=${b[j]} # pone ficha
            echo $EXTREMO1 > extremo1.txt
            if (($NUMBOT == 1))
            then  
                array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                echo ${array[@]} > fichas2.txt
                FINRONDA=($(cat finronda.txt))
                FINRONDA=0
                echo "0" > finronda.txt
            fi
            if (($NUMBOT == 2))
            then
                array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                echo ${array[@]} > fichas3.txt
                FINRONDA=($(cat finronda.txt))
                FINRONDA=0
                echo "0" > finronda.txt
            fi
            if (($NUMBOT == 3))
            then
                array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                echo ${array[@]} > fichas4.txt
                FINRONDA=($(cat finronda.txt))
                FINRONDA=0
                echo "0" > finronda.txt
            fi
            break #ya no evalua mas
        else #si inteligencia 0
            if ((${a[j]} == $EXTREMO1))
            then
                EXTREMO1=${b[j]}
                echo $EXTREMO1 > extremo1.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas2.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas3.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas4.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
            break
            else #((${a[j]} == EXTREMO2))
                EXTREMO2=${b[j]}
                echo $EXTREMO2 > extremo2.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas2.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas3.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas4.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
            break
            fi
        fi
    else
        if (( ${b[j]} == $EXTREMO1 || ${b[j]} == $EXTREMO2 )) #si el indice de la ficha del bot coincide con uno de los extremos
        then
            if ((${b[j]} == $EXTREMO1))
            then
                EXTREMO1=${a[j]}
                echo $EXTREMO1 > extremo1.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas2.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt                                                                                
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas3.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas4.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
            break
            else #((${b[j]} == EXTREMO2))
                EXTREMO2=${a[j]}
                echo $EXTREMO2 > extremo2.txt
                if (($NUMBOT == 1))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas2.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 2))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas3.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
                fi
                if (($NUMBOT == 3))
                then
                    array=(${array[@]:0:$i} ${array[@]:$((i+1))})
                    echo ${array[@]} > fichas4.txt
                    FINRONDA=($(cat finronda.txt))
                    FINRONDA=0
                    echo "0" > finronda.txt
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
        FINRONDA=($(cat finronda.txt))
        FINRONDA=$((FINRONDA+1))
        echo "$FINRONDA" > finronda.txt
        break
    fi
done
if (($ACUMULADOR == $LONGITUD))
then
#while
#do
     robar
#done     
fi
fi
}

function inteligenciajugador()
{
    
    # INDICEFICHAS=$1 #juego seleccionas ficha que quieres poner y le pasa el indice de la ficha a inteligencia jugador
    INDICEFICHAS=($(cat fichaseleccion.txt))
    source config.cfg

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    array=($(cat fichas1.txt))
    TURNO=($(cat turno.txt))

    if (($TURNO == 0))
    then
        echo "${a[INDICEFICHAS]}"
        echo "$INDICEFICHAS"
        EXTREMO1=${a[array[INDICEFICHAS]]}
        EXTREMO2=${b[array[INDICEFICHAS]]}
        echo "$EXTREMO1" > extremo1.txt
        echo "$EXTREMO2" > extremo2.txt
        array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$((INDICEFICHAS+1))})
        echo "${array[@]}" > fichas1.txt
    else
        j1=${a[array[INDICEFICHAS]]}
        j2=${b[array[INDICEFICHAS]]}

        if (( $j1 == $EXTREMO1 ))
        then
            EXTREMO1=$j2
            echo "$EXTREMO1" > extremo1.txt
            array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$((INDICEFICHAS+1))})
            echo ${array[@]} > fichas1.txt
            
        else
            if (( $j2 == $EXTREMO1 ))
            then
                EXTREMO1=$j1
                echo "$EXTREMO1" > extremo1.txt
                array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$((INDICEFICHAS+1))})
                echo ${array[@]} > fichas1.txt
                
            else
                if (( $j1 == $EXTREMO2 ))
                then
                    EXTREMO2=$j2
                    echo "$EXTREMO2" > extremo2.txt
                    array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$((INDICEFICHAS+1))})
                    echo ${array[@]} > fichas1.txt
                    
                else
                    if (( $j2 == $EXTREMO2 ))
                    then
                        EXTREMO2=$j1
                        echo "$EXTREMO2" > extremo2.txt
                        array=(${array[@]:0:$INDICEFICHAS} ${array[@]:$((INDICEFICHAS+1))})
                        echo ${array[@]} > fichas1.txt
                        
                    else
                        echo "No se puede poner la ficha"
                        echo ""
                        pausa
                        imprimirtablero
                        jugarfinal
                    fi
                fi
            fi
        fi
    fi
}

function robarono() 
{
    EXTREMO1=($(cat extremo1.txt)) #para que ponga ficha en el extremo
    EXTREMO2=($(cat extremo2.txt)) #para que ponga

    a=(6 6 6 6 6 6 6 5 5 5 5 5 5 4 4 4 4 4 3 3 3 3 2 2 2 1 1 0)
    b=(6 5 4 3 2 1 0 5 4 3 2 1 0 4 3 2 1 0 3 2 1 0 2 1 0 1 0 0)

    array=($(cat fichas1.txt))
    LONGITUD=${#array[@]}
    BANDERA=($(cat bandera.txt))

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

    if (( $BANDERA == 0 ))
    then
        echo "No puedes robar, tienes una ficha que puedes poner"
    else
        robar
    fi
}

function sinrepetir()
{
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
}

function quienempieza()
{
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
}


function scoreplayers()
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
    PUNTOSJUGADOR=($(cat puntosjugador.txt))
    PUNTOS2=($(cat puntos2.txt))
    PUNTOS3=($(cat puntos3.txt))
    PUNTOS4=($(cat puntos4.txt))
    
    if (($JUGADORES == 2))
    then
        for ((i=0; i<$LONGITUD1; i++))
        do
            PUNTOSJUGADOR=$(($PUNTOSJUGADOR + ${a[array1[i]]} + ${b[array1[i]]}))
            echo "$PUNTOSJUGADOR" > puntosjugador.txt
        done

        for ((i=0; i<$LONGITUD2; i++))
        do
            PUNTOS2=$(($PUNTOS2 + ${a[array2[i]]} + ${b[array2[i]]}))
            echo "$PUNTOS2" > puntos2.txt
        done
    fi
    
    if (($JUGADORES == 3))
    then
        for ((i=0; i<$LONGITUD1; i++))
        do
            PUNTOSJUGADOR=$(($PUNTOSJUGADOR + ${a[array1[i]]} + ${b[array1[i]]}))
            echo "$PUNTOSJUGADOR" > puntosjugador.txt
        done

        for ((i=0; i<$LONGITUD2; i++))
        do
            PUNTOS2=$(($PUNTOS2 + ${a[array2[i]]} + ${b[array2[i]]}))
            echo "$PUNTOS2" > puntos2.txt
        done

        for ((i=0; i<$LONGITUD3; i++))
        do
            PUNTOS3=$(($PUNTOS3 + ${a[array3[i]]} + ${b[array3[i]]}))
            echo "$PUNTOS3" > puntos3.txt
        done
    fi

    if (($JUGADORES == 4))
    then
        for ((i=0; i<$LONGITUD1; i++))
        do
            PUNTOSJUGADOR=$(($PUNTOSJUGADOR + ${a[array1[i]]} + ${b[array1[i]]}))
            echo "$PUNTOSJUGADOR" > puntosjugador.txt
        done

        for ((i=0; i<$LONGITUD2; i++))
        do
            PUNTOS2=$(($PUNTOS2 + ${a[array2[i]]} + ${b[array2[i]]}))
            echo "$PUNTOS2" > puntos2.txt
        done

        for ((i=0; i<$LONGITUD3; i++))
        do
            PUNTOS3=$(($PUNTOS3 + ${a[array3[i]]} + ${b[array3[i]]}))
            echo "$PUNTOS3" > puntos3.txt
        done

        for ((i=0; i<$LONGITUD4; i++))
        do
            PUNTOS4=$(($PUNTOS4 + ${a[array4[i]]} + ${b[array4[i]]}))
            echo "$PUNTOS4" > puntos4.txt
        done
    fi

    
    if (( $PUNTOSJUGADOR<$PUNTOSGANADOR || $PUNTOS2<$PUNTOSGANADOR || $PUNTOS3<$PUNTOSGANADOR || $PUNTOS4<$PUNTOSGANADOR ))
    then
        if (($JUGADORES == 2 ))
        then
            PUNTOSJUGADOR=$((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2=$((PUNTOSGANADOR - PUNTOS2))
            echo "puntos necesarios para que el jugador gane : $PUNTOSJUGADOR"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA1 gane : $PUNTOS2"
            echo ""
            PUNTOS3=0
            PUNTOS4=0
        fi

        if (($JUGADORES == 3 ))
        then
            PUNTOSJUGADOR=$((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2=$((PUNTOSGANADOR - PUNTOS2))
            PUNTOS3=$((PUNTOSGANADOR - PUNTOS3))
            echo "puntos necesarios para que el jugador gane : $PUNTOSJUGADOR"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA1 gane : $PUNTOS2"
            echo ""
            echo "Puntos necesarios para que INTELIGENCIA2 gane : $PUNTOS3"
            echo ""
            PUNTOS4=0
        fi

        if (($JUGADORES == 4 ))
        then 
            PUNTOSJUGADOR=$((PUNTOSGANADOR - PUNTOSJUGADOR))
            PUNTOS2=$((PUNTOSGANADOR - PUNTOS2))
            PUNTOS3=$((PUNTOSGANADOR - PUNTOS3))
            PUNTOS4=$((PUNTOSGANADOR - PUNTOS4))
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
        PUNTOSTOTALESLOG=$(($PUNTOSJUGADOR + $PUNTOS2 + $PUNTOS3 + $PUNTOS4))
        echo "$PUNTOSTOTALESLOG" > puntostotaleslog.txt
    fi
}

function winnerpov()
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
        echo "$max" > puntosganadorlog.txt
        echo "0" > ganadorlog.txt
        if (($INTELIGENCIA == 1))
        then        
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""
        
            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                echo "nerdface"
            else
                echo "El jugador 1 gana"
            fi
        else
            echo "El jugador 1 gana"
        fi  
    fi 

    if (($max == $2))
    then
        echo "$max" > puntosganadorlog.txt
        echo "1" > ganadorlog.txt
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                echo "soga"
            else
                echo "El jugador 2 (bot1) gana"   
            fi
        else    
            echo "El jugador 2 (bot1) gana"
        fi     
    fi

    if (($max == $3))
    then
        echo "$max" > puntosganadorlog.txt
        echo "2" > ganadorlog.txt
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                echo "soga"
            else
                echo "El jugador 3 (bot2) gana"   
            fi
        else    
            echo "El jugador 3 (bot2) gana"
        fi     
    fi

    if (($max == $4))
    then
        echo "$max" > puntosganadorlog.txt
        echo "3" > ganadorlog.txt
        if (($INTELIGENCIA == 0))
        then
            read -r -p  "QUIERES RESPUESTA GRACIOSA? [Y/N]" RESPUESTA
            echo ""

            if [[ "$RESPUESTA" =~ ^([yY][eE][sS]|[yY])$ ]]
            then
                echo "soga"
            else
                echo "El jugador 4 (bot3) gana"   
            fi
        else    
            echo "El jugador 4 (bot3) gana"
        fi     
    fi
}

function clasificacion()
{
    source config.cfg

    sort -k 4 -t "|" -n $LOG > temp1.txt
    echo "Datos de la partida mas corta: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | head -n 1
    echo -e "\e[32m=======================================================================================================\e[0m"
    echo ""
    echo "Datos de la partida mas larga: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | tail -1
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo ""
    sort -k 5 -t "|" -n $LOG > temp1.txt
    echo "Datos de la partida con mas rondas: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | tail -1
    echo -e "\e[32m=======================================================================================================\e[0m"
    echo ""
    echo "Datos de la partida con menos rondas: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | head -n 1
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo ""
    sort -k 7 -t "|" -n $LOG > temp1.txt
    echo "Datos de la partida con maximo PuntosGanador: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | tail -1
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo ""
    sort -k 9 -t "|" -n $LOG > temp1.txt
    echo "Datos de la partida con mas puntos obtenidos por todos los jugadores: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat temp1.txt | tail -1
    echo -e "\e[32m=======================================================================================================\e[0m"
    
    rm temp1.txt
    echo ""
}

function estadisticas()
{
    source config.cfg

    cut -d "|" -f 1 $LOG > fecha.txt
    cut -d "|" -f 2 $LOG > hora.txt
    cut -d "|" -f 3 $LOG > jugadores.txt
    cut -d "|" -f 4 $LOG > tiempo.txt
    cut -d "|" -f 5 $LOG > rondas.txt
    cut -d "|" -f 6 $LOG > inteligencia.txt
    cut -d "|" -f 7 $LOG > puntosganador.txt
    cut -d "|" -f 8 $LOG > jugadorganador.txt
    cut -d "|" -f 9 $LOG > puntos.txt


    echo "Numero de partidas jugadas: "
    echo -e "\e[32m=======================================================================================================\e[0m"
    cat fecha.txt | wc -l 
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo "Media de los puntos ganadores: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print sum/NR}' puntosganador.txt
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo "Media de rondas de las partidas jugadas: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print sum/NR}' rondas.txt
    echo -e "\e[32m=======================================================================================================\e[0m"    

    echo "Media de los tiempos de todas las partidas jugadas: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print sum/NR}' tiempo.txt
    echo -e "\e[32m=======================================================================================================\e[0m"    

    echo "Tiempo total invertido en todas las partidas: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print sum}' tiempo.txt
    echo -e "\e[32m=======================================================================================================\e[0m"

    echo "Porcentaje de partidas jugadas con inteligencia activada: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print (sum/NR)*100 "%" }' inteligencia.txt
    echo -e "\e[32m=======================================================================================================\e[0m"    

    echo "Media de la suma de los puntos obtenidos por todos los jugadores en las partidas jugadas: "
    echo -e "\e[32m=======================================================================================================\e[0m"    
    awk '{sum+=$1} END {print sum/NR}' puntos.txt
    echo -e "\e[32m=======================================================================================================\e[0m"    
    echo ""

    rm fecha.txt
    rm hora.txt
    rm jugadores.txt
    rm tiempo.txt
    rm rondas.txt
    rm inteligencia.txt
    rm puntosganador.txt
    rm jugadorganador.txt
    rm puntos.txt
}


function menu()
{
clear screen
echo -e #new line
echo " ___     ___    __  __   ___   _  _    ___    "
echo "|   \   / _ \  |  \/  | |_ _| | \| |  / _ \   "
echo "| |) | | (_) | | |\/| |  | |  |  ' | | (_) |  "
echo "|___/   \___/  |_|  |_| |___| |_|\_|  \___/   "
echo "                                              "

echo "POR ALVARO Y JAVIER"



echo "************"
echo "1. CONFIGURACION DE PARTIDA"
echo "2. JUGAR"
echo "3. CLASIFICACION"
echo "4. ESTADISTICAS"
echo "5. SALIR"
echo "************"
echo -e #new line
read -r -p "Seleccione una opcion: " c
echo -e #new line

if((c != 5))
then
    while true
    do
        case $c in
            1)
            existeconfig
            configuracionpartida
            pausa
            clear screen
            ;;
            2)
            FLAG=0
            existeconfig
            comprobarconfig
                if [[ $FLAG -eq 1 ]]
                then
                    echo "El fichero config.cfg no es valido"
                    echo "Vuelva a la opcion 1 para configurarlo"
                    echo -e #new line
                    pausa
                    clear screen
                else
                    echo "El fichero config.cfg es valido"
                    echo -e #new line
                    pausa
                    clear screen
                    
                    echo "0" > bandera.txt 
                    juego
                fi
            ;;
            3)
            existelog
            comprobarlog
            if (( $FLAG == 1))
            then
                clasificacion
                vaciarlog
            else
                echo "El archivo de log esta vacio"
            fi
            echo -e #new line
            ;;
            4)
            existelog
            comprobarlog
            if (( $FLAG == 1))
            then
                estadisticas
                vaciarlog
            else
                echo "El archivo de log esta vacio"
            fi
                echo -e #new line
            ;;
            5)
                echo "Has decidido salir"
                break
            ;;
        esac


    clear screen
    echo -e #new line
    echo " ___     ___    __  __   ___   _  _    ___    "
    echo "|   \   / _ \  |  \/  | |_ _| | \| |  / _ \   "
    echo "| |) | | (_) | | |\/| |  | |  |  ' | | (_) |  "
    echo "|___/   \___/  |_|  |_| |___| |_|\_|  \___/   "
    echo "                                              "

    echo "POR ALVARO Y JAVIER"



    echo "************"
    echo "1. CONFIGURACION DE PARTIDA"
    echo "2. JUGAR"
    echo "3. CLASIFICACION"
    echo "4. ESTADISTICAS"
    echo "5. SALIR"
    echo "************"
    echo -e #new line
    read -r -p "Seleccione una opcion: " c
    echo -e #new line

    done 
fi
}
menu