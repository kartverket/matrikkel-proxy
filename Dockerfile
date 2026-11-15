FROM dhi.io/httpd:2.4.71-debian13@sha256:890876ce73e88cb49a698c808878aacfd578cc9cc0df82bc36d91a1fb0046122

LABEL builder.cleanup.policy=matrikkelen

# DHI-imaget er minimalt (ingen shell/pakkebehandler), inkluderer tzdata og kjører som ikke-root
ENV TZ=Europe/Oslo

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Samme bruker som DHI-imaget bruker som standard (www-data).
USER 65532
