apk add git
git config --global credential.helper "!f() { echo 'username=$GIT_USER'; echo 'password=$GIT_TOKEN'; };f"
cd /srv
if [ ! -d "./repo" ]; then git clone $REPO_URL repo; fi
cd repo
if [ ! -z "$GIT_TAG" ]; then git checkout $GIT_TAG; fi
if [ ! -z "$APP_DIR" ]; then cd $APP_DIR; fi
yarn install
yarn run start
