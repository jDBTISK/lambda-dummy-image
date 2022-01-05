# Lambda Dummy Image

## Overview

`AWS Lambda` でデプロイパッケージに `Image` を選択した場合にとりあえず使えるイメージ

## Description

`Lambda` でデプロイパッケージに `Image` を選択した場合、関数作成時にイメージの URI を指定する必要があります。  
関数作成時点でアプリケーションのイメージが `ECR` にプッシュされていない場合に、ひとまず利用できるイメージとして用意しました。

## Development

### Requirements

- docker
- poetry
- tfenv or terraform

### Terraform

`tfenv` 経由でインストールしておくことをおすすめします。

#### backend 指定について

`backend.tf` にて `tfstate` ファイルを `S3` で管理する設定を記述していますが、バケットの指定を行っていないので、  
下記の手順でバケットの指定を行う必要があります。

```bash
cp backend.tfvars.example backend.tfvars
vi backend.tfvars # bucket の他に、ニーズに合わせて key, region なども設定できます
terraform init -backend-config="backend.tfvars"
```

#### profile 指定について

`var.aws_profile` (デフォルト値: `default`)に設定された `profile` を用いて AWS リソースを作成します。

`default` 以外の `profile` でリソースを作成したい場合は、以下の手順で設定してください。

```bash
cp terraform.tfvars.example terraform.tfvars
vi terraform.tfvars # aws_profile の設定
```

### tflint

`CI` で `tflint` が走りますが、ローカルで実行する場合、  
マシン上にインストールしなくてもいいように `docker` 経由で実行できるようにしています。

```bash
bin/tflint
```

### tfsec

`CI` で `tfsec` が走りますが、ローカルで実行する場合、  
マシン上にインストールしなくてもいいように `docker` 経由で実行できるようにしています。

```bash
bin/tfsec
```

### Usage

#### Setup

```bash
poetry install
poetry run pre-commit install
```

#### Local Run

```bash
docker-compose build
docker-compose up
curl -X POST "http://127.0.0.1:${LAMBDA_PORT}/2015-03-31/functions/function/invocations" -d '{"key":"value"}'
```
