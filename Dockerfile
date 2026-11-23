FROM dhi.io/httpd:2.4.71-debian13@sha256:67a5be2424c3dc2f7b1fea521e43d9c8686c4ce55791ca5ebf1cbfa5bd8a627a

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
