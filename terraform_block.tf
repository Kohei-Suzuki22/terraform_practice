/*
terraformブロック:

*/

terraform {
  # 「このバージョンのterraformなら動きます」と言う宣言。
  # このバージョンに該当しないCLIで実行された場合は、エラーを返す。
  required_version = "~> 1.3.9"
  # 使用するプロバイダを指定する。
  # ※ ここで記述したプロバイダのバージョンが、"terraform init" した際にダウンロードされる。
  required_providers {
    aws = {
      # 
      source = "hashicorp/aws"
      # 使用するプロバイダのバージョン。
      version = "~> 4.65.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }

  # tfstateファイルを保存する場所を指定。
  # "terraform apply" を実行したら、指定したpathにtfstateファイルを置く。
  backend "s3" {
    bucket = "terraform-practice"
    key = "tfstate-path/terraform.tfstate"
    region = "ap-northeast-1"
  }
  
  
  # プロバイダにメタデータを渡す。
  # Terraform documentation says not needed in many cases (公式ドキュメントが、ほとんどの場合はこの指定は必要ないだろうと記述している。)
  #(必須じゃない。)
  provider_meta "my-provider" {
    hello = "world"
  }
}