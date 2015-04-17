#!/bin/bash

#gd.sh

sed -ue 's/<[^>]\+>/ /g'|
sed -ue 's/  */ /g;s/\t\t*/ /g'|
tr ' ' '\n'|
sed -ue '/ /d;/^$/d'|
9 grep '^[a-zA-ZüöäÜÖÄßẞ][a-züöäß]+$'|
ag -v '([a-zA-ZüöäÜÖÄßẞ])\1{3}'|
grep -vE '^(break|case|catch|continue|debugger|default|delete|do|else|false|finally|for|function|if|in|instanceof|new|null|return|switch|this|throw|true|try|typeof|var|void|while|with|abstract|boolean|byte|char|class|const|double|enum|export|extends|final|float|goto|implements|import|int|interface|let|long|native|package|private|protected|public|short|static|super|synchronized|throws|transient|volatile|yield|alert|blur|closed|document|focus|frames|history|innerHeight|innerWidth|length|location|navigator|open|outerHeight|outerWidth|parent|screen|screenX|screenY|statusbar|window|sync|cache|ibn|of|at|en|fr|Fr|Sa|Mo|di|Mi|mi|Le|la|del|to|tsor|de|the|cache)$'
