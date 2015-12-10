## Newest version now
FROM phusion/baseimage:0.9.18

RUN apt-get update && apt-get install -y polipo

RUN mkdir /etc/service/polipo
ADD polipo.sh /etc/service/polipo/run
ADD etc/polipo /etc/polipo/

CMD ["/sbin/my_init"]

EXPOSE 8123

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
