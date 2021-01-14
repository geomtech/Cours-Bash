#!/bin/bash

stRepertoire=/bin           # Variable Répertoire
stProgramme=/bin/bash       # Variable Fichier

Top5LargestFiles=$(ls -S $stRepertoire| head -n 5 | tr '\n' ' ')                                        # Récupère les 5 fichiers les plus gros
Top5OldestFiles=$(ls -rt $stRepertoire| head -n 5 | tr '\n' ' ')                                        # Récupère les 5 fichiers les plus vieux
FileSize=$(du -h $stProgramme| cut -f1)                                                                 # Récupère la taille du fichier
FileModificationDate=$(ls $stProgramme -l --time-style=long-iso | cut -d ' ' -f6 | date +%d/%m/%Y)      # Récupère la date de modification du fihcier

# Affichage des résultats
echo -e "\nLes 5 fichiers les plus gros sont : $Top5LargestFiles \n"
echo -e "Les 5 fichiers les plus anciens sont : $Top5OldestFiles \n"
echo -e "La taille du fichier /bin/bash est : $FileSize \n"
echo -e "La date de modification du fichier /bin/bash est : $FileModificationDate \n"