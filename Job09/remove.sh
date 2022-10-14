#script pour supprimer les utilisateurs crées 


i=2
j=$(wc -l <Shell_Userlist.csv)
((j+=2))

while [ $i != $j ]
do
    sed -n $i'p' Shell_Userlist.csv > temp.txt
    if grep -q 'Admin' temp.txt 
    then
        nom=$(cut -d ',' -f 2 temp.txt)
        dscl . delete /Users/$nom
        dscl . delete /Groups/admin GroupMembership $nom
    else
        nom=$(cut -d ',' -f 2 temp.txt)
        dscl . delete /Users/$nom
    fi
    ((i+=1))
done