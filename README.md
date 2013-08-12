travis-settings
===============

Maven settings for Travis builds. Expects following environment variables:

- CI_DEPLOY_USERNAME
- CI_DEPLOY_PASSWORD

These variables must be added as secure values:

    travis encrypt 'CI_DEPLOY_USERNAME=username'

