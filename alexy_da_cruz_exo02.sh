#!/bin/bash

# On demande la borne supérieur
read -p "Saisissez la borne supérieur [100] : " $valBorneSup

# 100 par défaut si l'utilisateur ne rentre rien
if [ -z "$valBorneSup" ]; then
    valBorneSup=100
fi

# On génère le nombre mystère
nbMystere=$((RANDOM%$valBorneSup+1))
nbUser=0 # On assigne nbUser afin de l'utiliser dans notre while

# Tant que nbUser n'est pas le nombre mystère
while [ $nbUser -ne $nbMystere ]; do
    # On demande un nombre entre 1 et 60
    read -p "Saisissez un nombre entre 1 et 60 : " nbUser

    # Indication pour l'utilisateur selon nbUser.
    if [ $nbUser -gt $nbMystere ]; then
        echo "Le nombre mystère est plus petit que $nbUser."
    elif [ $nbUser -lt $nbMystere ]; then
        echo "Le nombre mystère est plus grand que $nbUser."
    else
        echo "Bravo, le nombre mystère était $nbMystere !!"
    fi
done