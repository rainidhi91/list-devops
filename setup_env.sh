./dotenv -f "$1" set CI_REGISTRY_USER=$CI_REGISTRY_USER
./dotenv -f "$1" set CI_JOB_TOKEN=$CI_JOB_TOKEN
./dotenv -f "$1" set CI_REGISTRY=$CI_REGISTRY
./dotenv -f "$1" set IMAGE=$CI_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME
# ./dotenv -f gitlab.dev.env set CONTAINER_BUILD_IMAGE=$CONTAINER_BUILD_IMAGE
# ./dotenv -f gitlab.dev.env set CONTAINER_DEV_IMAGE=$CONTAINER_DEV_IMAGE
# ./dotenv -f gitlab.dev.env set CONTAINER_RELEASE_IMAGE=$CONTAINER_RELEASE_IMAGE
# ./dotenv -f gitlab.dev.env set CONTAINER_TEST_IMAGE=$CONTAINER_TEST_IMAGE
# docker login -u gitlab-ci-token -p $GITLAB_TOKEN registry.gitlab.com
