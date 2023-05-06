/* 
Provider Block

公式 -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs#aws-configuration-reference
※ Privider Blockでは、terraformを実行するために、AWSにCLIでアクセスできる認証を記載する必要がある。
※ aws cliは、(access_keyとsecret_access_key)を指定しなければ動かないので、ここでそれらを指定するための記述をする。

*/

# デフォルトprovider
# resources側で、providerの指定がない場合は、これが使われる。
provider "aws" {

  region = "ap-northeast-1"
  # "~/.aws/credential" に設定してあるprofileを指定して、その設定を使うことができる。
  profile = "default"
  # -> aliasパラメータがない場合は、それがデフォルトproviderになる。

}


# resource側で、 "provider = aws.aws-west-1-provider" と指定があれば、こちらが使われる。
provider "aws" {
  region  = "us-west-1"
  profile = "default"
  alias   = "aws-west-1-provider"

}

