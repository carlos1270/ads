echo Cont MenUsed MenFree MenShared SwapUsed SwapFree DiskBlock DiskKB NetBytesReceived CpuUsr CpuSys CpuSoft CpuIOWait CpuIdle DiskPerc Data Hora > log.txt
#NetPackagesReceived NetBytesTransmitid NetPackagesTransmitid
echo Cont MenUsed MenFree MenShared SwapUsed SwapFree DiskBlock DiskKB NetBytesReceived CpuUsr CpuSys CpuSoft CpuIOWait CpuIdle DiskPerc Data Hora
#NetPackagesReceived NetBytesTransmitid NetPackagesTransmitid
cont=1
while [ True ]
do

men=`free | grep Mem | awk '{print $3, $4, $5}'`
swap=`free | grep Swap | awk '{print $3, $4}'`
disco=`df | grep sda5 | awk '{print $2, $3, $5}'`
mpstat=`mpstat | grep all | awk '{print $3, $5, $6, $8, $12}'`
net_1=`cat /proc/net/dev | grep enp | awk '{print $2, $3, $10, $11}'`
sleep 1
net_2=`cat /proc/net/dev | grep enp | awk '{print $2, $3, $10, $11}'`

net_br_1=`echo $net_1 | awk '{print $1}'`
net_br_2=`echo $net_2 | awk '{print $1}'`
net_br=`expr $net_br_2 - $net_br_1` 

data=`date '+%d/%m/%y %H:%M:%S'`

echo $cont $men $swap $disco $net_br $mpstat $data >> log.txt
echo $cont $men $swap $disco $net_br $mpstat $data

#Frequencia de amostragem

cont=`expr $cont + 1`

done
