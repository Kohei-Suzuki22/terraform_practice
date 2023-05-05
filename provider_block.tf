# Provider Block
# 公式 -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs#aws-configuration-reference
# ※ Privider Blockでは、terraformを実行するために、AWSにCLIでアクセスできる認証を記載する必要がある。
# ※ aws cliは、(access_keyとsecret_access_key)を指定しなければ動かないので、ここでそれらを指定するための記述をする。
provider "aws" {
  
  region = "ap-northeast-1"
  # "~/.aws/credential" に設定してあるprofileを指定して、その設定を使うことができる。
  profile = "default"
  
}