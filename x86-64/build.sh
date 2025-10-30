#!/bin/bash
# 设置应用包名
LINGLONG_APPID=com.brave.brave-browser
# 设置安装包下载链接
ZIP_URL=https://github.com/brave/brave-browser/releases/download/v1.84.132/brave-browser-1.84.132-linux-amd64.zip

# 进入工作目录
cd linglong/sources

# 再删除过时的应用程序库与文件
rm -rf ${LINGLONG_APPID} target.zip
# 调用wget下载AppImage
wget -O target.zip ${ZIP_URL}
# 解包zip并进入工作目录
mkdir ${LINGLONG_APPID} && cd ${LINGLONG_APPID} && unzip ../target.zip
# 删除多余的文件
rm -rf *.png
# 退回上一级
cd ..

# 退回至玲珑应用项目根目录
cd ../..

ll-builder build --skip-output-check && ll-builder export --layer -z lzma
