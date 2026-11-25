FROM dhi.io/httpd:2.4.71-debian13@sha256:cb572352c2f89483e235955d3fd5e634aaf8d93b88030d5cdfca112ead951a98

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
