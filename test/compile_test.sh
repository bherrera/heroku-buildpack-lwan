#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testSimpleCompilation() {
  compile
  assertCapturedSuccess
  assertCaptured "Compiling lwan..."
}
