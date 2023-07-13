#!/bin/bash

THE_FILE=hello/hello_app.py

fix-it test-results.out ${THE_FILE}
git config --global user.email "rob@zuber.net"
git config --global user.name "Robert Zuber"
git add ${THE_FILE}
git commit -m "FTFW"
git push origin HEAD
exit 1
