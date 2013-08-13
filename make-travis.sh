#!/bin/bash
#
# write .travis.yml file to working dir
#

if [ ! -d .git ]; then 
	echo "working dir isn't a git repository"
	exit 1 
fi

if [ -f .travis.yml ]; then
	echo ".travis.yml already exists"
	exit 1
fi

if [ $# -ne 2 ]; then
	echo "Usage: `basename $0` {username} {password}"
	exit 1
fi

username=`travis encrypt --no-interactive --skip-version-check "CI_DEPLOY_USERNAME='$1'"`
password=`travis encrypt --no-interactive --skip-version-check "CI_DEPLOY_PASSWORD='$2'"`

cat > .travis.yml <<TEMPLATE
# deploy Maven artifacts to Sonatype OSS repo
language: java

jdk:
  - openjdk6

# whitelist
branches:
  only:
    - master

# checkout settings
before_install: 
  - "git clone -b master https://github.com/molindo/travis-settings.git target/travis-settings"
  - "target/travis-settings/tasks/before_install.sh"

# install and deploy
install: "target/travis-settings/tasks/install.sh"
script:  "target/travis-settings/tasks/script.sh"

# travis encrypt 'CI_DEPLOY_USERNAME=username'
# travis encrypt 'CI_DEPLOY_PASSWORD=password'
env:
  global:
    - secure: ${username}
    - secure: ${password}
TEMPLATE

