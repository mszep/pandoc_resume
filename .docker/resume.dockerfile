FROM drianthoderyme/pandoc-resume

ENV HOME=/home/resumeuser
ENV $MAIN_DIR=$HOME/$GITHUB_WORKSPACE/


WORKDIR ${HOME}

COPY . ${MAIN_DIR}
COPY ./Makefile ${MAIN_DIR}

WORKDIR ${$MAIN_DIR}
