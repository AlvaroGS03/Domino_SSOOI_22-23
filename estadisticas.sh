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
cat fecha.txt | wc -l 

echo "Media de los puntos ganadores: "
awk '{sum+=$1} END {print sum/NR}' puntosganador.txt

echo "Media de rondas de las partidas jugadas: "
awk '{sum+=$1} END {print sum/NR}' rondas.txt

echo "Media de los tiempos de todas las partidas jugadas: "
awk '{sum+=$1} END {print sum/NR}' tiempo.txt

echo "Tiempo total invertido en todas las partidas: "
awk '{sum+=$1} END {print sum}' tiempo.txt

echo "Porcentaje de partidas jugadas con inteligencia activada: "
awk '{sum+=$1} END {print (sum/NR)*100 "%" }' inteligencia.txt

echo "Media de la suma de los puntos obtenidos por todos los jugadores en las partidas jugadas: "
awk '{sum+=$1} END {print sum/NR}' puntos.txt

read -s -n 1 -p "Pulse cualquier tecla para continuar . . ."
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

echo ""
read -s -n 1 -p "Pulse cualquier tecla para continuar . . ."
echo ""

rm temp1.txt