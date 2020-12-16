FROM alpine:3.12

RUN apk update && apk upgrade -U -a && apk add --no-cache tzdata apache2 php$phpverx-apache2 \
    supervisor postfix php7 php7-fpm php7-opcache apache2-proxy apache2-ssl \
    && mkdir /var/log/supervisor \
    && echo "maillog_file=/var/log/maillog" >> /etc/postfix/main.cf

#    && ln -sf /dev/stdout /var/log/apache2/access.log \
#    && ln -sf /dev/stderr /var/log/apache2/error.log

COPY ./start.sh /usr/local/bin/
COPY ./supervisord.conf /etc/
EXPOSE 80

CMD ["start.sh"]

HEALTHCHECK --start-period=15s --interval=10s --timeout=3s --retries=2    CMD pgrep httpd

