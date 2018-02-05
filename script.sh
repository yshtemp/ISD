setup_git() {
  git config --global user.name "$username"
  git config --global user.email $email
}

commit_files() {
  git add .
  git commit -m "Sync $TRAVIS_CURRENT_DATE"
}

upload_files() {
  git remote add github https://$GIT_OAUTH_TOKEN_CHM@github.com/yshtemp/ISD.git > /dev/null 2>&1
  git push --quiet --set-upstream github master
}


for i in 0 {01..300}; do curl -s http://www.islamspirit.com/islamspirit_ency_$i.php | grep "chm" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq >> links.txt ; done
wget -qq -i links.txt
for file in *.zip; do unzip $file && rm $file ; done
mkdir files
mv *.chm files/
export TRAVIS_CURRENT_DATE=$(date +"%d%m%y-%Hh%Mm")
cd ${TRAVIS_BUILD_DIR}/IDS/
setup_git
commit_files
upload_files
