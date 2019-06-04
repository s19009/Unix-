for file in "$@"
do
    if [ -f "$file" ]; then
       do "$file"
    else
        echo "${file}: 通常のファイルではありません"
    fi
done 
