echo "Building tags, wait"

generate_cscope() {
    echo "Generating cscope database."

    LLISTA_DIRS=""
    while (( "$#" )); do

        LLISTA_DIRS=$LLISTA_DIRS" -s $1"

        LLISTA_SIM_LINKS=$(find "$1" -type l)
        for sim_link in $LLISTA_SIM_LINKS
        do
            LLISTA_DIRS=$LLISTA_DIRS" -s "$(readlink $sim_link)
        done
        shift
    done
    cscope -Rbq $LLISTA_DIRS
    echo "CScope built."
}



if [[ -z $1 ]]
then
   dir=.;
else
   dir=$@;
fi
echo "Generating ctags file."
ctags -f tags --langmap=C:.c.pc.nc -h".h.c.cpp.pc" --languages=-SQL -R --fields=+iaSl --extra=+q $dir # la -l del fields és pel you complete me
echo "CTags built."

generate_cscope $dir

