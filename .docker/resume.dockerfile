FROM drianthoderyme/pandoc-resume


ENV HOME=/home/app
WORKDIR $HOME

ENV APP_NAME=resume

# before switching to user we need to set permission properly
# copy all files, except the ignored files from .dockerignore
COPY . $HOME/$APP_NAME/
COPY ./Makefile $HOME/$APP_NAME/
WORKDIR $HOME/$APP_NAME

RUN make