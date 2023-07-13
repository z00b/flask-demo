#!/bin/bash

THE_FILE=hello/hello_app.py

fix-it test-results.out ${THE_FILE}
git add ${THE_FILE}
git commit -m "FTFW"
git push origin HEAD
exit 1
