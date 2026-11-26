FROM dhi.io/httpd:2.4.71-debian13@sha256:34f9908a39d7e5c9c12c4a9952cffa2ee729fa09755d20cabcabc85a451f08ab

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
