#!/bin/sh
# ************************************************
# * Corona-Info V1.81                            *
# *                                              *
# * zusammengestellt und angepasst von           *
# * fred_feuerstein (NI-Team)                    *
# *                                              *
# *                                              *
# * Daten kommen von                             *
# * https://corona.lmao.ninja/countries          *
# *                                              *
# * angezeigt werden ausgewählte Länder          *
# * Deutschland, Italien, Spanien, USA,          *
# * Oesterreich, Frankreich, Schweiz, China      *
# * Niederlande, UK, S.Korea, Russia             *
# *                                              *
# * gewünschte Länder können in der Datei        *
# * corona.land im Pluginverzeichnis editiert    *
# * werden. (Länderkennzeich,Anzeigename)        *
# ************************************************


# Bitte Variablen ggfs. anpassen:
#################################################

# Aufrufvariante für Download, "WGET" oder "CURL" bitte auswählen
command="WGET" 



# ab hier keine Eintragung mehr nötig
#################################################
# pluginpath entsprechend setzen, ggfs. von /var/tuxbox/plugins auf /share/tuxbox/neutrino/plugins" ändern
# pluginpath mit $(dirname $0) sollte bei allen passen ;) (thx. DboxOldie)
pluginpath="$(dirname "$0")"

vinfo="V1.81"
path=$pluginpath"/corona_hint.png"
titletext1="Corona-Info"

echo "--------------------------------------------------"
echo "Corona-Info "$vinfo" startet"
echo "-----------------------------by fred_feuerstein---"

cleanup() {
	rm -rf /tmp/corona*
}

echo "Corona-Info - Temp-Dateien gelöscht"
cleanup


if [ -e "$pluginpath"/corona.land ]; then
	  cp "$pluginpath"/corona.land /tmp/coronaland.tmp
	  echo "Corona-Info - corona.land Datei wird genutzt"
	else 
		echo '"DEU",Deutschland' >> /tmp/coronaland.tmp
		echo '"ITA",Italien' >> /tmp/coronaland.tmp
		echo '"ESP",Spanien' >> /tmp/coronaland.tmp
		echo '"PRT",Portugal' >> /tmp/coronaland.tmp
		echo '"USA",USA' >> /tmp/coronaland.tmp
		echo '"AUS",~Osterreich' >> /tmp/coronaland.tmp
		echo '"CH",Schweiz' >> /tmp/coronaland.tmp
		echo '"FRA",Frankreich' >> /tmp/coronaland.tmp
		echo '"NL",Niederlande' >> /tmp/coronaland.tmp
		echo '"CHN",China' >> /tmp/coronaland.tmp
		echo '"KOR",S~udkorea' >> /tmp/coronaland.tmp
		echo '"RUS",Russland' >> /tmp/coronaland.tmp
		echo '"UK",Gro~zbritannien' >> /tmp/coronaland.tmp
	  echo "Corona-Info - corona.land nicht vorhanden - Default-Laender werden genutzt"
fi

lines=$(sed $= -n /tmp/coronaland.tmp)

echo "Corona-Info - Länderanzahl = "$lines". "

msgbox popup="Daten werden geholt... (ca. 6 Sekunden)" icon="$path" title="$titletext1 $vinfo ($command)" timeout=02

echo "Corona-Info - Länderdaten-Download"

if [ $command = "WGET" ]; then
  wget -O /tmp/corona.tmp https://corona.lmao.ninja/countries --no-check-certificate
 else
  curl -k -o /tmp/corona.tmp https://corona.lmao.ninja/countries
fi 

if [ -e /tmp/corona.tmp ]; then
  sed -i -e 's|{"cou|\n|g' /tmp/corona.tmp
  echo "Corona-Info - Länderdaten erfolgreich geladen"
 else
  echo "Corona-Info - Länderdaten in /tmp/corona.tmp nicht gefunden"
fi

if [ $command = "WGET" ]; then
  wget -O /tmp/coronagesamt.tmp https://corona.lmao.ninja/all --no-check-certificate
 else
  curl -k -o /tmp/coronagesamt.tmp https://corona.lmao.ninja/all
fi 

if [ -e /tmp/coronagesamt.tmp ]; then
  echo "Corona-Info - Länderdaten-Summe erfolgreich geladen"
 else
  echo "Corona-Info - Länderdaten-Summe in /tmp/coronagesamt.tmp nicht gefunden"
fi


#############################
## Übersicht erstellen

