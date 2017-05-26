#!/bin/bash


monitoramento() { 

echo "é: $0"
echo "é: $#"
echo "é: $*"
echo "é: $1"
echo "é: $2"

#i=$((32-$2))
aux=$(echo "((2^$i))"|bc)
aux1=$(($aux-2))
echo "é: $i"
echo "é: $aux1"

touch rede.ips
touch ips.txt

echo $1 > rede.ips

a=`cat rede.ips | cut -d "." -f1`
c=`cat rede.ips | cut -d "." -f3`
d=`cat rede.ips | cut -d "." -f4`
d1=$((d+1))

	for d1 in $(seq $aux1)
	do
		echo $a.$b.$c.$d1 >> ips.txt
	done

logip="testes"

counter=`wc -l ips.txt | cut -d " " -f 1`
contador=0

cat ips.txt | while read ip
	do
		retorno=`ping -q -c1 $ip | grep received | cut -d " " -f 4`

		if [ $retorno == 1 ]
		then
			echo "Teste para $ip teve sucesso" >> $logip
		else
			echo "Teste para $ip falhou" >> $logip
		fi
	done

contador=$((contador + 1))

echo >> $logip

echo "é: $contador"

}


# chamada da funcao de monitoramento de IPs
monitoramento




# links uteis
# https://www.tutorialspoint.com/unix/unix-shell-functions.htm