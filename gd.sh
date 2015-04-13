#!/bin/bash

#gd.sh

curl $1|
tr '\n' ' '|
sed -e 's/<[^>]\+>/ /g'|
sed -e 's/  */ /g'|
sed -e 's/\t\t*/ /g'|
tr '[ ]' '\n'|
sed -e '/ /d'|
sed -e '/^$/d'|
grep '^[a-zA-Z][a-zA-Z]*$'|
grep -vE '(break|case|catch|continue|debugger|default|delete|do|else|false|finally|for|function|if|in|instanceof|new|null|return|switch|this|throw|true|try|typeof|var|void|while|with|abstract|boolean|byte|char|class|const|double|enum|export|extends|final|float|goto|implements|import|int|interface|let|long|native|package|private|protected|public|short|static|super|synchronized|throws|transient|volatile|yield|alert|blur|closed|document|focus|frames|history|innerHeight|innerWidth|length|location|navigator|open|outerHeight|outerWidth|parent|screen|screenX|screenY|statusbar|window)'
