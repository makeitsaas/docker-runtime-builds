apt update && apt install git
git config --global credential.helper "!f() { echo 'username=$GIT_USER'; echo 'password=$GIT_TOKEN'; };f"
cd /srv
git clone $REPO_URL repo
cd repo
if [ ! -z "$GIT_TAG" ]; then git checkout $GIT_TAG; fi
rm /etc/nginx/conf.d/default.conf
cp ${CONFS_SUBDIR:-./nginx/conf.d/}* /etc/nginx/conf.d
