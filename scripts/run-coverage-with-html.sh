#!/bin/bash

if ! command -v lcov &> /dev/null ; then echo "lcov not installed, run brew install lcov" ; exit 1; fi

# Generates `coverage/lcov.info` file
flutter test --coverage --exclude-tags excludeFromCoverage

# Excludes below files from generated report and creates new report called 'filtered-lcov.info'
lcov --output-file coverage/filtered-lcov.info --remove coverage/lcov.info \
"lib/common/http_client**" \
"lib/common/logger.dart" \
"lib/constants/**" \
"lib/data/**" \
"lib/styling/**"

# Generates html report and opens 'filtered-lcov.html' in chrome
genhtml coverage/filtered-lcov.info -o coverage/filtered-html; open coverage/filtered-html/index.html