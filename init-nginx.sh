apt update && apt install -y git
git config --global credential.helper "!f() { echo 'username=$GIT_USER'; echo 'password=$GIT_TOKEN'; };f"
cd /srv
git clone $REPO_URL repo
cd repo
if [ ! -z "$GIT_TAG" ]; then git checkout $GIT_TAG; fi
cp ${CONFS_DIR:-./nginx/conf.d}/* /etc/nginx/conf.d || :
cp -r ${WWW_DIR:-./nginx/html}/* /usr/share/nginx/html || :
nginx -g 'daemon off;'
