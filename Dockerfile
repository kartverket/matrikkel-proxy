FROM dhi.io/httpd:2.4.71-debian13@sha256:2695dc10ef403a9bd4eb5c67a7206945c48f5180111277ba70756a46735603f1

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
