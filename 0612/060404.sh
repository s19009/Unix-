usage()
{
  local script_name=$(basename "$0")
  cat << END
Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
find file in current directory recursively, and print lines which match PATTERN.

  PATH            find file in PATH directory, instead of current directory
  NAME_PATTERN    specify name pattern to find file

Examples:
  $script_name return
  $script_name return ~ '*.txt'
END
}

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi

if [ -d "$1" ]; then
    #ディレクトリ内のファイルが実行可能ファイルかチェックして
    # 実行可能ファイルであれば表示
    for file in $(find "$1" -maxdepth 1 -type f)
    do
        # ファイルが実行ファイルであれば表示
        #if [ -x "${1}/${file}" ]  && [ ! -d "${1}/${file}"  ]; then
        if [ ! -r "$file" ]; then
            #echo `basename "$file"`
            echo $(basename "$file")
        fi
    done
else
    # エラーメッセージ
    echo "$1: ディレクトリではありません"
fi

