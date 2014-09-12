#!/bin/bash

# compare known defaultSettings.xml with current settings.xml
diff -wu target/travis-settings/defaultSettings.xml ~/.m2/settings.xml || (echo "### commit and push new travis-settings/defaultSettings.xml:" && cat ~/.m2/settings.xml && false )

