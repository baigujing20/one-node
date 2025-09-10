#!/usr/bin/env sh

PORT="${PORT:-8080}"
UUID="${UUID:-c46e6988-4aaa-4060-a1ab-3fbd5f5d5cf0}"

# 1. init directory
mkdir -p app/xray
cd app/xray

# 2. download and extract Xray
wget https://github.com/baigujing20/one-node/releases/download/xray/Xray-linux-64.zip
unzip Xray-linux-64.zip
rm -f Xray-linux-64.zip

# 3. add config file
wget https://github.com/baigujing20/one-node/releases/download/xray/config.json

# 4. create startup.sh
wget https://github.com/baigujing20/one-node/releases/download/xray/startup.sh
sed -i 's#$PWD#'$PWD'#g' startup.sh
chmod +x startup.sh

# 5. start Xray
$PWD/startup.sh

# 6. print node info
echo '---------------------------------------------------------------'
echo "vless://$UUID@example.domain.com:443?encryption=none&security=tls&alpn=http%2F1.1&fp=chrome&type=xhttp&path=%2F&mode=auto#idx-xhttp"
echo '---------------------------------------------------------------'
