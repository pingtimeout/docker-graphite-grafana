# DOCKER-VERSION 0.4.0

FROM ubuntu:trusty

# Install required packages
RUN apt-get update && apt-get install -y \
    adduser \
    gunicorn \
    libfontconfig \
    nginx-light \
    python-cairo \
    python-django \
    python-django-tagging \
    python-ldap \
    python-memcache \
    python-pip \
    python-pysqlite2 \
    python-simplejson \
    python-support \
    python-twisted \
    supervisor \
    wget

RUN pip install \
    pytz \
    whisper
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib" carbon
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/webapp" graphite-web

# Grafana
RUN wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.6.0_amd64.deb ;\
    dpkg -i grafana_2.6.0_amd64.deb ;\
    rm grafana_2.6.0_amd64.deb

# Add graphite webapp config
ADD ./initial_data.json /var/lib/graphite/webapp/graphite/initial_data.json
ADD ./local_settings.py /var/lib/graphite/webapp/graphite/local_settings.py
RUN cd /var/lib/graphite/webapp/graphite && python manage.py syncdb --noinput

# Add system service config
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add graphite carbon config
ADD ./carbon.conf /var/lib/graphite/conf/carbon.conf
ADD ./storage-schemas.conf /var/lib/graphite/conf/storage-schemas.conf
RUN cp -r /var/lib/graphite/conf/ /graphite_conf/
ADD ./startup.sh /startup.sh
RUN mkdir -p /var/lib/graphite/storage/whisper
RUN touch /var/lib/graphite/storage/graphite.db /var/lib/graphite/storage/index
RUN chown -R www-data /var/lib/graphite/storage
RUN chmod 0775 /var/lib/graphite/storage /var/lib/graphite/storage/whisper
RUN chmod 0664 /var/lib/graphite/storage/graphite.db

# Add grafana config
ADD ./grafana-defaults.ini /usr/share/grafana/conf/defaults.ini

# Nginx
EXPOSE :80
# Carbon line receiver port
EXPOSE :2003
# Carbon pickle receiver port
EXPOSE :2004
# Carbon cache query port
EXPOSE :7002
# Grafana
EXPOSE :3000

VOLUME ["/usr/share/grafana/data"]
VOLUME ["/var/lib/graphite/storage/whisper"]
VOLUME ["/var/lib/graphite/conf/"]

CMD ["/usr/bin/supervisord"]

# vim:ts=8:noet: