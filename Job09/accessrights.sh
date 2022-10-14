i=2
j=$(wc -l <Shell_Userlist.csv)  #création de la condition d'arrêt avec le nombre de ligne du fichier et suppression de la sortie de wc
((j+=2))
#echo $j
while [ $i != $j ]      #boucle sur l'ensemble du Shell_Userlist.csv
do
    #sed -n $i'p' Shell_Userlist.csv
    sed -n $i'p' Shell_Userlist.csv > temp.txt        #affiche la ligne $i du fichier Shell_Userlist.csv et redirige la sortie dans temp.txt
    if grep -q 'Admin' temp.txt  # condition pour savoir si l'user est admin ou pas -q annule la sortie du grep
    then
        nom=$(cut -d ',' -f 2 temp.txt)    #isolement du nom et affectation variable
        mdp=$(cut -d ',' -f 4 temp.txt)    #isolement du mot de passe et affectation variable
        id=$(cut -d ',' -f 1 temp.txt)     #isolement de l'id et affectation variable
        #création du profil utilisateur admin
        dscl . -create /Users/$nom
        dscl . -create /Users/$nom UniqueID $id
        dscl . -passwd /Users/$nom $mdp
        dscl . -append /Groups/admin GroupMembership $nom
        #echo "ADMIN \n"
        #echo $nom
    else
        nom=$(cut -d ',' -f 2 temp.txt)     #isolement du nom et affectation variable
        mdp=$(cut -d ',' -f 4 temp.txt)     #isolement du mot de passe et affectation variable
        id=$(cut -d ',' -f 1 temp.txt)      #isolement de l'id et affectation variable
        #création du profil utilisateur 
        dscl . -create /Users/$nom
        dscl . -create /Users/$nom UniqueID $id
        dscl . -passwd /Users/$nom $mdp
        #echo $nom
    fi
    ((i+=1)) #itération de i pour avancer d'une ligne
done
rm temp.txt  #suppression du fichier temporaire temp.txt

#dscl . read /Groups/admin pour regarder les utilisateurs admins
#dscl . list Users pour lister tout les utilisateurs
#J'ai mis la cron commande dans crontab.txt
