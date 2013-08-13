#!/bin/bash

# download dependencies
mvn --settings=target/travis-settings/settings.xml -B -DskipTests=true "$@" install

