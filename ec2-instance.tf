

/*
tf.jsonの文法

# テンプレート
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # 引数
}

# Block type: トップレベルに記述するか、そのブロックの中に入れ子に記述する。

- トップレベルのBlockType:

  - 基本ブロック:
    - resource: terraformの設定についてを記述する。
    - provider: 使用するプロバイダを指定する。(AWS, Azure, GCP, ..など)
    - Resource: リソースの定義。
  
  - 変数ブロック:
    - Input Variables: 
    - Oputput Values:
    - Local Values:
  
  - calling/Referencingブロック:
    - Data Sources:   情報をクラウドプロバイダから取得するための記述。
    - Modules Block:  moduleとして定義して、それを呼び出して使うことによって、リソースを柔軟に作る。 

- ブロック内に入れ子でBlockTypeの例:
  - provisioners
  - resource specific blocks (例:tagsなど)


# Block labels: Block typeに続けて、引数のように指定する。

※ Block labelsは、1 or 2 個指定される。

- Block typeが "resource" の場合: 2個指定する。
- Block typeが "variables" の場合: 1個指定する。



# Block body: リソースの内容。(Block typeと Block labels が、リソースの対象を指定しているとすると、block bodyは、その中身を定義する。)

- <ARGUMENT NAME> = <ARGUMENT VALUE>
- <IDENTIFIER> = <EXPRESSION> 



*/



# Resource Block
resource "aws_instance" "ec2demo" {
  ami = "ami-0e0820ad173f20fbb" #amazon Linux in ap-northeast-1, update as
  instance_type = "t2.micro"
}


/*
terraformコマンドの基本コマンド

# terraform init
-> 作業ディレクトリのリソース作成に必要なプラグインファイルをダウンロードしてくる。

# terraform validate
-> 作業ディレクトリのtfファイルの宣言が、有効であるか検証する。(文法的なミスを確認できる)

# terraform plan
-> 作業ディレクトリのtfファイルの適用でリソースがどのように変化するのかを出力する。(現状のtfstateとの状態の違いを表示する)
-> terraform apply の前に実行する必要がある。

# terraform apply
-> 作業ディレクトリのtfファイルを適用する。
-> リソースを実際に追加・変更・削除する。

# terraform destroy
-> 作業ディレクトリのtfファイルの内容をリソースから削除する。(tfstateの状態からtfファイルの内容を削除)
*/


