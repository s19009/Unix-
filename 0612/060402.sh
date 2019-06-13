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

for file in "$@"
do
    if [ -f "$file" ]; then
       du "$file"
    else
        echo "${file}: 通常のファイルではありません"
    fi
done 
