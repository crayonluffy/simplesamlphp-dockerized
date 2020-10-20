FROM centos/php-73-centos7

MAINTAINER cmting <chiu-ming.ting@polyu.edu.hk>

ENV SIMPLESAML_DIR=/var/simplesamlphp

USER root

RUN ssp_version=1.18.4; \
    wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v$ssp_version/simplesamlphp-$ssp_version.tar.gz -P /tmp/ \
    && cd /var \
    && tar -xvzf /tmp/simplesamlphp-$ssp_version.tar.gz \
    && mv simplesamlphp-$ssp_version simplesamlphp \
    && rm /tmp/simplesamlphp-$ssp_version.tar.gz

RUN mkdir -p        /opt/app-root/src \
&&  chown -R 1001:0 /opt/app-root \
&&  chown -R 1001:0 /var/simplesamlphp \
&&  chmod -R og+rwx /opt/app-root \
&&  chmod -R og+rwx /var/simplesamlphp \
&&  chmod -R +x     $STI_SCRIPTS_PATH

RUN echo $'\nSetEnv SIMPLESAMLPHP_CONFIG_DIR /var/simplesamlphp/config\n \
<Directory /var/simplesamlphp/www>\n \
    Require all granted\n \
</Directory>\n' \
       >> /etc/httpd/conf/httpd.conf

USER 1001

#This will be executed automatically
COPY bin/assemble $STI_SCRIPTS_PATH/assemble

EXPOSE 8080 8443

WORKDIR /var/simplesamlphp
CMD $STI_SCRIPTS_PATH/run
