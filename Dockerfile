FROM httpd:2.4.62-alpine3.20@sha256:741553a657df26d0adb4e6403c0da1700fbb0dd4e0544a8e01eeea3e7a4c592b

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
