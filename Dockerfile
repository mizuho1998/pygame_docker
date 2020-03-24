FROM python:3

# 動作確認用のGUIアプリをインストール
RUN apt-get update \
    && apt-get install -y x11-apps \
    && apt-get -y install libsdl-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev \
    && apt-get -y install libsmpeg-dev libportmidi-dev libavformat-dev libswscale-dev \
    && apt-get -y install locales \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install pygame

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

# ユーザーを作成
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
ARG DOCKER_UID=1000
ARG DOCKER_GID=1000

RUN useradd -m ${DOCKER_USER} && \
    echo "$DOCKER_USER:$DOCKER_PASSWORD" | chpasswd && \
    usermod --shell /bin/bash ${DOCKER_USER} && \
    usermod  --uid ${DOCKER_UID} ${DOCKER_USER}
    # groupmod --gid ${DOCKER_GID} ${DOCKER_USER}

USER ${DOCKER_USER}

WORKDIR /home/${DOCKER_USER}/app
