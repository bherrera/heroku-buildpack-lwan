#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

LWAN_TEST_CACHE="/tmp/lwan-test-cache"
DEFAULT_LWAN_VERSION="master"

_full_lwan() {
  local lwanVersion=${1:-${DEFAULT_LWAN_VERSION}}
  local lwanBaseDir="${2:-${LWAN_TEST_CACHE}/full}"
  local lwanExe="${lwanBaseDir}/lwan-${playVersion}/build/lwan"
  local lwanUrl="https://github.com/lpereira/lwan"
  local lwanCommand="$(installLwan ${lwanVersion} ${lwanBaseDir} ${lwanExe} ${lwanUrl})"
  echo "${lwanCommand}"
}

installLwan() {
  local lwanVersion=$1
  local lwanBaseDir=$2
  local lwanExe=$3
  local lwanUrl=$4
  if [ ! -x ${lwanExe} ]; then
    mkdir -p ${lwanBaseDir}
    local currentDir="$(pwd)"
    cd ${lwanBaseDir}
    git clone ${lwanURL}
    #curl --silent --max-time 300 --location ${playURL} | tar xz
    #chmod +x ${playExe}
    #cd ${currentDir}
  fi
  echo "${lwanExe}"
}

getPlayApp() {
  local lwanVersion=${1:-${DEFAULT_LWAN_VERSION}}
  local appBaseDir="${LWAN_TEST_CACHE}/app-${lwanVersion}"
  if [ ! -f ${appBaseDir}/conf/lwan.conf ]; then
    $(_full_lwan ${lwanVersion}) new ${appBaseDir} --name app >/dev/null
  fi
  cp -r ${appBaseDir}/. ${BUILD_DIR}
  assertTrue "${BUILD_DIR}/conf/lwan.conf should be present after creating a new app." "[ -f ${BUILD_DIR}/conf/lwan.conf ]"
}

newLwanApp() {
  local appBaseDir="$1"
  local lwanVersion=${2:-${DEFAULT_LWAN_VERSION}}
  $(_full_lwan ${lwanVersion}) new ${appBaseDir}/.lwanapp --name app >/dev/null
  cp -r ${appBaseDir}/.lwanapp/. ${appBaseDir}
}

definePlayAppVersion() {
  local lwanVersion=$1
  cat > ${BUILD_DIR}/conf/dependencies.yml <<EOF
require:
    - lwan ${lwanVersion}
EOF
}

testNewAppGetsSystemPropertiesFile() {
  #newLwanApp "${BUILD_DIR}"
  #rm -rf ${CACHE_DIR}
  compile
  assertCapturedSuccess
  assertCaptured "Compiling lwan"
}
