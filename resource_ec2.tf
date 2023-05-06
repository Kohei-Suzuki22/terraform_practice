# EC2インスタンスの作成
# 公式 -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance


resource "aws_instance" "myec2" {
  ami               = "ami-0e0820ad173f20fbb"
  instance_type     = "t2.micro"
  # availability_zone = "ap-northeast-1a"
  availability_zone = "ap-northeast-1c"
  tags = {
    "Name" = "myec2"
    "tag1" = "update-test-1"
  }

}