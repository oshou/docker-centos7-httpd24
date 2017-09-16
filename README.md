# docker-centos7-httpd24

# 設定内容
- locale
- Timezone
- Toolsインストール
- yumキャッシュクリア
- http, httpsポートの開放

# 起動方法
- $ docker pull oshou/docker-centos7-httpd24:latest
- $ docker run -d -p 80:80 -p 443:443 oshou/docker-centos7-httpd24:latest
