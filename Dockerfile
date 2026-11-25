FROM dhi.io/httpd:2.4.71-debian13@sha256:95c347bd56bc2f5a393e5157e734f2f9553abcf124ec3ac4b2d86a3d7f0b10c7

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
