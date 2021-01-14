#!/bin/bash

verbose=0
extension=".save"
files=""

while [ $# -ge 1 ]; do
    case "$1" in
        -v|--verbose) # mode verbose
            verbose=1
            shift
        ;;
        -e|--extension) # extension personalisé
            extension=$2
            shift
            shift
        ;;
        *)
            files+="$1;"
            shift
        ;;
    esac
done

arrFiles=(${files//;/ })

for file in "${arrFiles[@]}"; do
    if [ -e $file ] || [ -f $file ]; then # si le fichier existe et que c'est un fichier
        directory=$(dirname $file) # récupère le repertoire du fichier
        cp "$file" "$directory/$file$extension" # copy dans le répertoire du fichier sous l'ext paramétré
    fi
    if [ $verbose -eq 1 ]; then
        if [ ! -e $file ] || [ ! -f $file ]; then # Si le fichier n'existe pas ou que ce n'est pas un fichier
            echo "$file n'existe pas ou alors, ce n'est pas un fichier"
        else
            echo "Sauvegarde de $file en $file$extension"
        fi
    fi
done