FROM centos/php-73-centos7

LABEL maintainer="crayonluffy@gmail.com"

USER 0

RUN ssp_version=1.18.4; \
    wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v$ssp_version/simplesamlphp-$ssp_version.tar.gz -P /tmp/ \
    && cd /var \
    && tar -xvzf /tmp/simplesamlphp-$ssp_version.tar.gz \
    && mv simplesamlphp-$ssp_version simplesamlphp \
    && rm /tmp/simplesamlphp-$ssp_version.tar.gz

USER 1001

WORKDIR /var/simplesamlphp

EXPOSE 8080 8443
