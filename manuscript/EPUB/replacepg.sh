#!/bin/bash

filename="ch001.xhtml"
tempfile=$(mktemp)

pagenum=1
while IFS= read -r line
do
  while [[ $line == *"PAGEBREAK"* ]]
  do
    line=${line/PAGEBREAK/<span epub:type=\"pagebreak\" role=\"doc-pagebreak\" title=\"3\" id=\"pg$pagenum\"><\/span>}
    ((pagenum++))
  done
  echo "$line" >> "$tempfile"
done < "$filename"

mv "$tempfile" "$filename"
