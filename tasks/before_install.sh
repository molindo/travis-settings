#!/bin/bash

# compare known defaultSettings.xml with current settings.xml
diff -wu ~/.m2/settings.xml target/travis-settings/defaultSettings.xml || ( cat ~/.m2/settings.xml && false )

