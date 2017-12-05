#!/bin/bash
#author: Rafael @Bucio
#Verificar Links
#Prueba de concepto y automatización en shell
#03 / Marzo / 2017


clear;

echo ""
function cargando()
   {
echo -ne '\n'
echo -ne 'tpx0000x0x0x0as98                                      (5%)\r'
sleep .7
echo -ne 'tpx0x909x09asd000000d0w1                                      (10%)\r'
sleep .5
echo -ne 'tpx0x09x09asd0wn8asd8as8d00010                                      (15%)\r'
sleep .8
echo -ne 'tpx0a500a989asd0dnloadera7sd0104010                                      (25%)\r'
sleep .1
echo -ne 'tpx0x50asd89a7as90d8120a0104010                                     (55%)\r'
sleep .1
echo -ne 'tpx10x0sa9da09sd090x0x09ad90asd0asd                                      (75%)\r'
sleep .1
echo -ne 'CheckL1nk  !! is  Ready                                                  (100%)\r'
echo -ne '\n'
sleep 1

   }
function cargandoo()
   {
echo -ne '\n'
echo -ne 'tpx0000x0x0x0as98                                      (5%)\r'
sleep .7
echo -ne 'tpx0x909x09asd000000d0w1                                      (10%)\r'
sleep .5
echo -ne 'tpx0x09x09asd0wn8asd8as8d00010                                      (15%)\r'
sleep .8
echo -ne 'tpx0a500a989asd0dnloadera7sd0104010                                      (25%)\r'
sleep .1
echo -ne 'tpx0x50asd89a7as90d81200x0x90912a0104010                                     (55%)\r'
sleep .1
echo -ne 'tpx10x0sa9da09sd090x0x09ad90asd0a89s09zx0asd                                      \r'
sleep .1
echo -ne 'CheckL1nk  !! is  Ready                                                    (100%)\r'
echo -ne '\n'
sleep 1

   }


#PruebaCargar
#while :;do for s in / - \\ \|; do printf "\r$s";sleep .4;done;done

cargando

clear;

echo ' 

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
______________    V.1.0   ______ ___________       ______  
__  ____/__  /_______________  /____  /___(_)_________  /__
_  /    __  __ \  _ \  ___/_  //_/_  / __  /__  __ \_  //_/
/ /___  _  / / /  __/ /__ _  ,<  _  /___  / _  / / /  ,<   
\____/  /_/ /_/\___/\___/ /_/|_| /_____/_/  /_/ /_//_/|_|  

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
'
echo "                Ojo Donde das click! "
echo "             Script de automatizacion "
echo "          Por Rafael @Bucio - tpx Security "
echo "      "
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  "


menu=("Verificar" "Info" "Salir")
select opt in "${menu[@]}"
do
    case $opt in
      "Verificar")
      echo ""
          clear
            echo "-------------------------------------------------------------------"
            echo "                [+] Verificar URL - SHORT/URL    [+]               "
            echo "-------------------------------------------------------------------"
            echo "[+] Vamos a crear un perfil de la busqueda "
            echo "[+] ingresa nombre de la web y presiona enter "
            echo "[!] (ejemplo: si escaneas a https://tpx.mx ingresas de nombre:tpx) "
            read nombre
            echo "[+] Ingresa la URL (con http o https) , y presiona enter"
            read url
            cargando

            echo "[+]-------------------------------------------------------------------[+]"
            echo -e '\n'
            echo "[+] Esta URL te envia a:"
            echo -e '\n'
            echo "[!] " | curl $url -s -L -I -o /dev/null -w '%{url_effective}' 

            efectiva=$(curl $url -s -L -I -o /dev/null -w '%{url_effective}')
            echo -e '\n'
            echo "[+] Esta bajo un servidor:"
            echo -e '\n'
            echo "[!] " | curl -sI $efectiva | sed -n 's/Server: *//p'
            echo -e '\n'
            echo "[+] El titulo de la pagina es:"
            echo -e '\n'
            echo "[!] " | curl -a --silent $efectiva | grep -o '<title>.*</title>' |  awk -F">" '{print $2}' | awk -F"<" '{print $1}'
            echo -e '\n'
            echo "[+]-------------------------------------------------------------------[+]"
            echo -e '\n'

            sleep 7
            echo  "[+] Creando archivo de logs  "
            echo -e '\n'
            cargando
            echo -e '\n'
                 fecha=`date +%F_%R`
                 archivolog=log-$fecha-$nombre.txt
            curl -w 'CheckLink ha descargado %{size_download} bytes\n' -A 'juakerss/3.0 (Win93; I)' $url -v > $archivolog
            echo -e '\n'
            sleep 4
            echo "[+] Verificar Archivo: $archivolog -----------------------------------[+]"
            echo -e '\n'
            cargandoo
            echo -e '\n'
            
            echo "[+]-------------------------------------------------------------------[+]"

            echo "[!!] Completado, lista de logs descargados"
            echo -e '\n'
            ls -lt *.txt
            echo -e '\n'

            echo "[+]-------------------------------------------------------------------[+]"
          echo "EOF"
            ;;  


        "Info")
      echo ""
            echo " -- CheckL1nk v 1.0 --"
            echo " Un simple script para verificar como en los viejos tiempos"
            echo " --- By @Bucio --  "
            ;;

        "Salir")
          echo " off"
            break
            ;;
        *) echo Opcion invalida;;
    esac
done
