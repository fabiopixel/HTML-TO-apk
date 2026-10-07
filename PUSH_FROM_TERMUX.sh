#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "BREW//POP Android Cloud Build"
echo
command -v git >/dev/null 2>&1 || pkg install git -y
command -v gh >/dev/null 2>&1 || pkg install gh -y
if ! gh auth status >/dev/null 2>&1; then
  gh auth login
fi
git init
git add .
git config user.name >/dev/null 2>&1 || git config user.name "BREW POP Mobile"
git config user.email >/dev/null 2>&1 || git config user.email "mobile@brewpop.local"
git commit -m "BREW POP Android Cloud Build" || true
printf "Nome repository GitHub [brew-pop-android]: "
read REPO
REPO=${REPO:-brew-pop-android}
gh repo create "$REPO" --private --source=. --remote=origin --push
echo
echo "Caricato. Apri GitHub > $REPO > Actions > Build BREW POP APK."
