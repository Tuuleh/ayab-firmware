#!/bin/bash
set -e
# change to script directory
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

mkdir -p build
cd build
cmake ..
make
GTEST_COLOR=1 ctest --output-on-failure .
cd ../..
gcovr -r . -e test_* -e arduino_mock* --html-details -o ./test/build/coverage.html
gcovr -r . -e test_* -e arduino_mock*
gcovr -r . --branches -e test_* -e arduino_mock*