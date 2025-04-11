FROM node:22

RUN <<EOF
  curl --silent --show-error --fail --proto "=https" --output awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
  unzip awscliv2.zip
  rm awscliv2.zip
  ./aws/install

  curl --silent --show-error --fail --proto "=https" --location --output go.tar.gz https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
  tar -C /usr/local -xzf go.tar.gz
  rm go.tar.gz
  ln -s /usr/local/go/bin/go /usr/local/bin/go

  npm install --ignore-scripts --global aws-cdk
EOF

RUN adduser user
USER user

WORKDIR /cdk
