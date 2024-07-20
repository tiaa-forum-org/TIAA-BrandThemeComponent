#!/usr/bin/env bash

if [  $# != 1 ]; then
  echo "1 argument of a writeable target directory required $#"
  exit 1
fi

export out_dir="$1"

if [ ! -w "${out_dir}" ]; then
  echo "output directory is not writeable: ${out_dir}"
  exit 1
fi

current_date=$(date "+%y%m%d%H%M")
current_branch=$(git branch --show-current)
export current_date, current_branch

case  ${current_branch} in
  "prod")
    pkgPrefix=""
    ;;
  "test")
    pkgPrefix="TEST:"
    ;;
  "dev")
    pkgPrefix="DEV:"
    ;;
  *)
    echo "unknown branch: " + "${current_branch}"
    exit 1
    ;;
esac

cd ../

mv about.json "${out_dir}"/about.json.orig
sed -e "/name\":/s/\",/-${current_date}\",/" "${out_dir}"/about.json.orig >about.json

zip -r "${out_dir}"/${pkgPrefix}TIAA-BrandThemeComponent-"${current_date}" ./ -x .idea/\* -x .git* -x .git/\*

mv "${out_dir}"/about.json.orig about.json

echo "zip file in: ${out_dir}/${pkgPrefix}TIAA-BrandThemeComponent-${current_date}"
