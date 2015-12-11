## Newest version now
FROM phusion/baseimage:0.9.18

RUN apt-get update -q && apt-get install -y polipo

RUN mkdir /etc/service/polipo
ADD polipo.sh /etc/service/polipo/run

VOLUME ["/etc/polipo"]

## Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## addtional port
EXPOSE 8123

## init system
CMD ["/sbin/my_init"]
