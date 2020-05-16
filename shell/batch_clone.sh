#!/bin/bash
projroot_path=`pwd`
echo "$projroot_path"
while read line
do
    str=$line
    length=${#str}
    if [[ $str == *#* ]];then
        echo "ignore path : $line"
    else
    if [ $length > 24 ]; then
        relative_dir=${line:20:$length-24} #24 = http://github.com/xxx/xxx.git
        echo "relativedir: $relative_dir"
    fi
    echo $line
    if [ ! -d $relative_dir ]; then
        proj_dir="$projroot_path/$relative_dir"
        mkdir -p "$proj_dir"
        cd "$proj_dir"
        cd ..
        git clone "$line"
    fi
    cd "$projroot_path"
    echo `pwd`
    fi
done < gitpath
