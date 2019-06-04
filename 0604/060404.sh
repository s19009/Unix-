if [ -d "$1" ]; then
    for file in $(ls "$1")
    do
        if [ ! -r "${1}/$file" ]; then
            echo "$file"
        fi
    done
else
    # エラーメッセージ
    echo "$1: ディレクトリではありません"
fi

