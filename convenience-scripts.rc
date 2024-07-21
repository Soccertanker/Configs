
# Convenience functions for terminal navigation
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


function cscopeinit() {
    curr_dir=$(pwd)
    find ${curr_dir} -regex "^.*\.\(c\|cpp\|h\|hpp\)$" > cscope.files
    cscope -b
    export CSCOPE_DB=${curr_dir}/cscope.out
}

parse_dir_and_str() {
# If dir is not given as argument, dir is "." by default.
    if [ "$#" -ge 2 ]; then
        dir=$1
        str=$2
    else
        dir="."
        str=$1
    fi
}

function ff() {
    parse_dir_and_str "$@"
    find $dir -name $str
}

function fg() {
    parse_dir_and_str "$@"
    find $dir -type f -exec grep -Hni $str {} \;
}

function of() {
    parse_dir_and_str "$@"
    vim $(find $dir -type f -name $str)
}
