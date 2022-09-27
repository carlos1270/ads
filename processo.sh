echo ID CpuUsr CpuSys CpuGst CpuWait CpuPerc MinFlt MajFlt %MEM Threads Swap RSS Size Data Hora > log2.txt
echo Analisando Processo 1900
echo ID CpuUsr CpuSys CpuGst CpuWait CpuPerc MinFlt MajFlt %MEM Threads Swap RSS Size Data Hora

cont=1
pid=3234

while [ True ]
do

info=`pidstat -p $pid -T ALL -h -r -u 1 1 | sed -n '4p' | awk '{print $4, $5, $6, $7, $8, $10, $11, $14}'`

threads=`cat /proc/$pid/status | grep Threads | awk '{print $2}'`
swap=`cat /proc/$pid/status | grep VmSwap | awk '{print $2}'`
rss=`cat /proc/$pid/status | grep VmRSS | awk '{print $2}'`
size=`cat /proc/$pid/status | grep VmSize | awk '{print $2}'`
data=`date '+%d/%m/%y %H:%M:%S'`

echo $cont $info $threads $swap $rss $size $data >> log2.txt
echo $cont $info $threads $swap $rss $size $data

sleep 1

#Frequencia de amostragem

cont=`expr $cont + 1`

done
