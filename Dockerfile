FROM yuxiaorui/nginx-php:latest
MAINTAINER Yu XiaoRui <yxiaorui2012@gmail.com>
RUN apt-get update && apt-get install -y git ssh --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/data/www/walle-web && cd /opt/data/www/walle-web \
    && git clone https://github.com/meolu/walle-web.git .
RUN curl -sS https://getcomposer.org/installer | php \
    && mv /opt/data/www/walle-web/composer.phar /usr/local/bin/composer
RUN cd /opt/data/www/walle-web && composer install --prefer-dist --no-dev --optimize-autoloader -vvvv && ./yii walle/setup

VOLUME ["/opt/data/www"]
EXPOSE 80
CMD ["/opt/data/www/yii walle/setup"]
