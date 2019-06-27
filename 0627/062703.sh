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

dir=$1
if [ -d "$1" ]; then
    f=`find $dir -type f 2> /dev/null | wc -l`
    d=`find $dir -type d 2> /dev/null | wc -l`

    echo "file =>"  $f
    echo "directory =>" $d

else
    # エラーメッセージ
    echo "$1: ディレクトリではありません"
fi
