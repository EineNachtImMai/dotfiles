fatal() {
    echo -e "\x1b[1;31m[FATAL]\x1b[0m $1"
}

cmprun() {
    local file=$1
    gcc -std=c99 -Wall -o $1 "$1.c" || fatal "failed to compile $1.c"
    ./$1 || fatal "failed to run ./$1"
}
