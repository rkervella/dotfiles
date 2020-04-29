function listen() {
    PORT=$1
    socat readline tcp-listen:$PORT,fork,reuseaddr
}

function listen-tls() {
    PORT=$1
    CERT=$2
    KEY=$3
    socat readline openssl-listen:$PORT,fork,reuseaddr,key=$KEY,cert=$CERT,verify=0
}

function codeql-createdb() {
    if [ $# != 3 ];then
        echo "Usage: codeql-createdb LANGUAGE SOURCE OUTPUT_DIR"
        return
    fi
    LANG=$1
    IN=$2
    OUT=$3
    FILENAME=$(basename -- $IN)
    codeql database create --language=$LANG --source-root=$IN $OUT/$FILENAME
}

function opconnect() {
    eval $(op signin my)
}

function getpasswd() {
    if [ -z "$OP_SESSION_my" ]; then
        opconnect
    fi
    ITEM=$1
    TEMPLATE=$(op get item $ITEM 2>/dev/null | jq -r '.templateUuid')
    # TODO: handle same item name in different vaults
    # this thing doesn't really work
    if [ $? -eq 0 ]; then
        case $TEMPLATE in
            # Login template
            "001")
                FILTER=".details.fields[] | select(.designation==\"password\").value"
                ;;
            # Password template
            "005")
                FILTER=".details.password"
                ;;
        esac
        password=$(op get item $ITEM 2>&1)
        if [ $? -eq 0 ]; then
            echo $password | jq -r $FILTER | tr -d '\n'
        else
            echo "Something went wrong:"
            echo "$password"
        fi
    fi
}

function godoc {
    go doc $1 | chroma -s gruvbox
}
