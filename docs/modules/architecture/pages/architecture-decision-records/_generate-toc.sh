#!/bin/bash
subdir=$(echo "$PWD" |sed -E 's,(.*)pages/(.*),\2,')
echo "= ADR Overview" > index.adoc
{
echo ""
echo '[cols="1,2,3,1"]'
echo '|==='
echo "|ID|Keywords|Summary|Status"
echo ""
for i in 0*-*.adoc ; do
    summary=$(head -1 "$i" | cut -d= -f2 | xargs)
    adr_nr=$(echo "$i" | cut -d- -f1)
    status=$(grep ":status:" "$i" | cut -d":" -f3 | sed -e 's/^[[:space:]]*//g' -e 's/ *$//g')
    keywords=$(awk '/keywords:/{print}' "$i" | cut -d: -f3 | sed -e 's/^[[:space:]]*//')
    echo "|xref:${subdir}/${i}[ADR-$adr_nr]|$keywords|$summary|$status"
done
echo '|==='
} >> index.adoc
