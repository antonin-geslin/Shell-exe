if [ $2 == "x" ]; then   #condition sur la multiplication
    echo $(($1*$3))
elif [ $2 == "+" ]; then  #condition sur l'addition
    echo $(($1+$3))
elif [ $2 == "-" ]; then  #condition sur la soustraction 
    echo $(($1-$3))
elif [ $2 == "/" ] || [ $2 == "÷" ]; then  #condition sur la division
    echo $(($1/$3))
fi
