#!/bin/bash

: <<'JKS-DOC'

Free Tools to download for Oracle DB SQL and Performance works

Session Snapper 4
Home: http://blog.tanelpoder.com/2013/02/10/session-snapper-v4-the-worlds-most-advanced-oracle-troubleshooting-script/
Download: http://blog.tanelpoder.com/files/scripts/snapper4.sql


SQLd360
Home: http://mauro-pagano.com/2015/02/16/sqld360-sql-diagnostics-collection-made-faster/
Download: https://github.com/mauropagano/sqld360/archive/master.zip


Pathfinder
Home: http://mauro-pagano.com/2015/10/26/introducing-pathfinder-is-there-a-better-plan-for-my-sql/
Download: https://github.com/mauropagano/pathfinder/archive/master.zip


TUNAs360
Home: http://mauro-pagano.com/2016/03/21/introducing-tunas360-tuning-with-active-sessions-without-diagnostic-pack/
Download: https://github.com/mauropagano/tunas360/archive/master.zip


edb360
Home: https://carlos-sierra.net/2014/07/27/edb360/
Download: https://github.com/carlos-sierra/edb360/archive/master.zip


meta360
Home: https://carlos-sierra.net/2016/03/20/getting-ddl-metadata-for-an-application-schemas/
Download: https://github.com/carlos-sierra/meta360/archive/master.zip

JKS-DOC

declare -a tools
declare -a urls

tools=(snapper sqld360 pathfinder tunas360 edb360 meta360)
urls=(\
	http://blog.tanelpoder.com/files/scripts/snapper4.sql \
	https://github.com/mauropagano/sqld360/archive/master.zip \
	https://github.com/mauropagano/pathfinder/archive/master.zip \
	https://github.com/mauropagano/tunas360/archive/master.zip \
	https://github.com/carlos-sierra/edb360/archive/master.zip \
	https://github.com/carlos-sierra/meta360/archive/master.zip \
)


i=0
toolCount=${#tools[*]}

while [ $i -lt $toolCount ]
do
	echo Tool: ${tools[$i]}
	echo URL : ${urls[$i]}
	echo 
	mkdir -p ${tools[$i]}
	wget -N ${urls[$i]} -P ${tools[$i]}
	(( i++ ))
done

i=0

zipFile='free-sql-tools.zip'

echo 
echo Creating Zip File $zipFile
echo 

toolStr=''

while [ $i -lt $toolCount ]
do
	toolStr="$toolStr ${tools[$i]}"
	(( i++ ))
done

echo toolStr: $toolStr

zip -r $zipFile $toolStr




