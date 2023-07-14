#!/bin/bash

set -o pipefail

OUTPUT=test-results.out
THE_FILE=hello/hello_app.py

push_fix() {
  git config --global user.email "rob@zuber.net"
  git config --global user.name "Robert Zuber"
  git add ${THE_FILE}
  git commit -m "CircleCI Suggested Fixes"
  git push origin HEAD
}


mkdir -p test-results

# if it passes on the original attempt, the build should be
# green. otherwise this build is red, but we try to create
# a new, fixed build

pytest --junitxml=test-results/junit.xml | tee ${OUTPUT}
if [[ $? -eq 0 ]]; then
  exit 0
fi

for ((i=0; i<10; i++)); do
  fix-it test-results.out ${THE_FILE}

  pytest --junitxml=test-results/junit.xml | tee ${OUTPUT}

  if [[ $? -eq 0 ]]; then
    echo "Validation succeeded."
    push_commit
    break
  else
    echo "Validation failed. Attempting checkout..."
    git checkout ${THE_FILE}
  fi
done

exit 1
