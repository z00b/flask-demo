#!/bin/bash

echo dumping test-results.out
cat test-results.out
fix-it test-results.out hello/hello_app.py
exit 1
