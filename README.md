# docker-rails-git

This is a Dockerfile to build rails apps images with unicorn as a main process. 

## Usage 

The image expects `Gemfile` and a private key to access a git repository upon building. Upon start the container clones or pulls the `$GIT_REPO` repository to `$APP_DIR`, runs `bundle install` and unicorn. 

Rails version used in the image is 4.1.4
