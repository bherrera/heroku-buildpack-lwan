#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetectWithConfFileDetectsLwanApp() {
  mkdir -p ${BUILD_DIR}/conf
  touch ${BUILD_DIR}/conf/lwan.conf.erb
  detect

  assertAppDetected "Lwan"
}

testDetectWithDirDoesNotDetectsLwanApp() {
  mkdir -p ${BUILD_DIR}/conf/lwan.conf.erb
  detect

  assertNoAppDetected
}

testNoConfFileDoesNotDetectLwanApp() {
  mkdir -p ${BUILD_DIR}/conf
  detect

  assertNoAppDetected
}

