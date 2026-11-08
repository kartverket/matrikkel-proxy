FROM dhi.io/httpd:2.4.70-debian13@sha256:f4d5b256132cbb8dee7432436683327008cc0d93fdc3d0c6cf776aee237c00ab

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
