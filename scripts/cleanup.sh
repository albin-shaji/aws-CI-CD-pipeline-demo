#!/bin/bash
set -e

APP_DIR="/home/ubuntu/app"

mkdir -p $APP_DIR
rm -rf ${APP_DIR:?}/*
chown -R jenkins:jenkins $APP_DIR
chmod -R 755 $APP_DIR
