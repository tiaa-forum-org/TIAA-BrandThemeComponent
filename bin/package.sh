#!/usr/bin/env bash

if [  $# != 1 ]; then
  echo "1 argument of a writeable target directory required $#"
  exit 1
fi

export outdir="$1"

if [ ! -w "${outdir}" ]; then
  echo "output directory is not writeable: ${outdir}"
  exit 1
fi

export current_date=$(date "+%y%m%d%H%M")
export current_branch=$(git branch --show-current)

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

mv about.json ${outdir}/about.json.orig
sed -e "/name\":/s/\",/-${current_date}\",/" ${outdir}/about.json.orig >about.json

zip -r ${outdir}/${pkgPrefix}TIAA-BrandThemeComponent-${current_date} ./ -x .idea/\* -x .git* -x .git/\*

mv ${outdir}/about.json.orig about.json

echo "zip file in: ${outdir}/${pkgPrefix}TIAA-BrandThemeComponent-${current_date}"
