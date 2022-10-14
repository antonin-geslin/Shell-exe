url="https://alcasar.laplateforme.io/intercept.php"

challenge=`curl -X GET $url -L | grep "challenge" | awk '{print $4}' | awk '{print $2}' FS='"'`  # récupération du token challenge 
echo $challenge
curl -X POST $url -H 'Content-Type: multipart/form-data' -F "challenge=$challenge" -F "userurl=http://www.euronews.com/" -F "username=$1" -F "password=$2" -F "button=Authentication" -L #envoie de toutes les information en POST du formulaire avec -F (format spécifié par le header) et -L pour les redirections


