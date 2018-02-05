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
setup_git
commit_files
upload_files
