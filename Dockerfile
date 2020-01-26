FROM buildkite/puppeteer:v1.15.0

# AWS CLIをインストールするためのパッケージをインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
  unzip \
  python-dev

# AWS CLIのインストール
WORKDIR /tmp
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
