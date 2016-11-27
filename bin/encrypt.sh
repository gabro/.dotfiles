CONF_FILE="application.conf"

openssl cast5-cbc -e -in $1 -pass file:$HOME/.buildo-credentials-pass -out $1.cast5
