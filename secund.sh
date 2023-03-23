function secundaria ()
{
    echo "FUNCION SECUNDARIA"
    local -n ARRAYNAME=$1
    ARRAYNAME=(10 20 30)
}


function principal ()
{
    local ARRAY
    secundaria ARRAY
    echo ${ARRAY[@]}
}



echo "Inicio DEL programa que llama a las funciones"
principal