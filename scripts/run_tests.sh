#!/bin/bash
# Copyright (c) 2011-2019, wradlib developers.
# Distributed under the MIT License. See LICENSE.txt for more info.

set -e

if [[ "$TRAVIS" == "true" ]]; then
    # export location of .coveragerc
    export COVERAGE_PROCESS_START=$WRADLIB_BUILD_DIR/.coveragerc
    pytest -n 2 --verbose --doctest-modules --durations=15 --cov-report xml:coverage.xml --cov=wradlib $1
else
    pytest --verbose --doctest-modules --durations=15 $1
fi
