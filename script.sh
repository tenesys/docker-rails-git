#!/bin/bash

if [ -f "$APP_DIR/,git/" ]
then
 git pull $GIT_REPO $APP_DIR
 if [ $? -ne 0 ]
 then
  echo "git pull was unsuccessful"
  exit 1
 fi
else
 git clone $GIT_REPO $APP_DIR
 if [ $? -ne 0 ]
 then
  echo "git clone was unsuccessful"
  exit 1
 fi
fi
cd $APP_DIR
bundle install 
unicorn 



