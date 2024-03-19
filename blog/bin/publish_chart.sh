#!/usr/bin/env bash


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

DIR_ROOT="${DIR/\/bin/}";

export ENVIRONMENT_LOCAL="local";
export ENVIRONMENT_TEST="tst";



#
# Apply chart into the test environment with the testing container image or
# production one based on the current branch. The replica set used in the
# previous release will stick around after the release has been completed, this
# is a known bug.
#


ENV_CHART_NAME="blog";
VERSION_NUMBER="latest"

echo "Waiting for update to complete, this may take a couple of minutes...";

helm upgrade \
    --kube-context="${ENV_CHART_NAME}" \
    --install \
    --values "${DIR_ROOT}/values.yaml" \
    --set image.tag="${VERSION_NUMBER}" \
    --set mariadb.mariadbRootPassword=laravel,mariadb.mariadbUser=laravel,mariadb.mariadbPassword=laravel,mariadb.mariadbDatabase=laravel \
    --wait \
    "${ENV_CHART_NAME}" \
    "${DIR_ROOT}";

echo "Helm chart applied successfully.";
