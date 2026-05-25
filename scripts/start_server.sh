#!/bin/bash

cd /home/ubuntu/sample-microservice

nohup npm start > app.log 2>&1 &
