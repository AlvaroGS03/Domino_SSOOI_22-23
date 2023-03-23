fichassinrepetir ()
{
    if (($1 > 0))
    then
    local arr
    inteligencia arr
    else
    local -n arr=$1    # use nameref for indirection
    arr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)
    fi
}


inteligencia ()
{

    test -e daigual.txt
    if [[ $? -eq 1 ]]
    then
        if (($1 == 0))
        then
            local array
            fichassinrepetir array
            echo ${array[@]}
            echo "le pasa el vector de indices"
        else
            #local array
            #funcionquealmacenavector array
            local array
            fichassinrepetir array
            read -r -p "Elija el elemento del array que quiere eliminar" eliminado
            j=$eliminado
            array=(${array[@]:0:$j} ${array[@]:$(($j+1))})
            i=$((i+1))
            fichassinrepetir $i
            local -n array=$1
        fi
        
        echo ${array[@]} > daigual.txt
    else
        arr=($(cat temp1.txt))
        #establezer temp1.txt = array
        read -r -p "Elija el elemento del array que quiere eliminar" eliminado
        j=$eliminado
        arr=(${arr[@]:0:$j} ${arr[@]:$(($j+1))})
        echo ${arr[@]} > daigual.txt
    fi
}



i=0
SALIR=1
while (( $SALIR!=0 ))
do
echo "Programa principal iteracion $i"

inteligencia $i

i=$((i+1))

read -r -p "pulse 0 para salir: " SALIR

done