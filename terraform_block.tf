/*
terraformブロック:

- terraformのバージョン
- ダウンロードするプロバイダパッケージのバージョン
- tfstateファルの保存場所

などを設定する。

*/

terraform {
  # 「このバージョンのterraformなら動きます」と言う宣言。
  # このバージョンに該当しないCLIで実行された場合は、エラーを返す。
  required_version = "~> 1.4.6"
  # 使用するプロバイダを指定する。
  # ※ ここで記述したプロバイダのバージョンが、"terraform init" した際にダウンロードされる。
  required_providers {
    aws = {
      # source = "registry.terraform.io/hashicorp/aws" のように本来は, <HOSTNAME>/<NAMESPACE>/<TYPE>で指定するが、HOSTNAMEはデフォルトでegistry.terraform.ioとなるので省略可能。
      source = "hashicorp/aws"
      # 使用するプロバイダのバージョン。
      # ~> は、指定した一番右のバージョンのみ最新のものをとってくる。つまり、 "~> 4.66.0" の場合は0が指定した一番マイナーバージョンなので、4.66.5など、0の桁が最新のproviderパッケージがダウンロードされる。
      # "~> 4.66" の場合は66が指定した一番マイナーバージョンなので、4.70など、66の桁が最新のproviderパッケージがダウンロードされる。
      version = "~> 4.66.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }

  # tfstateファイルを保存する場所を指定。
  # "terraform apply" を実行したら、指定したpathにtfstateファイルを置く。
  backend "s3" {
    bucket = "terraform-practice"
    key    = "tfstate-path/terraform.tfstate"
    region = "ap-northeast-1"
  }


  # プロバイダにメタデータを渡す。
  # Terraform documentation says not needed in many cases (公式ドキュメントが、ほとんどの場合はこの指定は必要ないだろうと記述している。)
  #(必須じゃない。)
  provider_meta "my-provider" {
    hello = "world"
  }
}