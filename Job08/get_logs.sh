date=$(date +%d%m-%Y-%H:%M)
last latouillette | wc -l > number_connection-$date #récupération des logs avec last et le filtre latouillette et redirection en comptant les lignes dans le fihier souhaité

tar  -cvf number_connection-$date.tar.gz number_connection-$date #compression du fichier dans le répertoire courant
rm number_connection-$date #suppression du fichier originel
mv number_connection-$date.tar.gz /Users/latouillette/Documents/LaPlateforme/Système/Shellexe/Job08/Backup/ #déplacement de l'archive dans le bon répertoire

#Je suis sur mac alors cron marche pas donc j'ai mis la commande dans crontab.txt