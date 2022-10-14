#version boucle for
for i in {1..10}  #itération sur i de 1 a 10 avec for
do  #début de la boucle
    echo "Je suis un script qui arrive à faire une boucle for " $i
done  #fin de boucle

#version boucle while
echo "\n"
i=1 #initialisation de i
while [ $i != 11 ] #boucle for avec condition d'arret sur i différent de 11
do  #début de la boucle
    echo "Je suis un script qui arrive à faire une boucle while" $i
    ((i+=1)) #itération de i
done #fin de boucle