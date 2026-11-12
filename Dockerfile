FROM dhi.io/httpd:2.4.71-debian13@sha256:6289541129eca355ad7830114ac8e8fadf1447ea42b011d87fa8f102566b1809

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
