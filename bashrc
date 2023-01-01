function cs {
    builtin cd "$@" && clear && ls -F
}

function .. {
    parent_dir="../"
    new_dir="./"
    for i in $(seq 1 $1)
    do
        new_dir=${new_dir}${parent_dir}
    done
    cs ${new_dir}
}
