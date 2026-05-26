#!/bin/bash

set -e

APP_DIR="/home/ubuntu/app"

cd $APP_DIR || exit 1

npm install
