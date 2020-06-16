FROM drianthoderyme/pandoc-resume

# prepare a user which runs everything locally! - required in child images!
RUN useradd --user-group --create-home --shell /bin/false resumeuser

ENV HOME=/home/resumeuser
WORKDIR $HOME

ENV APP_NAME=resume

# before switching to user we need to set permission properly
# copy all files, except the ignored files from .dockerignore
COPY . $HOME/$APP_NAME/
COPY ./Makefile $HOME/$APP_NAME/
RUN chown -R resumeuser:resumeuser $HOME/*

USER resumeuser
WORKDIR $HOME/$APP_NAME
