# docker-runtime-builds

Code & sample apps (NodeJS only for the moment) to build and run apps containers from source code and without dedicated Dockerfile

**Purpose:** when bootstraping a project, using this enables to deploy and update container on an orchestrator without configuring a pipeline for images builds.

## Example

#### NodeJS

```bash
docker run \
  -e GIT_USER="JohnDoe" \
  -e GIT_TOKEN=ghp_ThisIsPersonalAccessToken \
  -e REPO_URL="https://github.com/makeitsaas/docker-runtime-builds" \
  -e GIT_TAG=v0.0.3 \
  -it node:18-alpine \
  sh -c "wget -O - https://raw.githubusercontent.com/makeitsaas/docker-runtime-builds/main/init-node.sh | sh"
```

#### Nginx
```bash
docker run \
  -e GIT_USER="JohnDoe" \
  -e GIT_TOKEN=ghp_ThisIsPersonalAccessToken \
  -e REPO_URL="https://github.com/makeitsaas/docker-runtime-builds" \
  -e CONFS_DIR="./nginx/conf.d" \
  -e WWW_DIR="./nginx/html" \
  -e GIT_TAG=v0.0.6 \
  -it nginx:stable \
  sh -c "wget -O - https://raw.githubusercontent.com/makeitsaas/docker-runtime-builds/main/init-nginx.sh | sh"
```
