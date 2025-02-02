#!/bin/bash
# Original source: https://github.com/Bookshelf-Writer/scripts-for-integration/blob/main/_run/creator_const_json.sh

dir_path=""
file_name="const.json"

#############################################################################
#############################################################################

run_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
values_dir="$run_dir/values"
script_dir="$run_dir/scripts"
root_path=$(cd "$run_dir/.." && pwd)

DATE_NOW=$(date +"%m-%d-%Y")
NAME=$(bash "$script_dir/sys.sh" -n)
HASH=$(bash "$script_dir/git.sh" -h)

VERSION=$(bash "$script_dir/sys.sh" -v)
VERSION_MAJOR=$(bash "$script_dir/sys.sh" -ma)
VERSION_MINOR=$(bash "$script_dir/sys.sh" -mi)
VERSION_PATCH=$(bash "$script_dir/sys.sh" -pa)

#############################################################################
          ################[ File generation ]################

file_const="$root_path/$dir_path$file_name"

echo "{" > "$file_const"
echo -e "\t \"name\": \"$NAME\"", >> "$file_const"
echo -e "\t \"date\": \"$DATE_NOW\"," >> "$file_const"
echo -e "\t \"hash\": \"$HASH\"," >> "$file_const"

echo -e "\t \"ver\": {" >> "$file_const"
echo -e "\t\t \"global\": \"$VERSION\"," >> "$file_const"
echo -e "\t\t \"major\": \"$VERSION_MAJOR\"," >> "$file_const"
echo -e "\t\t \"minor\": $VERSION_MINOR," >> "$file_const"
echo -e "\t\t \"patch\": $VERSION_PATCH" >> "$file_const"
echo -e "\t }" >> "$file_const"

echo "}" >> "$file_const"
exit 0