uebersicht() {

echo "Corona-Info - Daten werden aufbereitet zur Anzeige"

### Werte aller Länder ermitteln und in Datei speichern.

echo "~s" >> /tmp/coronalist.txt
echo "Land    ~T0240~YGesamt  ~T0340      ~T0420~RGesamt ~T0500 ~T0580 ~T0650~YErkrankt ~T0745~B ~T0830~GGeheilt ~T0930~YFälle p.  ~T1035~RTote p." >> /tmp/coronalist.txt
echo " ~T0240~YInfizierte  ~T0340heute      ~T0420~RTote ~T0500Quote ~T0580heute ~T0650~Ymild ~T0745~Bkritisch ~T0830~Ggemeldet ~T0930~YMio.Einw  ~T1035~RMio.Einw" >> /tmp/coronalist.txt
echo "~s" >> /tmp/coronalist.txt


i=0

for i in $(seq 1 "$lines"); do

landtemp=0
LAND=0
GESAMT=0
NEU_HEUTE=0
TOTE=0
TOTE_HEUTE=0
GEHEILT=0
ERKRANKT=0
KRITISCH=0
FALLPROMILLION=0
TOTEPROMILLION=0

landtemp=$(head -n"$i" /tmp/coronaland.tmp | tail -n1 | cut -d "," -f1)
landanzeige=$(head -n"$i" /tmp/coronaland.tmp | tail -n1 | cut -d "," -f2)

LAND=$(cat /tmp/corona.tmp | grep "$landtemp")
GESAMT=$(echo "$LAND" | sed 's/.*cases":\(.*\)$/\1/' | cut -d "," -f1)
NEU_HEUTE=$(echo "$LAND" | sed 's/.*todayCases":\(.*\)$/\1/' | cut -d "," -f1)
TOTE=$(echo "$LAND" | sed 's/.*deaths":\(.*\)$/\1/' | cut -d "," -f1)
TOTE_HEUTE=$(echo "$LAND" | sed 's/.*todayDeaths":\(.*\)$/\1/' | cut -d "," -f1)
QUOTETEMP=$(echo | awk '{print '$TOTE'*100/'$GESAMT'}')
QUOTE=$(printf "%.1f\n" $QUOTETEMP)
GEHEILT=$(echo "$LAND" | sed 's/.*recovered":\(.*\)$/\1/' | cut -d "," -f1)
ERKRANKT=$(echo "$LAND" | sed 's/.*active":\(.*\)$/\1/' | cut -d "," -f1)
KRITISCH=$(echo "$LAND" | sed 's/.*critical":\(.*\)$/\1/' | cut -d "," -f1)
FALLPROMILLION=$(echo "$LAND" | sed 's/.*casesPerOneMillion":\(.*\)$/\1/' | cut -d "," -f1)
TOTEPROMILLION=$(echo "$LAND" | sed 's/.*deathsPerOneMillion":\(.*\)$/\1/' | cut -d "," -f1)

echo $landanzeige" ~T0240~Y"$GESAMT" ~T0340"$NEU_HEUTE"  ~T0420~R"$TOTE"  ~T0500"$QUOTE"% ~T0580"$TOTE_HEUTE" ~T0650~Y"$ERKRANKT" ~T0745~B"$KRITISCH" ~T0830~G"$GEHEILT" ~T0930~Y"$FALLPROMILLION" ~T1035~R"$TOTEPROMILLION"" >> /tmp/coronalist.txt

done

ALL=$(cat /tmp/coronagesamt.tmp)
ALL_GESAMT=$(echo "$ALL" | sed 's/.*cases":\(.*\)$/\1/' | cut -d "," -f1)
ALL_TOTE=$(echo "$ALL" | sed 's/.*deaths":\(.*\)$/\1/' | cut -d "," -f1)
ALL_GEHEILT=$(echo "$ALL" | sed 's/.*recovered":\(.*\)$/\1/' | cut -d "," -f1)
ALL_ERKRANKT=$(echo "$ALL" | sed 's/.*active":\(.*\)$/\1/' | cut -d "," -f1)
ALL_QUOTETEMP=$(echo | awk '{print '$ALL_TOTE'*100/'$ALL_GESAMT'}')
ALL_QUOTE=$(printf "%.1f\n" $ALL_QUOTETEMP)
ALL_ANZAHL=$(echo "$ALL" | sed 's/.*affectedCountries":\(.*\)$/\1/' | cut -d "}" -f1)
ALL_UPDATETEMP=$(echo "$ALL" | sed 's/.*updated":\(.*\)$/\1/' | cut -d "," -f1)
ALL_UPDATE=$(date -d @${ALL_UPDATETEMP:0:10} '+%d.%m.%Y - %H:%M')

echo "~s" >> /tmp/coronalist.txt
echo "Gesamt Weltweit ~T0240~Y"$ALL_GESAMT" ~T0340  ~T0420~R"$ALL_TOTE"  ~T0500"$ALL_QUOTE"% ~T0580 ~T0650~Y"$ALL_ERKRANKT" ~T0745~B ~T0830~G"$ALL_GEHEILT" ~T0930~SAnz. Länder: "$ALL_ANZAHL"" >> /tmp/coronalist.txt
echo "~s" >> /tmp/coronalist.txt
echo "~cQuelle: https://corona.lmao.ninja/countries - Datenstand: "$ALL_UPDATE" Uhr" >> /tmp/coronalist.txt 
echo "~cDie Liste der L~ander kann in der Datei corona.land editiert/sortiert werden. fred_feuerstein (NI-Team)" >> /tmp/coronalist.txt 

}


uebersicht

echo "Corona-Info - Übersicht wurde erstellt"

#############################
## Übersicht Anzeigen


if [ "$lines" -ge "24" ]; then
    rowsize="15"
   elif [ "$lines" -ge "19" ]; then
    rowsize="17"
   elif [ "$lines" -ge "17" ]; then
    rowsize="19" 
   elif [ "$lines" -le "16" ]; then
    rowsize="21"
fi

echo "Corona-Info - Schriftgröße "$rowsize" eingestellt!"

echo "Corona-Info - Anzeige am TV"

while :; do
auswahl=1
msgbox msg=/tmp/coronalist.txt size="$rowsize" icon="$path" title=$titletext1" "$vinfo select=EXIT default=$auswahl >/dev/null
		auswahl=$?
		case $auswahl	in
	  1)
		  #Abbruch
      rm -f /tmp/corona*
      echo "Corona-Info - Exit (OK-Taste)"
      exit 0
  		;;
		*)
      rm -f /tmp/corona*
      echo "Corona-Info - Exit (Exit-Taste)"
      exit 0
			;;
		esac
done

cleanup

exit 0
