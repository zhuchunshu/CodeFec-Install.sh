#!/bin/bash
if [ -f "./CodeFec/install.lock" ]; then
    echo "install.lock文件存在,无需重复安装"
else
    if [ -f "./CodeFec/.env" ]; then
        cd ./CodeFec
        php artisan CodeFec:Install
    else
        git clone https://github.com/zhuchunshu/CodeFec.git ./CodeFec
        cd ./CodeFec
        wget https://mirrors.cloud.tencent.com/composer/composer.phar
        php composer.phar config -g repos.packagist composer https://mirrors.cloud.tencent.com/composer/
        php composer.phar self-update
        php composer.phar install
        mv .env.example .env
        echo "执行安装命令"
        php artisan CodeFec:Install
    fi
fi
