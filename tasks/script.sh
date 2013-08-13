#!/bin/bash

# deploy artifacts
mvn --settings=target/travis-settings/settings.xml -B "$@" deploy

