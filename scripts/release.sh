#!/bin/bash
echo: "\nStarting Release script."

echo -e "\nSetting current machine state to clean."
git reset HEAD --hard
git clean -xdf

echo -e "\nPulling latest changes."
git pull

echo -e "\nInstalling & Building Project."
# These two steps are not fully necessary as they happen on the pipeline BUT they would shout any issues BEFORE tagging the release
npm install
npm run build

npm run dry_release

echo -e "\n👀 Do the above changes look correct? (y/n)"
read -r -t 60 key
if [[ $key == 'y' || $key == 'Y' ]]; then
  npm run release
else
  echo -e "\n No release is being created"
  exit 1
fi

git push --follow-tags origin main
exit 0