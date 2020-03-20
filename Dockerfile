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
ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m \
    --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
    && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

USER ${DOCKER_USER}

WORKDIR /home/${DOCKER_USER}/app
