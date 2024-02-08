FROM httpd:2.4.58-alpine3.19@sha256:5f3c87973b3e76601b2f4d8832d6075e272868815e4966d2e57823591f8da29f

LABEL builder.cleanup.policy=matrikkelen

RUN apk add --no-cache tzdata
ENV TZ=Europe/Oslo

#Bruker som skal kjøre appen, trenger ikke ROOT-rettigheter
ENV USER_ID=150 USER_NAME=apprunner

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN apk --no-cache upgrade \
    && addgroup -g ${USER_ID} -S ${USER_NAME} \
    && adduser -u ${USER_ID} -S ${USER_NAME} -G ${USER_NAME} \
    && chgrp ${USER_NAME} /usr/local/apache2/conf/httpd.conf\
    && chmod 640 /usr/local/apache2/conf/httpd.conf\
    && chown ${USER_ID} /usr/local/apache2/logs/

USER ${USER_NAME}
