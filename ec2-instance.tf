# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal
  region = "ap-northeast-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami = "ami-0e0820ad173f20fbb" #amazon Linux in ap-northeast-1, update as
  instance_type = "t2.micro"
}



# terraformコマンドの基本コマンド

## terraform init
### -> 作業ディレクトリのリソース作成に必要なプラグインファイルをダウンロードしてくる。

## terraform validate
### -> 作業ディレクトリのtfファイルの宣言が、有効であるか検証する。(文法的なミスを確認できる)

## terraform plan
### -> 作業ディレクトリのtfファイルの適用でリソースがどのように変化するのかを出力する。(現状のtfstateとの状態の違いを表示する)
### -> terraform apply の前に実行する必要がある。

## terraform apply
### -> 作業ディレクトリのtfファイルを適用する。
### -> リソースを実際に追加・変更・削除する。

## terraform destroy
### -> 作業ディレクトリのtfファイルの内容をリソースから削除する。(tfstateの状態からtfファイルの内容を削除)



