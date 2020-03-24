# pygame_docker

## install

1. docker のインストール

1. XQuarts のインストール(macの場合)

    *XQuarts の設定*

    iXQuartzのアプリの環境設定を開き、「セキュリティ」タブの

    - 「接続を認証」をOFF
    - 「ネットワーク・クライアントからの接続を許可」をON

    を設定する。接続後、XQuartzを再起動


## usage

1. イメージの作成

    `$ make build`

1. コンテナを立ち上げる

    `$ make up`

1. 立ち上げたコンテナに入る

    `$ make exec`

1. コンテナを削除する

    `$ make down`
