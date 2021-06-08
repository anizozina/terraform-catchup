## リポジトリについて

terraform のキャッチアップ用。  
[公式のチュートリアル](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/gcp-get-started)を参考。

## 利用方法

- variables.tf の project に deploy 先を入れておく。
- `export GOOGLE_APPLICATION_CREDENTIALS=~/$KEY_FILE.json`で認証を設定しておく

`terraform apply` でデプロイ可能。

SSH でログインするためには、 `gcloud compute ssh terraform-test-instnace --project ${project} --zone asia-northeast1-b` でアクセスできる
