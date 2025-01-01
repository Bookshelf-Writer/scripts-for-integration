#!/bin/bash
# Original source: https://github.com/Bookshelf-Writer/scripts-for-integration/blob/main/_run/creator_const_C.sh

dir_path=""
file_name="const.h"

#############################################################################
#############################################################################

run_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
values_dir="$run_dir/values"
script_dir="$run_dir/scripts"
root_path=$(cd "$run_dir/.." && pwd)

DATE_NOW=$(date +"%m-%d-%Y")
KEY_CRYPT=$(cat "$values_dir/key_crypt.txt")
NAME=$(bash "$script_dir/sys.sh" -n)
HASH=$(bash "$script_dir/git.sh" -h)

VERSION=$(bash "$script_dir/sys.sh" -v)
VERSION_MAJOR=$(bash "$script_dir/sys.sh" -ma)
VERSION_MINOR=$(bash "$script_dir/sys.sh" -mi)
VERSION_PATCH=$(bash "$script_dir/sys.sh" -pa)

#############################################################################
          ################[ File generation ]################

file_const="$root_path/$dir_path$file_name"
APP_NAME=$(echo $NAME | tr '[:lower:]' '[:upper:]' | tr -c '[:alnum:]' '_')

echo "#ifndef BUILD_${APP_NAME}_CONST_H" > "$file_const"
echo "#define BUILD_${APP_NAME}_CONST_H" >> "$file_const"

echo "" >> "$file_const"
echo -e "\t #define GlobalName \"$NAME\"" >> "$file_const"
echo -e "\t #define GlobalDateUpdate \"$DATE_NOW\"" >> "$file_const"
echo -e "\t #define GlobalHash \"$HASH\"" >> "$file_const"
echo -e "\t #define DEF_KeyCrypt \"$KEY_CRYPT\"" >> "$file_const"

echo "" >> "$file_const"
echo -e "\t #define GlobalVersion \"$VERSION\"" >> "$file_const"
echo -e "\t #define GlobalVersionMajor \"$VERSION_MAJOR\"" >> "$file_const"
echo -e "\t #define GlobalVersionMinor $VERSION_MINOR" >> "$file_const"
echo -e "\t #define GlobalVersionPatch $VERSION_PATCH" >> "$file_const"

echo "" >> "$file_const"
echo "#endif //BUILD_${APP_NAME}_CONST_H" >> "$file_const"
exit 0