FROM dhi.io/httpd:2.4.69-debian13@sha256:7b8d0f5d79fc1bbdca9c6253c101fdd9352fea54179063e53ad15d9b3772d01c

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
