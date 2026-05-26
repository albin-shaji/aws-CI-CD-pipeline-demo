#!/bin/bash

set -e

echo "Starting dependency installation..."

APP_DIR="/home/ubuntu/app"

# Ensure app directory exists
mkdir -p $APP_DIR

# Move into app directory
cd $APP_DIR || exit 1

echo "Current directory:"
pwd

echo "Installing Node.js dependencies..."

npm install

echo "Dependencies installed successfully."
