#! /bin/bash
#Desenvolvedor: João Nossol
#https://github.com/joaonossolb
echo "Instalando adicionais"
apt-get install libssl-dev libssh-dev libidn11-dev libpcre3-dev \
                 libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev \
                 firebird-dev

echo "Executando os scripts"

echo "hydra-http-form.c"
./hydra-http-form.sh   
echo "hydra-http-proxy-urlenum.c"
./hydra-http-proxy-urlenum.sh
echo "hydra-http-proxy.c"
./hydra-http-proxy.sh  
echo "hydra-http.c"
./hydra-http.sh                
echo "sasl.c"
./sasl.sh

echo "Abrindo Arquivos de configuração..."
leafpad hydra-http-form.c
leafpad hydra-http-proxy-urlenum.c
leafpad hydra-http-proxy.c
leafpad hydra-http.c
leafpad sasl.c
echo "Instalando o hydra com o User-Agent modificado :)"
./configure
make
make install
if [ "$?" == 0 ];then
	echo "Hydra com o User-Agent modificado instalado com sucesso :)"
fi

if [ "$?" != 0 ];then
	echo "Algum Erro aconteceu :("
fi
