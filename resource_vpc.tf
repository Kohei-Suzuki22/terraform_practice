resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myvpc"
  }
  
}

resource "aws_vpc" "myvpc-us-west" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "mycpc-us-west"
  }
  # デフォルトではないproviderを使いたい場合は、provider = "<providerName>.<alias>"
  provider = aws.aws-west-1-provider
}