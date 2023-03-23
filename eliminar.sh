# flag=0

# while ((SALIR != 1))
# do

almacen() {
    local arr
    inteligencia arr
    echo "almacen eliminando el elemento 3: "
    echo ${arr[@]}

}

fichassinrepetir() {
# flag=$2

    local -n arr=$1             # use nameref for indirection
    arr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)


}

inteligencia() {
    local idk
    fichassinrepetir idk[]
    clear -x
    local -n idk=$1
    echo "dentro de principal"
    echo ${idk[@]}
    j=17
    idk=(${idk[@]:0:$j} ${idk[@]:$(($j+1))})
}






echo "codigo domino"
almacen